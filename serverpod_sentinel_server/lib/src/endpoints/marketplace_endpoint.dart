import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';

class MarketplaceEndpoint extends Endpoint {
  /// Returns a list of available (but not necessarily installed) integrations.
  Future<List<Map<String, dynamic>>> listAvailableIntegrations(Session session) async {
    return [
      {
        'id': 'slack',
        'name': 'Slack',
        'description': 'Send alerts and incident updates to Slack channels.',
        'category': 'Notification',
        'isPremium': false,
      },
      {
        'id': 'pagerduty',
        'name': 'PagerDuty',
        'description': 'Sync incidents and on-call rotations with PagerDuty.',
        'category': 'Incident Management',
        'isPremium': true,
      },
      {
        'id': 'jira',
        'name': 'Jira',
        'description': 'Automatically create Jira tickets for new incidents.',
        'category': 'Ticketing',
        'isPremium': false,
      },
      {
        'id': 'datadog',
        'name': 'Datadog',
        'description': 'Forward Sentinel telemetry to Datadog dashboards.',
        'category': 'Monitoring',
        'isPremium': true,
      },
    ];
  }
}
