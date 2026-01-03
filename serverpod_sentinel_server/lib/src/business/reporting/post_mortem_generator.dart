import 'dart:convert';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';

class PostMortemGenerator {
  /// Generates a complete post-mortem report for an incident.
  Future<Map<String, dynamic>> generateReport(
    Session session,
    int incidentId,
  ) async {
    // Fetch incident with relations
    final incident = await Incident.db.findById(
      session,
      incidentId,
      include: Incident.include(
        service: Service.include(),
        rule: Rule.include(),
      ),
    );

    if (incident == null) {
      throw Exception('Incident not found: $incidentId');
    }

    // Reconstruct timeline
    final timeline = await reconstructTimeline(session, incidentId);

    // Calculate metrics
    final metrics = calculateMetrics(incident);

    return {
      'incident': {
        'id': incident.id,
        'title': incident.title,
        'summary': incident.summary,
        'severity': incident.severity.name,
        'status': incident.status.name,
        'service': incident.service?.name ?? 'Unknown',
        'rule': incident.rule?.name,
      },
      'metrics': metrics,
      'timeline': timeline,
      'generatedAt': DateTime.now().toIso8601String(),
    };
  }

  /// Calculates key incident metrics.
  Map<String, dynamic> calculateMetrics(Incident incident) {
    final createdAt = incident.createdAt;
    final startedAt = incident.startedAt;
    final resolvedAt = incident.resolvedAt;
    final acknowledgedAt = incident.acknowledgedAt;

    // TTD: Time to Detect (startedAt is when breach started, createdAt is when detected)
    Duration? ttd;
    if (startedAt != null) {
      ttd = createdAt.difference(startedAt);
    }

    // TTA: Time to Acknowledge
    Duration? tta;
    if (acknowledgedAt != null) {
      tta = acknowledgedAt.difference(createdAt);
    }

    // TTR/MTTR: Time to Resolve
    Duration? ttr;
    if (resolvedAt != null) {
      ttr = resolvedAt.difference(createdAt);
    }

    return {
      'ttdMinutes': ttd?.inMinutes,
      'ttaMinutes': tta?.inMinutes,
      'ttrMinutes': ttr?.inMinutes,
      'duration': {
        'started': startedAt?.toIso8601String(),
        'created': createdAt.toIso8601String(),
        'acknowledged': acknowledgedAt?.toIso8601String(),
        'resolved': resolvedAt?.toIso8601String(),
      },
    };
  }

  /// Reconstructs the incident timeline from database.
  Future<List<Map<String, dynamic>>> reconstructTimeline(
    Session session,
    int incidentId,
  ) async {
    final items = await IncidentTimelineItem.db.find(
      session,
      where: (t) => t.incidentId.equals(incidentId),
      orderBy: (t) => t.createdAt,
    );

    return items
        .map(
          (item) => {
            'type': item.type.name,
            'content': item.content,
            'createdAt': item.createdAt.toIso8601String(),
            'authorId': item.authorId,
          },
        )
        .toList();
  }

  /// Saves a generated report to the database for historical access.
  Future<ReportSnapshot> saveReport(
    Session session,
    int incidentId,
    Map<String, dynamic> report,
    int? userId,
  ) async {
    final snapshot = ReportSnapshot(
      incidentId: incidentId,
      generatedAt: DateTime.now(),
      generatedById: userId,
      content: jsonEncode(report),
    );

    return await ReportSnapshot.db.insertRow(session, snapshot);
  }
}
