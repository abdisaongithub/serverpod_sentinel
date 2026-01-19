import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';

/// Endpoint for managing alerts and live stream events
class AlertEndpoint extends Endpoint {
  /// Get recent alerts for the live stream view
  /// Returns the most recent alerts (default: 20)
  Future<List<StreamAlert>> getRecent(
    Session session, {
    int limit = 20,
    String? severity,
  }) async {
    // For now, generate mock alerts from recent incidents and service events
    // In production, this would query an alerts table
    final alerts = <StreamAlert>[];

    // Get recent incidents and convert to alerts
    final incidents = await Incident.db.find(
      session,
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      limit: limit ~/ 2,
    );

    for (final incident in incidents) {
      alerts.add(
        StreamAlert(
          id: incident.id!,
          serviceId: incident.serviceId,
          title: incident.title,
          message: incident.summary ?? 'Incident detected',
          severity: _mapSeverity(incident.severity),
          source: 'incident',
          timestamp: incident.createdAt,
          acknowledged: incident.status == IncidentStatus.RESOLVED,
        ),
      );
    }

    // Get services with non-operational status
    final degradedServices = await Service.db.find(
      session,
      where: (t) => t.status.notEquals(ServiceStatus.OPERATIONAL),
      orderBy: (t) => t.updatedAt,
      orderDescending: true,
      limit: limit ~/ 2,
    );

    for (final service in degradedServices) {
      alerts.add(
        StreamAlert(
          id: 10000 + service.id!,
          serviceId: service.id,
          title: '${service.name} - ${_statusLabel(service.status)}',
          message: 'Service status changed to ${_statusLabel(service.status)}',
          severity: _statusToSeverity(service.status),
          source: 'system',
          timestamp: service.updatedAt,
          acknowledged: false,
        ),
      );
    }

    // Sort by timestamp descending
    alerts.sort((a, b) => b.timestamp.compareTo(a.timestamp));

    // Filter by severity if specified
    if (severity != null) {
      return alerts.where((a) => a.severity == severity).take(limit).toList();
    }

    return alerts.take(limit).toList();
  }

  String _mapSeverity(IncidentSeverity severity) {
    switch (severity) {
      case IncidentSeverity.CRITICAL:
        return 'critical';
      case IncidentSeverity.HIGH:
        return 'critical';
      case IncidentSeverity.MEDIUM:
        return 'warning';
      case IncidentSeverity.LOW:
        return 'info';
    }
  }

  String _statusLabel(ServiceStatus status) {
    switch (status) {
      case ServiceStatus.OPERATIONAL:
        return 'Operational';
      case ServiceStatus.DEGRADED:
        return 'Degraded Performance';
      case ServiceStatus.PARTIAL_OUTAGE:
        return 'Partial Outage';
      case ServiceStatus.MAJOR_OUTAGE:
        return 'Major Outage';
      case ServiceStatus.MAINTENANCE:
        return 'Under Maintenance';
    }
  }

  String _statusToSeverity(ServiceStatus status) {
    switch (status) {
      case ServiceStatus.OPERATIONAL:
        return 'info';
      case ServiceStatus.DEGRADED:
        return 'warning';
      case ServiceStatus.PARTIAL_OUTAGE:
        return 'warning';
      case ServiceStatus.MAJOR_OUTAGE:
        return 'critical';
      case ServiceStatus.MAINTENANCE:
        return 'info';
    }
  }
}
