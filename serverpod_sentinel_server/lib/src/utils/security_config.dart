import 'package:serverpod_sentinel_server/src/generated/protocol.dart';

/// Predefined roles and their associated permissions for Phase 1 RBAC.
class SecurityConfig {
  static const String roleSuperAdmin = 'SuperAdmin';
  static const String roleSecurityAdmin = 'SecurityAdmin';
  static const String roleIncidentManager = 'IncidentManager';
  static const String roleSRE = 'SRE';
  static const String roleDeveloper = 'Developer';
  static const String roleViewer = 'Viewer';

  static Map<String, List<AppPermission>> get defaultRolePermissions => {
    roleSuperAdmin: AppPermission.values,
    
    roleSecurityAdmin: [
      AppPermission.user_manage,
      AppPermission.role_manage,
      AppPermission.audit_log_view,
      AppPermission.system_settings_view,
      AppPermission.system_settings_edit,
      AppPermission.service_view,
      AppPermission.incident_view,
    ],
    
    roleIncidentManager: [
      AppPermission.incident_view,
      AppPermission.incident_create,
      AppPermission.incident_acknowledge,
      AppPermission.incident_resolve,
      AppPermission.incident_manage_timeline,
      AppPermission.playbook_view,
      AppPermission.playbook_execute,
      AppPermission.service_view,
      AppPermission.telemetry_view,
      AppPermission.report_view_snapshots,
      AppPermission.report_generate,
    ],
    
    roleSRE: [
      AppPermission.service_view,
      AppPermission.service_create,
      AppPermission.service_edit,
      AppPermission.service_manage_rules,
      AppPermission.incident_view,
      AppPermission.incident_acknowledge,
      AppPermission.incident_resolve,
      AppPermission.incident_delete,
      AppPermission.playbook_view,
      AppPermission.playbook_create,
      AppPermission.playbook_execute,
      AppPermission.playbook_manage,
      AppPermission.telemetry_view,
      AppPermission.telemetry_export,
      AppPermission.ai_insight_view,
      AppPermission.integration_manage,
    ],
    
    roleDeveloper: [
      AppPermission.service_view,
      AppPermission.incident_view,
      AppPermission.playbook_view,
      AppPermission.telemetry_view,
      AppPermission.ai_insight_view,
    ],
    
    roleViewer: [
      AppPermission.service_view,
      AppPermission.incident_view,
      AppPermission.telemetry_view,
    ],
  };
}
