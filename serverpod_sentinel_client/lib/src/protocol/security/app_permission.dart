/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

/// Granular permissions for the Sentinel platform.
enum AppPermission implements _i1.SerializableModel {
  service_view,
  service_create,
  service_edit,
  service_delete,
  service_manage_rules,
  incident_view,
  incident_create,
  incident_acknowledge,
  incident_resolve,
  incident_manage_timeline,
  incident_delete,
  playbook_view,
  playbook_create,
  playbook_execute,
  playbook_manage,
  telemetry_view,
  telemetry_export,
  report_generate,
  report_view_snapshots,
  system_settings_view,
  system_settings_edit,
  user_manage,
  role_manage,
  audit_log_view,
  integration_manage,
  ai_insight_view,
  ai_insight_regenerate;

  static AppPermission fromJson(String name) {
    switch (name) {
      case 'service_view':
        return AppPermission.service_view;
      case 'service_create':
        return AppPermission.service_create;
      case 'service_edit':
        return AppPermission.service_edit;
      case 'service_delete':
        return AppPermission.service_delete;
      case 'service_manage_rules':
        return AppPermission.service_manage_rules;
      case 'incident_view':
        return AppPermission.incident_view;
      case 'incident_create':
        return AppPermission.incident_create;
      case 'incident_acknowledge':
        return AppPermission.incident_acknowledge;
      case 'incident_resolve':
        return AppPermission.incident_resolve;
      case 'incident_manage_timeline':
        return AppPermission.incident_manage_timeline;
      case 'incident_delete':
        return AppPermission.incident_delete;
      case 'playbook_view':
        return AppPermission.playbook_view;
      case 'playbook_create':
        return AppPermission.playbook_create;
      case 'playbook_execute':
        return AppPermission.playbook_execute;
      case 'playbook_manage':
        return AppPermission.playbook_manage;
      case 'telemetry_view':
        return AppPermission.telemetry_view;
      case 'telemetry_export':
        return AppPermission.telemetry_export;
      case 'report_generate':
        return AppPermission.report_generate;
      case 'report_view_snapshots':
        return AppPermission.report_view_snapshots;
      case 'system_settings_view':
        return AppPermission.system_settings_view;
      case 'system_settings_edit':
        return AppPermission.system_settings_edit;
      case 'user_manage':
        return AppPermission.user_manage;
      case 'role_manage':
        return AppPermission.role_manage;
      case 'audit_log_view':
        return AppPermission.audit_log_view;
      case 'integration_manage':
        return AppPermission.integration_manage;
      case 'ai_insight_view':
        return AppPermission.ai_insight_view;
      case 'ai_insight_regenerate':
        return AppPermission.ai_insight_regenerate;
      default:
        throw ArgumentError(
          'Value "$name" cannot be converted to "AppPermission"',
        );
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
