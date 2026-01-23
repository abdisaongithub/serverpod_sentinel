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
import 'agent/agent_task.dart' as _i2;
import 'agent/agent_task_status.dart' as _i3;
import 'ai/ai_insight.dart' as _i4;
import 'automation/playbook.dart' as _i5;
import 'automation/playbook_execution.dart' as _i6;
import 'automation/playbook_step_execution.dart' as _i7;
import 'automation/step_executor_payload.dart' as _i8;
import 'dtos/health_summary.dart' as _i9;
import 'dtos/system_metrics.dart' as _i10;
import 'dtos/team_member.dart' as _i11;
import 'enums/execution_status.dart' as _i12;
import 'enums/incident_severity.dart' as _i13;
import 'enums/incident_status.dart' as _i14;
import 'enums/playbook_type.dart' as _i15;
import 'enums/service_status.dart' as _i16;
import 'enums/service_tier.dart' as _i17;
import 'enums/signal_type.dart' as _i18;
import 'enums/timeline_item_type.dart' as _i19;
import 'greetings/greeting.dart' as _i20;
import 'incident/incident.dart' as _i21;
import 'incident/incident_timeline_item.dart' as _i22;
import 'reporting/report_snapshot.dart' as _i23;
import 'security/audit_log.dart' as _i24;
import 'security/ops_user.dart' as _i25;
import 'security/role.dart' as _i26;
import 'security/service_token.dart' as _i27;
import 'security/user_role.dart' as _i28;
import 'service/health_signal.dart' as _i29;
import 'service/rule.dart' as _i30;
import 'service/service.dart' as _i31;
import 'settings/environment.dart' as _i32;
import 'settings/integration.dart' as _i33;
import 'settings/notification_preference.dart' as _i34;
import 'settings/system_setting.dart' as _i35;
import 'streaming/stream_alert.dart' as _i36;
import 'streaming/stream_incident_update.dart' as _i37;
import 'streaming/stream_log_entry.dart' as _i38;
import 'streaming/stream_metric.dart' as _i39;
import 'streaming/stream_service_status.dart' as _i40;
import 'streaming/stream_signal_update.dart' as _i41;
import 'streaming/stream_subscription.dart' as _i42;
import 'streaming/stream_subscription_type.dart' as _i43;
import 'streaming/stream_timeline_event.dart' as _i44;
import 'streaming/stream_update_type.dart' as _i45;
import 'telemetry/telemetry_event.dart' as _i46;
import 'telemetry/telemetry_heartbeat.dart' as _i47;
import 'telemetry/telemetry_resources.dart' as _i48;
import 'telemetry/telemetry_signal_batch.dart' as _i49;
import 'telemetry/telemetry_signal_payload.dart' as _i50;
import 'package:serverpod_sentinel_client/src/protocol/ai/ai_insight.dart'
    as _i51;
import 'package:serverpod_sentinel_client/src/protocol/streaming/stream_alert.dart'
    as _i52;
import 'package:serverpod_sentinel_client/src/protocol/security/audit_log.dart'
    as _i53;
import 'package:serverpod_sentinel_client/src/protocol/settings/environment.dart'
    as _i54;
import 'package:serverpod_sentinel_client/src/protocol/incident/incident.dart'
    as _i55;
import 'package:serverpod_sentinel_client/src/protocol/settings/integration.dart'
    as _i56;
import 'package:serverpod_sentinel_client/src/protocol/settings/notification_preference.dart'
    as _i57;
import 'package:serverpod_sentinel_client/src/protocol/automation/playbook.dart'
    as _i58;
import 'package:serverpod_sentinel_client/src/protocol/reporting/report_snapshot.dart'
    as _i59;
import 'package:serverpod_sentinel_client/src/protocol/enums/incident_severity.dart'
    as _i60;
import 'package:serverpod_sentinel_client/src/protocol/service/rule.dart'
    as _i61;
import 'package:serverpod_sentinel_client/src/protocol/service/service.dart'
    as _i62;
import 'package:serverpod_sentinel_client/src/protocol/settings/system_setting.dart'
    as _i63;
import 'package:serverpod_sentinel_client/src/protocol/service/health_signal.dart'
    as _i64;
import 'package:serverpod_sentinel_client/src/protocol/dtos/team_member.dart'
    as _i65;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i66;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i67;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i68;
export 'agent/agent_task.dart';
export 'agent/agent_task_status.dart';
export 'ai/ai_insight.dart';
export 'automation/playbook.dart';
export 'automation/playbook_execution.dart';
export 'automation/playbook_step_execution.dart';
export 'automation/step_executor_payload.dart';
export 'dtos/health_summary.dart';
export 'dtos/system_metrics.dart';
export 'dtos/team_member.dart';
export 'enums/execution_status.dart';
export 'enums/incident_severity.dart';
export 'enums/incident_status.dart';
export 'enums/playbook_type.dart';
export 'enums/service_status.dart';
export 'enums/service_tier.dart';
export 'enums/signal_type.dart';
export 'enums/timeline_item_type.dart';
export 'greetings/greeting.dart';
export 'incident/incident.dart';
export 'incident/incident_timeline_item.dart';
export 'reporting/report_snapshot.dart';
export 'security/audit_log.dart';
export 'security/ops_user.dart';
export 'security/role.dart';
export 'security/service_token.dart';
export 'security/user_role.dart';
export 'service/health_signal.dart';
export 'service/rule.dart';
export 'service/service.dart';
export 'settings/environment.dart';
export 'settings/integration.dart';
export 'settings/notification_preference.dart';
export 'settings/system_setting.dart';
export 'streaming/stream_alert.dart';
export 'streaming/stream_incident_update.dart';
export 'streaming/stream_log_entry.dart';
export 'streaming/stream_metric.dart';
export 'streaming/stream_service_status.dart';
export 'streaming/stream_signal_update.dart';
export 'streaming/stream_subscription.dart';
export 'streaming/stream_subscription_type.dart';
export 'streaming/stream_timeline_event.dart';
export 'streaming/stream_update_type.dart';
export 'telemetry/telemetry_event.dart';
export 'telemetry/telemetry_heartbeat.dart';
export 'telemetry/telemetry_resources.dart';
export 'telemetry/telemetry_signal_batch.dart';
export 'telemetry/telemetry_signal_payload.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.AgentTask) {
      return _i2.AgentTask.fromJson(data) as T;
    }
    if (t == _i3.AgentTaskStatus) {
      return _i3.AgentTaskStatus.fromJson(data) as T;
    }
    if (t == _i4.AiInsight) {
      return _i4.AiInsight.fromJson(data) as T;
    }
    if (t == _i5.Playbook) {
      return _i5.Playbook.fromJson(data) as T;
    }
    if (t == _i6.PlaybookExecution) {
      return _i6.PlaybookExecution.fromJson(data) as T;
    }
    if (t == _i7.PlaybookStepExecution) {
      return _i7.PlaybookStepExecution.fromJson(data) as T;
    }
    if (t == _i8.StepExecutorPayload) {
      return _i8.StepExecutorPayload.fromJson(data) as T;
    }
    if (t == _i9.HealthSummary) {
      return _i9.HealthSummary.fromJson(data) as T;
    }
    if (t == _i10.SystemMetrics) {
      return _i10.SystemMetrics.fromJson(data) as T;
    }
    if (t == _i11.TeamMember) {
      return _i11.TeamMember.fromJson(data) as T;
    }
    if (t == _i12.ExecutionStatus) {
      return _i12.ExecutionStatus.fromJson(data) as T;
    }
    if (t == _i13.IncidentSeverity) {
      return _i13.IncidentSeverity.fromJson(data) as T;
    }
    if (t == _i14.IncidentStatus) {
      return _i14.IncidentStatus.fromJson(data) as T;
    }
    if (t == _i15.PlaybookType) {
      return _i15.PlaybookType.fromJson(data) as T;
    }
    if (t == _i16.ServiceStatus) {
      return _i16.ServiceStatus.fromJson(data) as T;
    }
    if (t == _i17.ServiceTier) {
      return _i17.ServiceTier.fromJson(data) as T;
    }
    if (t == _i18.SignalType) {
      return _i18.SignalType.fromJson(data) as T;
    }
    if (t == _i19.TimelineItemType) {
      return _i19.TimelineItemType.fromJson(data) as T;
    }
    if (t == _i20.Greeting) {
      return _i20.Greeting.fromJson(data) as T;
    }
    if (t == _i21.Incident) {
      return _i21.Incident.fromJson(data) as T;
    }
    if (t == _i22.IncidentTimelineItem) {
      return _i22.IncidentTimelineItem.fromJson(data) as T;
    }
    if (t == _i23.ReportSnapshot) {
      return _i23.ReportSnapshot.fromJson(data) as T;
    }
    if (t == _i24.AuditLog) {
      return _i24.AuditLog.fromJson(data) as T;
    }
    if (t == _i25.OpsUser) {
      return _i25.OpsUser.fromJson(data) as T;
    }
    if (t == _i26.Role) {
      return _i26.Role.fromJson(data) as T;
    }
    if (t == _i27.ServiceToken) {
      return _i27.ServiceToken.fromJson(data) as T;
    }
    if (t == _i28.UserRole) {
      return _i28.UserRole.fromJson(data) as T;
    }
    if (t == _i29.HealthSignal) {
      return _i29.HealthSignal.fromJson(data) as T;
    }
    if (t == _i30.Rule) {
      return _i30.Rule.fromJson(data) as T;
    }
    if (t == _i31.Service) {
      return _i31.Service.fromJson(data) as T;
    }
    if (t == _i32.Environment) {
      return _i32.Environment.fromJson(data) as T;
    }
    if (t == _i33.Integration) {
      return _i33.Integration.fromJson(data) as T;
    }
    if (t == _i34.NotificationPreference) {
      return _i34.NotificationPreference.fromJson(data) as T;
    }
    if (t == _i35.SystemSetting) {
      return _i35.SystemSetting.fromJson(data) as T;
    }
    if (t == _i36.StreamAlert) {
      return _i36.StreamAlert.fromJson(data) as T;
    }
    if (t == _i37.StreamIncidentUpdate) {
      return _i37.StreamIncidentUpdate.fromJson(data) as T;
    }
    if (t == _i38.StreamLogEntry) {
      return _i38.StreamLogEntry.fromJson(data) as T;
    }
    if (t == _i39.StreamMetric) {
      return _i39.StreamMetric.fromJson(data) as T;
    }
    if (t == _i40.StreamServiceStatus) {
      return _i40.StreamServiceStatus.fromJson(data) as T;
    }
    if (t == _i41.StreamSignalUpdate) {
      return _i41.StreamSignalUpdate.fromJson(data) as T;
    }
    if (t == _i42.StreamSubscription) {
      return _i42.StreamSubscription.fromJson(data) as T;
    }
    if (t == _i43.StreamSubscriptionType) {
      return _i43.StreamSubscriptionType.fromJson(data) as T;
    }
    if (t == _i44.StreamTimelineEvent) {
      return _i44.StreamTimelineEvent.fromJson(data) as T;
    }
    if (t == _i45.StreamUpdateType) {
      return _i45.StreamUpdateType.fromJson(data) as T;
    }
    if (t == _i46.TelemetryEvent) {
      return _i46.TelemetryEvent.fromJson(data) as T;
    }
    if (t == _i47.TelemetryHeartbeat) {
      return _i47.TelemetryHeartbeat.fromJson(data) as T;
    }
    if (t == _i48.TelemetryResources) {
      return _i48.TelemetryResources.fromJson(data) as T;
    }
    if (t == _i49.TelemetrySignalBatch) {
      return _i49.TelemetrySignalBatch.fromJson(data) as T;
    }
    if (t == _i50.TelemetrySignalPayload) {
      return _i50.TelemetrySignalPayload.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.AgentTask?>()) {
      return (data != null ? _i2.AgentTask.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.AgentTaskStatus?>()) {
      return (data != null ? _i3.AgentTaskStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.AiInsight?>()) {
      return (data != null ? _i4.AiInsight.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Playbook?>()) {
      return (data != null ? _i5.Playbook.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.PlaybookExecution?>()) {
      return (data != null ? _i6.PlaybookExecution.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.PlaybookStepExecution?>()) {
      return (data != null ? _i7.PlaybookStepExecution.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i8.StepExecutorPayload?>()) {
      return (data != null ? _i8.StepExecutorPayload.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i9.HealthSummary?>()) {
      return (data != null ? _i9.HealthSummary.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.SystemMetrics?>()) {
      return (data != null ? _i10.SystemMetrics.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.TeamMember?>()) {
      return (data != null ? _i11.TeamMember.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.ExecutionStatus?>()) {
      return (data != null ? _i12.ExecutionStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.IncidentSeverity?>()) {
      return (data != null ? _i13.IncidentSeverity.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.IncidentStatus?>()) {
      return (data != null ? _i14.IncidentStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.PlaybookType?>()) {
      return (data != null ? _i15.PlaybookType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.ServiceStatus?>()) {
      return (data != null ? _i16.ServiceStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.ServiceTier?>()) {
      return (data != null ? _i17.ServiceTier.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.SignalType?>()) {
      return (data != null ? _i18.SignalType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.TimelineItemType?>()) {
      return (data != null ? _i19.TimelineItemType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.Greeting?>()) {
      return (data != null ? _i20.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.Incident?>()) {
      return (data != null ? _i21.Incident.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.IncidentTimelineItem?>()) {
      return (data != null ? _i22.IncidentTimelineItem.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i23.ReportSnapshot?>()) {
      return (data != null ? _i23.ReportSnapshot.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.AuditLog?>()) {
      return (data != null ? _i24.AuditLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.OpsUser?>()) {
      return (data != null ? _i25.OpsUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.Role?>()) {
      return (data != null ? _i26.Role.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.ServiceToken?>()) {
      return (data != null ? _i27.ServiceToken.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.UserRole?>()) {
      return (data != null ? _i28.UserRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.HealthSignal?>()) {
      return (data != null ? _i29.HealthSignal.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.Rule?>()) {
      return (data != null ? _i30.Rule.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.Service?>()) {
      return (data != null ? _i31.Service.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.Environment?>()) {
      return (data != null ? _i32.Environment.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.Integration?>()) {
      return (data != null ? _i33.Integration.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.NotificationPreference?>()) {
      return (data != null ? _i34.NotificationPreference.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i35.SystemSetting?>()) {
      return (data != null ? _i35.SystemSetting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.StreamAlert?>()) {
      return (data != null ? _i36.StreamAlert.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.StreamIncidentUpdate?>()) {
      return (data != null ? _i37.StreamIncidentUpdate.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i38.StreamLogEntry?>()) {
      return (data != null ? _i38.StreamLogEntry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i39.StreamMetric?>()) {
      return (data != null ? _i39.StreamMetric.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i40.StreamServiceStatus?>()) {
      return (data != null ? _i40.StreamServiceStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i41.StreamSignalUpdate?>()) {
      return (data != null ? _i41.StreamSignalUpdate.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i42.StreamSubscription?>()) {
      return (data != null ? _i42.StreamSubscription.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i43.StreamSubscriptionType?>()) {
      return (data != null ? _i43.StreamSubscriptionType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i44.StreamTimelineEvent?>()) {
      return (data != null ? _i44.StreamTimelineEvent.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i45.StreamUpdateType?>()) {
      return (data != null ? _i45.StreamUpdateType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i46.TelemetryEvent?>()) {
      return (data != null ? _i46.TelemetryEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i47.TelemetryHeartbeat?>()) {
      return (data != null ? _i47.TelemetryHeartbeat.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i48.TelemetryResources?>()) {
      return (data != null ? _i48.TelemetryResources.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i49.TelemetrySignalBatch?>()) {
      return (data != null ? _i49.TelemetrySignalBatch.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i50.TelemetrySignalPayload?>()) {
      return (data != null ? _i50.TelemetrySignalPayload.fromJson(data) : null)
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<String>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i6.PlaybookExecution>) {
      return (data as List)
              .map((e) => deserialize<_i6.PlaybookExecution>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i6.PlaybookExecution>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i6.PlaybookExecution>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i22.IncidentTimelineItem>) {
      return (data as List)
              .map((e) => deserialize<_i22.IncidentTimelineItem>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i22.IncidentTimelineItem>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i22.IncidentTimelineItem>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i28.UserRole>) {
      return (data as List).map((e) => deserialize<_i28.UserRole>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i28.UserRole>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i28.UserRole>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i31.Service>) {
      return (data as List).map((e) => deserialize<_i31.Service>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i31.Service>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i31.Service>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i21.Incident>) {
      return (data as List).map((e) => deserialize<_i21.Incident>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i21.Incident>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i21.Incident>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i24.AuditLog>) {
      return (data as List).map((e) => deserialize<_i24.AuditLog>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i24.AuditLog>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i24.AuditLog>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i29.HealthSignal>) {
      return (data as List)
              .map((e) => deserialize<_i29.HealthSignal>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i29.HealthSignal>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i29.HealthSignal>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i30.Rule>) {
      return (data as List).map((e) => deserialize<_i30.Rule>(e)).toList() as T;
    }
    if (t == _i1.getType<List<_i30.Rule>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i30.Rule>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i50.TelemetrySignalPayload>) {
      return (data as List)
              .map((e) => deserialize<_i50.TelemetrySignalPayload>(e))
              .toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<String>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i51.AiInsight>) {
      return (data as List).map((e) => deserialize<_i51.AiInsight>(e)).toList()
          as T;
    }
    if (t == Map<String, dynamic>) {
      return (data as Map).map(
            (k, v) => MapEntry(deserialize<String>(k), deserialize<dynamic>(v)),
          )
          as T;
    }
    if (t == List<Map<String, dynamic>>) {
      return (data as List)
              .map((e) => deserialize<Map<String, dynamic>>(e))
              .toList()
          as T;
    }
    if (t == List<_i52.StreamAlert>) {
      return (data as List)
              .map((e) => deserialize<_i52.StreamAlert>(e))
              .toList()
          as T;
    }
    if (t == List<_i53.AuditLog>) {
      return (data as List).map((e) => deserialize<_i53.AuditLog>(e)).toList()
          as T;
    }
    if (t == List<_i54.Environment>) {
      return (data as List)
              .map((e) => deserialize<_i54.Environment>(e))
              .toList()
          as T;
    }
    if (t == List<_i55.Incident>) {
      return (data as List).map((e) => deserialize<_i55.Incident>(e)).toList()
          as T;
    }
    if (t == List<_i56.Integration>) {
      return (data as List)
              .map((e) => deserialize<_i56.Integration>(e))
              .toList()
          as T;
    }
    if (t == List<_i57.NotificationPreference>) {
      return (data as List)
              .map((e) => deserialize<_i57.NotificationPreference>(e))
              .toList()
          as T;
    }
    if (t == List<_i58.Playbook>) {
      return (data as List).map((e) => deserialize<_i58.Playbook>(e)).toList()
          as T;
    }
    if (t == List<_i59.ReportSnapshot>) {
      return (data as List)
              .map((e) => deserialize<_i59.ReportSnapshot>(e))
              .toList()
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<int>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i60.IncidentSeverity>) {
      return (data as List)
              .map((e) => deserialize<_i60.IncidentSeverity>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i60.IncidentSeverity>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i60.IncidentSeverity>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i61.Rule>) {
      return (data as List).map((e) => deserialize<_i61.Rule>(e)).toList() as T;
    }
    if (t == List<_i62.Service>) {
      return (data as List).map((e) => deserialize<_i62.Service>(e)).toList()
          as T;
    }
    if (t == List<_i63.SystemSetting>) {
      return (data as List)
              .map((e) => deserialize<_i63.SystemSetting>(e))
              .toList()
          as T;
    }
    if (t == List<_i64.HealthSignal>) {
      return (data as List)
              .map((e) => deserialize<_i64.HealthSignal>(e))
              .toList()
          as T;
    }
    if (t == List<_i65.TeamMember>) {
      return (data as List).map((e) => deserialize<_i65.TeamMember>(e)).toList()
          as T;
    }
    try {
      return _i66.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i67.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i68.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.AgentTask => 'AgentTask',
      _i3.AgentTaskStatus => 'AgentTaskStatus',
      _i4.AiInsight => 'AiInsight',
      _i5.Playbook => 'Playbook',
      _i6.PlaybookExecution => 'PlaybookExecution',
      _i7.PlaybookStepExecution => 'PlaybookStepExecution',
      _i8.StepExecutorPayload => 'StepExecutorPayload',
      _i9.HealthSummary => 'HealthSummary',
      _i10.SystemMetrics => 'SystemMetrics',
      _i11.TeamMember => 'TeamMember',
      _i12.ExecutionStatus => 'ExecutionStatus',
      _i13.IncidentSeverity => 'IncidentSeverity',
      _i14.IncidentStatus => 'IncidentStatus',
      _i15.PlaybookType => 'PlaybookType',
      _i16.ServiceStatus => 'ServiceStatus',
      _i17.ServiceTier => 'ServiceTier',
      _i18.SignalType => 'SignalType',
      _i19.TimelineItemType => 'TimelineItemType',
      _i20.Greeting => 'Greeting',
      _i21.Incident => 'Incident',
      _i22.IncidentTimelineItem => 'IncidentTimelineItem',
      _i23.ReportSnapshot => 'ReportSnapshot',
      _i24.AuditLog => 'AuditLog',
      _i25.OpsUser => 'OpsUser',
      _i26.Role => 'Role',
      _i27.ServiceToken => 'ServiceToken',
      _i28.UserRole => 'UserRole',
      _i29.HealthSignal => 'HealthSignal',
      _i30.Rule => 'Rule',
      _i31.Service => 'Service',
      _i32.Environment => 'Environment',
      _i33.Integration => 'Integration',
      _i34.NotificationPreference => 'NotificationPreference',
      _i35.SystemSetting => 'SystemSetting',
      _i36.StreamAlert => 'StreamAlert',
      _i37.StreamIncidentUpdate => 'StreamIncidentUpdate',
      _i38.StreamLogEntry => 'StreamLogEntry',
      _i39.StreamMetric => 'StreamMetric',
      _i40.StreamServiceStatus => 'StreamServiceStatus',
      _i41.StreamSignalUpdate => 'StreamSignalUpdate',
      _i42.StreamSubscription => 'StreamSubscription',
      _i43.StreamSubscriptionType => 'StreamSubscriptionType',
      _i44.StreamTimelineEvent => 'StreamTimelineEvent',
      _i45.StreamUpdateType => 'StreamUpdateType',
      _i46.TelemetryEvent => 'TelemetryEvent',
      _i47.TelemetryHeartbeat => 'TelemetryHeartbeat',
      _i48.TelemetryResources => 'TelemetryResources',
      _i49.TelemetrySignalBatch => 'TelemetrySignalBatch',
      _i50.TelemetrySignalPayload => 'TelemetrySignalPayload',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst(
        'serverpod_sentinel.',
        '',
      );
    }

    switch (data) {
      case _i2.AgentTask():
        return 'AgentTask';
      case _i3.AgentTaskStatus():
        return 'AgentTaskStatus';
      case _i4.AiInsight():
        return 'AiInsight';
      case _i5.Playbook():
        return 'Playbook';
      case _i6.PlaybookExecution():
        return 'PlaybookExecution';
      case _i7.PlaybookStepExecution():
        return 'PlaybookStepExecution';
      case _i8.StepExecutorPayload():
        return 'StepExecutorPayload';
      case _i9.HealthSummary():
        return 'HealthSummary';
      case _i10.SystemMetrics():
        return 'SystemMetrics';
      case _i11.TeamMember():
        return 'TeamMember';
      case _i12.ExecutionStatus():
        return 'ExecutionStatus';
      case _i13.IncidentSeverity():
        return 'IncidentSeverity';
      case _i14.IncidentStatus():
        return 'IncidentStatus';
      case _i15.PlaybookType():
        return 'PlaybookType';
      case _i16.ServiceStatus():
        return 'ServiceStatus';
      case _i17.ServiceTier():
        return 'ServiceTier';
      case _i18.SignalType():
        return 'SignalType';
      case _i19.TimelineItemType():
        return 'TimelineItemType';
      case _i20.Greeting():
        return 'Greeting';
      case _i21.Incident():
        return 'Incident';
      case _i22.IncidentTimelineItem():
        return 'IncidentTimelineItem';
      case _i23.ReportSnapshot():
        return 'ReportSnapshot';
      case _i24.AuditLog():
        return 'AuditLog';
      case _i25.OpsUser():
        return 'OpsUser';
      case _i26.Role():
        return 'Role';
      case _i27.ServiceToken():
        return 'ServiceToken';
      case _i28.UserRole():
        return 'UserRole';
      case _i29.HealthSignal():
        return 'HealthSignal';
      case _i30.Rule():
        return 'Rule';
      case _i31.Service():
        return 'Service';
      case _i32.Environment():
        return 'Environment';
      case _i33.Integration():
        return 'Integration';
      case _i34.NotificationPreference():
        return 'NotificationPreference';
      case _i35.SystemSetting():
        return 'SystemSetting';
      case _i36.StreamAlert():
        return 'StreamAlert';
      case _i37.StreamIncidentUpdate():
        return 'StreamIncidentUpdate';
      case _i38.StreamLogEntry():
        return 'StreamLogEntry';
      case _i39.StreamMetric():
        return 'StreamMetric';
      case _i40.StreamServiceStatus():
        return 'StreamServiceStatus';
      case _i41.StreamSignalUpdate():
        return 'StreamSignalUpdate';
      case _i42.StreamSubscription():
        return 'StreamSubscription';
      case _i43.StreamSubscriptionType():
        return 'StreamSubscriptionType';
      case _i44.StreamTimelineEvent():
        return 'StreamTimelineEvent';
      case _i45.StreamUpdateType():
        return 'StreamUpdateType';
      case _i46.TelemetryEvent():
        return 'TelemetryEvent';
      case _i47.TelemetryHeartbeat():
        return 'TelemetryHeartbeat';
      case _i48.TelemetryResources():
        return 'TelemetryResources';
      case _i49.TelemetrySignalBatch():
        return 'TelemetrySignalBatch';
      case _i50.TelemetrySignalPayload():
        return 'TelemetrySignalPayload';
    }
    className = _i66.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i67.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    className = _i68.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'AgentTask') {
      return deserialize<_i2.AgentTask>(data['data']);
    }
    if (dataClassName == 'AgentTaskStatus') {
      return deserialize<_i3.AgentTaskStatus>(data['data']);
    }
    if (dataClassName == 'AiInsight') {
      return deserialize<_i4.AiInsight>(data['data']);
    }
    if (dataClassName == 'Playbook') {
      return deserialize<_i5.Playbook>(data['data']);
    }
    if (dataClassName == 'PlaybookExecution') {
      return deserialize<_i6.PlaybookExecution>(data['data']);
    }
    if (dataClassName == 'PlaybookStepExecution') {
      return deserialize<_i7.PlaybookStepExecution>(data['data']);
    }
    if (dataClassName == 'StepExecutorPayload') {
      return deserialize<_i8.StepExecutorPayload>(data['data']);
    }
    if (dataClassName == 'HealthSummary') {
      return deserialize<_i9.HealthSummary>(data['data']);
    }
    if (dataClassName == 'SystemMetrics') {
      return deserialize<_i10.SystemMetrics>(data['data']);
    }
    if (dataClassName == 'TeamMember') {
      return deserialize<_i11.TeamMember>(data['data']);
    }
    if (dataClassName == 'ExecutionStatus') {
      return deserialize<_i12.ExecutionStatus>(data['data']);
    }
    if (dataClassName == 'IncidentSeverity') {
      return deserialize<_i13.IncidentSeverity>(data['data']);
    }
    if (dataClassName == 'IncidentStatus') {
      return deserialize<_i14.IncidentStatus>(data['data']);
    }
    if (dataClassName == 'PlaybookType') {
      return deserialize<_i15.PlaybookType>(data['data']);
    }
    if (dataClassName == 'ServiceStatus') {
      return deserialize<_i16.ServiceStatus>(data['data']);
    }
    if (dataClassName == 'ServiceTier') {
      return deserialize<_i17.ServiceTier>(data['data']);
    }
    if (dataClassName == 'SignalType') {
      return deserialize<_i18.SignalType>(data['data']);
    }
    if (dataClassName == 'TimelineItemType') {
      return deserialize<_i19.TimelineItemType>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i20.Greeting>(data['data']);
    }
    if (dataClassName == 'Incident') {
      return deserialize<_i21.Incident>(data['data']);
    }
    if (dataClassName == 'IncidentTimelineItem') {
      return deserialize<_i22.IncidentTimelineItem>(data['data']);
    }
    if (dataClassName == 'ReportSnapshot') {
      return deserialize<_i23.ReportSnapshot>(data['data']);
    }
    if (dataClassName == 'AuditLog') {
      return deserialize<_i24.AuditLog>(data['data']);
    }
    if (dataClassName == 'OpsUser') {
      return deserialize<_i25.OpsUser>(data['data']);
    }
    if (dataClassName == 'Role') {
      return deserialize<_i26.Role>(data['data']);
    }
    if (dataClassName == 'ServiceToken') {
      return deserialize<_i27.ServiceToken>(data['data']);
    }
    if (dataClassName == 'UserRole') {
      return deserialize<_i28.UserRole>(data['data']);
    }
    if (dataClassName == 'HealthSignal') {
      return deserialize<_i29.HealthSignal>(data['data']);
    }
    if (dataClassName == 'Rule') {
      return deserialize<_i30.Rule>(data['data']);
    }
    if (dataClassName == 'Service') {
      return deserialize<_i31.Service>(data['data']);
    }
    if (dataClassName == 'Environment') {
      return deserialize<_i32.Environment>(data['data']);
    }
    if (dataClassName == 'Integration') {
      return deserialize<_i33.Integration>(data['data']);
    }
    if (dataClassName == 'NotificationPreference') {
      return deserialize<_i34.NotificationPreference>(data['data']);
    }
    if (dataClassName == 'SystemSetting') {
      return deserialize<_i35.SystemSetting>(data['data']);
    }
    if (dataClassName == 'StreamAlert') {
      return deserialize<_i36.StreamAlert>(data['data']);
    }
    if (dataClassName == 'StreamIncidentUpdate') {
      return deserialize<_i37.StreamIncidentUpdate>(data['data']);
    }
    if (dataClassName == 'StreamLogEntry') {
      return deserialize<_i38.StreamLogEntry>(data['data']);
    }
    if (dataClassName == 'StreamMetric') {
      return deserialize<_i39.StreamMetric>(data['data']);
    }
    if (dataClassName == 'StreamServiceStatus') {
      return deserialize<_i40.StreamServiceStatus>(data['data']);
    }
    if (dataClassName == 'StreamSignalUpdate') {
      return deserialize<_i41.StreamSignalUpdate>(data['data']);
    }
    if (dataClassName == 'StreamSubscription') {
      return deserialize<_i42.StreamSubscription>(data['data']);
    }
    if (dataClassName == 'StreamSubscriptionType') {
      return deserialize<_i43.StreamSubscriptionType>(data['data']);
    }
    if (dataClassName == 'StreamTimelineEvent') {
      return deserialize<_i44.StreamTimelineEvent>(data['data']);
    }
    if (dataClassName == 'StreamUpdateType') {
      return deserialize<_i45.StreamUpdateType>(data['data']);
    }
    if (dataClassName == 'TelemetryEvent') {
      return deserialize<_i46.TelemetryEvent>(data['data']);
    }
    if (dataClassName == 'TelemetryHeartbeat') {
      return deserialize<_i47.TelemetryHeartbeat>(data['data']);
    }
    if (dataClassName == 'TelemetryResources') {
      return deserialize<_i48.TelemetryResources>(data['data']);
    }
    if (dataClassName == 'TelemetrySignalBatch') {
      return deserialize<_i49.TelemetrySignalBatch>(data['data']);
    }
    if (dataClassName == 'TelemetrySignalPayload') {
      return deserialize<_i50.TelemetrySignalPayload>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i66.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i67.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i68.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i66.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i67.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i68.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
