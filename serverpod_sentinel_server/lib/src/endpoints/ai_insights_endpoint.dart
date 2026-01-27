import 'dart:convert';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:serverpod_sentinel_server/src/business/security/security_checks.dart';
import 'package:serverpod_sentinel_server/src/business/ai/ai_service.dart';
import 'package:serverpod_sentinel_server/src/business/ai/anomaly_detection_service.dart';

/// AI Insights Endpoint
class AiInsightsEndpoint extends Endpoint {
  /// Helper to verify permission
  Future<void> _checkPermission(Session session, AppPermission permission) async {
    await SecurityChecks.requirePermission(session, permission);
  }

  /// Get AI-generated insights
  Future<List<AiInsight>> getInsights(
    Session session, {
    int? serviceId,
    String? type,
    int? limit,
  }) async {
    await _checkPermission(session, AppPermission.ai_insight_view);
    
    return await AiInsight.db.find(
      session,
      where: (t) {
        var conditions = t.id.notEquals(null);
        if (serviceId != null) {
          conditions = conditions & t.serviceId.equals(serviceId);
        }
        if (type != null) {
          conditions = conditions & t.type.equals(type);
        }
        return conditions;
      },
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      limit: limit ?? 20,
    );
  }

  /// Analyze an incident and generate insights
  Future<Map<String, dynamic>> analyzeIncident(
    Session session,
    int incidentId,
  ) async {
    await _checkPermission(session, AppPermission.ai_insight_regenerate);
    
    final incident = await Incident.db.findById(
      session,
      incidentId,
      include: Incident.include(
        service: Service.include(),
        timeline: IncidentTimelineItem.includeList(),
      ),
    );

    if (incident == null) throw Exception('Incident not found');

    // 1. Fetch context data
    final auditLogs = await AuditLog.db.find(
      session,
      where: (t) => t.entityType.equals('Service') & t.entityId.equals(incident.serviceId),
      limit: 20,
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );

    final recentMetrics = await MetricPoint.db.find(
      session,
      where: (t) => t.timestamp > incident.createdAt.subtract(const Duration(hours: 2)),
      limit: 100,
    );

    // 2. Attempt Real AI Analysis
    final analysis = await AiService.analyzeIncident(
      session: session,
      incident: incident,
      auditLogs: auditLogs,
      metrics: recentMetrics,
    );

    // 3. Fallback to Rule-Based analysis if AI fails/unconfigured
    if (analysis.containsKey('error')) {
      return _generateRuleBasedAnalysis(incident, auditLogs, recentMetrics);
    }

    // 4. Store insight
    await AiInsight.db.insertRow(
      session,
      AiInsight(
        type: 'analysis',
        title: 'Incident RCA: ${incident.title}',
        content: jsonEncode(analysis),
        severity: incident.severity.name.toLowerCase(),
        incidentId: incidentId,
        serviceId: incident.serviceId,
        confidence: 0.85,
        createdAt: DateTime.now(),
      ),
    );

    return analysis;
  }

  /// Trigger anomaly scan for a service
  Future<List<AiInsight>> scanForAnomalies(Session session, int serviceId) async {
    await _checkPermission(session, AppPermission.ai_insight_regenerate);
    return await AnomalyDetectionService.scanForAnomalies(session, serviceId);
  }

  Map<String, dynamic> _generateRuleBasedAnalysis(
    Incident incident,
    List<AuditLog> auditLogs,
    List<MetricPoint> metrics,
  ) {
    // Simple heuristic-based fallback (logic from original stub)
    bool highValue = metrics.any((m) => (m.value ?? 0) > 90);
    bool changeDetected = auditLogs.isNotEmpty;

    return {
      'probableRootCause': changeDetected ? 'Recent configuration change' : (highValue ? 'Resource saturation' : 'Unknown'),
      'factors': ['Metrics check', 'Audit log correlation'],
      'recommendations': [
        {'action': 'Check logs manually', 'priority': 'high', 'rationale': 'AI unconfigured'}
      ],
      'impact': {'description': 'Service visibility might be impaired.'},
      'source': 'Heuristic Engine (AI Unconfigured)'
    };
  }
}
