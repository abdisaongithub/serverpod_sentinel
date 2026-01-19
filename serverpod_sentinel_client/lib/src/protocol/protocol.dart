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
import 'ai/ai_insight.dart' as _i2;
import 'automation/playbook.dart' as _i3;
import 'automation/playbook_execution.dart' as _i4;
import 'automation/playbook_step_execution.dart' as _i5;
import 'automation/step_executor_payload.dart' as _i6;
import 'dtos/health_summary.dart' as _i7;
import 'dtos/system_metrics.dart' as _i8;
import 'dtos/team_member.dart' as _i9;
import 'enums/execution_status.dart' as _i10;
import 'enums/incident_severity.dart' as _i11;
import 'enums/incident_status.dart' as _i12;
import 'enums/playbook_type.dart' as _i13;
import 'enums/service_status.dart' as _i14;
import 'enums/service_tier.dart' as _i15;
import 'enums/signal_type.dart' as _i16;
import 'enums/timeline_item_type.dart' as _i17;
import 'greetings/greeting.dart' as _i18;
import 'incident/incident.dart' as _i19;
import 'incident/incident_timeline_item.dart' as _i20;
import 'reporting/report_snapshot.dart' as _i21;
import 'security/audit_log.dart' as _i22;
import 'security/ops_user.dart' as _i23;
import 'security/role.dart' as _i24;
import 'security/service_token.dart' as _i25;
import 'security/user_role.dart' as _i26;
import 'service/health_signal.dart' as _i27;
import 'service/rule.dart' as _i28;
import 'service/service.dart' as _i29;
import 'settings/environment.dart' as _i30;
import 'settings/integration.dart' as _i31;
import 'settings/notification_preference.dart' as _i32;
import 'settings/system_setting.dart' as _i33;
import 'streaming/stream_alert.dart' as _i34;
import 'streaming/stream_incident_update.dart' as _i35;
import 'streaming/stream_log_entry.dart' as _i36;
import 'streaming/stream_metric.dart' as _i37;
import 'streaming/stream_service_status.dart' as _i38;
import 'streaming/stream_signal_update.dart' as _i39;
import 'streaming/stream_subscription.dart' as _i40;
import 'streaming/stream_subscription_type.dart' as _i41;
import 'streaming/stream_timeline_event.dart' as _i42;
import 'streaming/stream_update_type.dart' as _i43;
import 'telemetry/telemetry_event.dart' as _i44;
import 'telemetry/telemetry_heartbeat.dart' as _i45;
import 'telemetry/telemetry_resources.dart' as _i46;
import 'telemetry/telemetry_signal_batch.dart' as _i47;
import 'telemetry/telemetry_signal_payload.dart' as _i48;
import 'package:serverpod_sentinel_client/src/protocol/ai/ai_insight.dart'
    as _i49;
import 'package:serverpod_sentinel_client/src/protocol/streaming/stream_alert.dart'
    as _i50;
import 'package:serverpod_sentinel_client/src/protocol/security/audit_log.dart'
    as _i51;
import 'package:serverpod_sentinel_client/src/protocol/settings/environment.dart'
    as _i52;
import 'package:serverpod_sentinel_client/src/protocol/incident/incident.dart'
    as _i53;
import 'package:serverpod_sentinel_client/src/protocol/settings/integration.dart'
    as _i54;
import 'package:serverpod_sentinel_client/src/protocol/settings/notification_preference.dart'
    as _i55;
import 'package:serverpod_sentinel_client/src/protocol/automation/playbook.dart'
    as _i56;
import 'package:serverpod_sentinel_client/src/protocol/reporting/report_snapshot.dart'
    as _i57;
import 'package:serverpod_sentinel_client/src/protocol/enums/incident_severity.dart'
    as _i58;
import 'package:serverpod_sentinel_client/src/protocol/service/rule.dart'
    as _i59;
import 'package:serverpod_sentinel_client/src/protocol/service/service.dart'
    as _i60;
import 'package:serverpod_sentinel_client/src/protocol/settings/system_setting.dart'
    as _i61;
import 'package:serverpod_sentinel_client/src/protocol/service/health_signal.dart'
    as _i62;
import 'package:serverpod_sentinel_client/src/protocol/dtos/team_member.dart'
    as _i63;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i64;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i65;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i66;
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

    if (t == _i2.AiInsight) {
      return _i2.AiInsight.fromJson(data) as T;
    }
    if (t == _i3.Playbook) {
      return _i3.Playbook.fromJson(data) as T;
    }
    if (t == _i4.PlaybookExecution) {
      return _i4.PlaybookExecution.fromJson(data) as T;
    }
    if (t == _i5.PlaybookStepExecution) {
      return _i5.PlaybookStepExecution.fromJson(data) as T;
    }
    if (t == _i6.StepExecutorPayload) {
      return _i6.StepExecutorPayload.fromJson(data) as T;
    }
    if (t == _i7.HealthSummary) {
      return _i7.HealthSummary.fromJson(data) as T;
    }
    if (t == _i8.SystemMetrics) {
      return _i8.SystemMetrics.fromJson(data) as T;
    }
    if (t == _i9.TeamMember) {
      return _i9.TeamMember.fromJson(data) as T;
    }
    if (t == _i10.ExecutionStatus) {
      return _i10.ExecutionStatus.fromJson(data) as T;
    }
    if (t == _i11.IncidentSeverity) {
      return _i11.IncidentSeverity.fromJson(data) as T;
    }
    if (t == _i12.IncidentStatus) {
      return _i12.IncidentStatus.fromJson(data) as T;
    }
    if (t == _i13.PlaybookType) {
      return _i13.PlaybookType.fromJson(data) as T;
    }
    if (t == _i14.ServiceStatus) {
      return _i14.ServiceStatus.fromJson(data) as T;
    }
    if (t == _i15.ServiceTier) {
      return _i15.ServiceTier.fromJson(data) as T;
    }
    if (t == _i16.SignalType) {
      return _i16.SignalType.fromJson(data) as T;
    }
    if (t == _i17.TimelineItemType) {
      return _i17.TimelineItemType.fromJson(data) as T;
    }
    if (t == _i18.Greeting) {
      return _i18.Greeting.fromJson(data) as T;
    }
    if (t == _i19.Incident) {
      return _i19.Incident.fromJson(data) as T;
    }
    if (t == _i20.IncidentTimelineItem) {
      return _i20.IncidentTimelineItem.fromJson(data) as T;
    }
    if (t == _i21.ReportSnapshot) {
      return _i21.ReportSnapshot.fromJson(data) as T;
    }
    if (t == _i22.AuditLog) {
      return _i22.AuditLog.fromJson(data) as T;
    }
    if (t == _i23.OpsUser) {
      return _i23.OpsUser.fromJson(data) as T;
    }
    if (t == _i24.Role) {
      return _i24.Role.fromJson(data) as T;
    }
    if (t == _i25.ServiceToken) {
      return _i25.ServiceToken.fromJson(data) as T;
    }
    if (t == _i26.UserRole) {
      return _i26.UserRole.fromJson(data) as T;
    }
    if (t == _i27.HealthSignal) {
      return _i27.HealthSignal.fromJson(data) as T;
    }
    if (t == _i28.Rule) {
      return _i28.Rule.fromJson(data) as T;
    }
    if (t == _i29.Service) {
      return _i29.Service.fromJson(data) as T;
    }
    if (t == _i30.Environment) {
      return _i30.Environment.fromJson(data) as T;
    }
    if (t == _i31.Integration) {
      return _i31.Integration.fromJson(data) as T;
    }
    if (t == _i32.NotificationPreference) {
      return _i32.NotificationPreference.fromJson(data) as T;
    }
    if (t == _i33.SystemSetting) {
      return _i33.SystemSetting.fromJson(data) as T;
    }
    if (t == _i34.StreamAlert) {
      return _i34.StreamAlert.fromJson(data) as T;
    }
    if (t == _i35.StreamIncidentUpdate) {
      return _i35.StreamIncidentUpdate.fromJson(data) as T;
    }
    if (t == _i36.StreamLogEntry) {
      return _i36.StreamLogEntry.fromJson(data) as T;
    }
    if (t == _i37.StreamMetric) {
      return _i37.StreamMetric.fromJson(data) as T;
    }
    if (t == _i38.StreamServiceStatus) {
      return _i38.StreamServiceStatus.fromJson(data) as T;
    }
    if (t == _i39.StreamSignalUpdate) {
      return _i39.StreamSignalUpdate.fromJson(data) as T;
    }
    if (t == _i40.StreamSubscription) {
      return _i40.StreamSubscription.fromJson(data) as T;
    }
    if (t == _i41.StreamSubscriptionType) {
      return _i41.StreamSubscriptionType.fromJson(data) as T;
    }
    if (t == _i42.StreamTimelineEvent) {
      return _i42.StreamTimelineEvent.fromJson(data) as T;
    }
    if (t == _i43.StreamUpdateType) {
      return _i43.StreamUpdateType.fromJson(data) as T;
    }
    if (t == _i44.TelemetryEvent) {
      return _i44.TelemetryEvent.fromJson(data) as T;
    }
    if (t == _i45.TelemetryHeartbeat) {
      return _i45.TelemetryHeartbeat.fromJson(data) as T;
    }
    if (t == _i46.TelemetryResources) {
      return _i46.TelemetryResources.fromJson(data) as T;
    }
    if (t == _i47.TelemetrySignalBatch) {
      return _i47.TelemetrySignalBatch.fromJson(data) as T;
    }
    if (t == _i48.TelemetrySignalPayload) {
      return _i48.TelemetrySignalPayload.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.AiInsight?>()) {
      return (data != null ? _i2.AiInsight.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Playbook?>()) {
      return (data != null ? _i3.Playbook.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.PlaybookExecution?>()) {
      return (data != null ? _i4.PlaybookExecution.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.PlaybookStepExecution?>()) {
      return (data != null ? _i5.PlaybookStepExecution.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i6.StepExecutorPayload?>()) {
      return (data != null ? _i6.StepExecutorPayload.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i7.HealthSummary?>()) {
      return (data != null ? _i7.HealthSummary.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.SystemMetrics?>()) {
      return (data != null ? _i8.SystemMetrics.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.TeamMember?>()) {
      return (data != null ? _i9.TeamMember.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.ExecutionStatus?>()) {
      return (data != null ? _i10.ExecutionStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.IncidentSeverity?>()) {
      return (data != null ? _i11.IncidentSeverity.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.IncidentStatus?>()) {
      return (data != null ? _i12.IncidentStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.PlaybookType?>()) {
      return (data != null ? _i13.PlaybookType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.ServiceStatus?>()) {
      return (data != null ? _i14.ServiceStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.ServiceTier?>()) {
      return (data != null ? _i15.ServiceTier.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.SignalType?>()) {
      return (data != null ? _i16.SignalType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.TimelineItemType?>()) {
      return (data != null ? _i17.TimelineItemType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.Greeting?>()) {
      return (data != null ? _i18.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.Incident?>()) {
      return (data != null ? _i19.Incident.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.IncidentTimelineItem?>()) {
      return (data != null ? _i20.IncidentTimelineItem.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i21.ReportSnapshot?>()) {
      return (data != null ? _i21.ReportSnapshot.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.AuditLog?>()) {
      return (data != null ? _i22.AuditLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.OpsUser?>()) {
      return (data != null ? _i23.OpsUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.Role?>()) {
      return (data != null ? _i24.Role.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.ServiceToken?>()) {
      return (data != null ? _i25.ServiceToken.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.UserRole?>()) {
      return (data != null ? _i26.UserRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.HealthSignal?>()) {
      return (data != null ? _i27.HealthSignal.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.Rule?>()) {
      return (data != null ? _i28.Rule.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.Service?>()) {
      return (data != null ? _i29.Service.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.Environment?>()) {
      return (data != null ? _i30.Environment.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.Integration?>()) {
      return (data != null ? _i31.Integration.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.NotificationPreference?>()) {
      return (data != null ? _i32.NotificationPreference.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i33.SystemSetting?>()) {
      return (data != null ? _i33.SystemSetting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.StreamAlert?>()) {
      return (data != null ? _i34.StreamAlert.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.StreamIncidentUpdate?>()) {
      return (data != null ? _i35.StreamIncidentUpdate.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i36.StreamLogEntry?>()) {
      return (data != null ? _i36.StreamLogEntry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.StreamMetric?>()) {
      return (data != null ? _i37.StreamMetric.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i38.StreamServiceStatus?>()) {
      return (data != null ? _i38.StreamServiceStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i39.StreamSignalUpdate?>()) {
      return (data != null ? _i39.StreamSignalUpdate.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i40.StreamSubscription?>()) {
      return (data != null ? _i40.StreamSubscription.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i41.StreamSubscriptionType?>()) {
      return (data != null ? _i41.StreamSubscriptionType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i42.StreamTimelineEvent?>()) {
      return (data != null ? _i42.StreamTimelineEvent.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i43.StreamUpdateType?>()) {
      return (data != null ? _i43.StreamUpdateType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i44.TelemetryEvent?>()) {
      return (data != null ? _i44.TelemetryEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i45.TelemetryHeartbeat?>()) {
      return (data != null ? _i45.TelemetryHeartbeat.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i46.TelemetryResources?>()) {
      return (data != null ? _i46.TelemetryResources.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i47.TelemetrySignalBatch?>()) {
      return (data != null ? _i47.TelemetrySignalBatch.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i48.TelemetrySignalPayload?>()) {
      return (data != null ? _i48.TelemetrySignalPayload.fromJson(data) : null)
          as T;
    }
    if (t == List<_i4.PlaybookExecution>) {
      return (data as List)
              .map((e) => deserialize<_i4.PlaybookExecution>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i4.PlaybookExecution>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i4.PlaybookExecution>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i20.IncidentTimelineItem>) {
      return (data as List)
              .map((e) => deserialize<_i20.IncidentTimelineItem>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i20.IncidentTimelineItem>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i20.IncidentTimelineItem>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i26.UserRole>) {
      return (data as List).map((e) => deserialize<_i26.UserRole>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i26.UserRole>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i26.UserRole>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i29.Service>) {
      return (data as List).map((e) => deserialize<_i29.Service>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i29.Service>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i29.Service>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i19.Incident>) {
      return (data as List).map((e) => deserialize<_i19.Incident>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i19.Incident>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i19.Incident>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i22.AuditLog>) {
      return (data as List).map((e) => deserialize<_i22.AuditLog>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i22.AuditLog>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i22.AuditLog>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i27.HealthSignal>) {
      return (data as List)
              .map((e) => deserialize<_i27.HealthSignal>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i27.HealthSignal>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i27.HealthSignal>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i28.Rule>) {
      return (data as List).map((e) => deserialize<_i28.Rule>(e)).toList() as T;
    }
    if (t == _i1.getType<List<_i28.Rule>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i28.Rule>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i48.TelemetrySignalPayload>) {
      return (data as List)
              .map((e) => deserialize<_i48.TelemetrySignalPayload>(e))
              .toList()
          as T;
    }
    if (t == List<_i49.AiInsight>) {
      return (data as List).map((e) => deserialize<_i49.AiInsight>(e)).toList()
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
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i50.StreamAlert>) {
      return (data as List)
              .map((e) => deserialize<_i50.StreamAlert>(e))
              .toList()
          as T;
    }
    if (t == List<_i51.AuditLog>) {
      return (data as List).map((e) => deserialize<_i51.AuditLog>(e)).toList()
          as T;
    }
    if (t == List<_i52.Environment>) {
      return (data as List)
              .map((e) => deserialize<_i52.Environment>(e))
              .toList()
          as T;
    }
    if (t == List<_i53.Incident>) {
      return (data as List).map((e) => deserialize<_i53.Incident>(e)).toList()
          as T;
    }
    if (t == List<_i54.Integration>) {
      return (data as List)
              .map((e) => deserialize<_i54.Integration>(e))
              .toList()
          as T;
    }
    if (t == List<_i55.NotificationPreference>) {
      return (data as List)
              .map((e) => deserialize<_i55.NotificationPreference>(e))
              .toList()
          as T;
    }
    if (t == List<_i56.Playbook>) {
      return (data as List).map((e) => deserialize<_i56.Playbook>(e)).toList()
          as T;
    }
    if (t == List<_i57.ReportSnapshot>) {
      return (data as List)
              .map((e) => deserialize<_i57.ReportSnapshot>(e))
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
    if (t == List<_i58.IncidentSeverity>) {
      return (data as List)
              .map((e) => deserialize<_i58.IncidentSeverity>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i58.IncidentSeverity>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i58.IncidentSeverity>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i59.Rule>) {
      return (data as List).map((e) => deserialize<_i59.Rule>(e)).toList() as T;
    }
    if (t == List<_i60.Service>) {
      return (data as List).map((e) => deserialize<_i60.Service>(e)).toList()
          as T;
    }
    if (t == List<_i61.SystemSetting>) {
      return (data as List)
              .map((e) => deserialize<_i61.SystemSetting>(e))
              .toList()
          as T;
    }
    if (t == List<_i62.HealthSignal>) {
      return (data as List)
              .map((e) => deserialize<_i62.HealthSignal>(e))
              .toList()
          as T;
    }
    if (t == List<_i63.TeamMember>) {
      return (data as List).map((e) => deserialize<_i63.TeamMember>(e)).toList()
          as T;
    }
    try {
      return _i64.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i65.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i66.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.AiInsight => 'AiInsight',
      _i3.Playbook => 'Playbook',
      _i4.PlaybookExecution => 'PlaybookExecution',
      _i5.PlaybookStepExecution => 'PlaybookStepExecution',
      _i6.StepExecutorPayload => 'StepExecutorPayload',
      _i7.HealthSummary => 'HealthSummary',
      _i8.SystemMetrics => 'SystemMetrics',
      _i9.TeamMember => 'TeamMember',
      _i10.ExecutionStatus => 'ExecutionStatus',
      _i11.IncidentSeverity => 'IncidentSeverity',
      _i12.IncidentStatus => 'IncidentStatus',
      _i13.PlaybookType => 'PlaybookType',
      _i14.ServiceStatus => 'ServiceStatus',
      _i15.ServiceTier => 'ServiceTier',
      _i16.SignalType => 'SignalType',
      _i17.TimelineItemType => 'TimelineItemType',
      _i18.Greeting => 'Greeting',
      _i19.Incident => 'Incident',
      _i20.IncidentTimelineItem => 'IncidentTimelineItem',
      _i21.ReportSnapshot => 'ReportSnapshot',
      _i22.AuditLog => 'AuditLog',
      _i23.OpsUser => 'OpsUser',
      _i24.Role => 'Role',
      _i25.ServiceToken => 'ServiceToken',
      _i26.UserRole => 'UserRole',
      _i27.HealthSignal => 'HealthSignal',
      _i28.Rule => 'Rule',
      _i29.Service => 'Service',
      _i30.Environment => 'Environment',
      _i31.Integration => 'Integration',
      _i32.NotificationPreference => 'NotificationPreference',
      _i33.SystemSetting => 'SystemSetting',
      _i34.StreamAlert => 'StreamAlert',
      _i35.StreamIncidentUpdate => 'StreamIncidentUpdate',
      _i36.StreamLogEntry => 'StreamLogEntry',
      _i37.StreamMetric => 'StreamMetric',
      _i38.StreamServiceStatus => 'StreamServiceStatus',
      _i39.StreamSignalUpdate => 'StreamSignalUpdate',
      _i40.StreamSubscription => 'StreamSubscription',
      _i41.StreamSubscriptionType => 'StreamSubscriptionType',
      _i42.StreamTimelineEvent => 'StreamTimelineEvent',
      _i43.StreamUpdateType => 'StreamUpdateType',
      _i44.TelemetryEvent => 'TelemetryEvent',
      _i45.TelemetryHeartbeat => 'TelemetryHeartbeat',
      _i46.TelemetryResources => 'TelemetryResources',
      _i47.TelemetrySignalBatch => 'TelemetrySignalBatch',
      _i48.TelemetrySignalPayload => 'TelemetrySignalPayload',
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
      case _i2.AiInsight():
        return 'AiInsight';
      case _i3.Playbook():
        return 'Playbook';
      case _i4.PlaybookExecution():
        return 'PlaybookExecution';
      case _i5.PlaybookStepExecution():
        return 'PlaybookStepExecution';
      case _i6.StepExecutorPayload():
        return 'StepExecutorPayload';
      case _i7.HealthSummary():
        return 'HealthSummary';
      case _i8.SystemMetrics():
        return 'SystemMetrics';
      case _i9.TeamMember():
        return 'TeamMember';
      case _i10.ExecutionStatus():
        return 'ExecutionStatus';
      case _i11.IncidentSeverity():
        return 'IncidentSeverity';
      case _i12.IncidentStatus():
        return 'IncidentStatus';
      case _i13.PlaybookType():
        return 'PlaybookType';
      case _i14.ServiceStatus():
        return 'ServiceStatus';
      case _i15.ServiceTier():
        return 'ServiceTier';
      case _i16.SignalType():
        return 'SignalType';
      case _i17.TimelineItemType():
        return 'TimelineItemType';
      case _i18.Greeting():
        return 'Greeting';
      case _i19.Incident():
        return 'Incident';
      case _i20.IncidentTimelineItem():
        return 'IncidentTimelineItem';
      case _i21.ReportSnapshot():
        return 'ReportSnapshot';
      case _i22.AuditLog():
        return 'AuditLog';
      case _i23.OpsUser():
        return 'OpsUser';
      case _i24.Role():
        return 'Role';
      case _i25.ServiceToken():
        return 'ServiceToken';
      case _i26.UserRole():
        return 'UserRole';
      case _i27.HealthSignal():
        return 'HealthSignal';
      case _i28.Rule():
        return 'Rule';
      case _i29.Service():
        return 'Service';
      case _i30.Environment():
        return 'Environment';
      case _i31.Integration():
        return 'Integration';
      case _i32.NotificationPreference():
        return 'NotificationPreference';
      case _i33.SystemSetting():
        return 'SystemSetting';
      case _i34.StreamAlert():
        return 'StreamAlert';
      case _i35.StreamIncidentUpdate():
        return 'StreamIncidentUpdate';
      case _i36.StreamLogEntry():
        return 'StreamLogEntry';
      case _i37.StreamMetric():
        return 'StreamMetric';
      case _i38.StreamServiceStatus():
        return 'StreamServiceStatus';
      case _i39.StreamSignalUpdate():
        return 'StreamSignalUpdate';
      case _i40.StreamSubscription():
        return 'StreamSubscription';
      case _i41.StreamSubscriptionType():
        return 'StreamSubscriptionType';
      case _i42.StreamTimelineEvent():
        return 'StreamTimelineEvent';
      case _i43.StreamUpdateType():
        return 'StreamUpdateType';
      case _i44.TelemetryEvent():
        return 'TelemetryEvent';
      case _i45.TelemetryHeartbeat():
        return 'TelemetryHeartbeat';
      case _i46.TelemetryResources():
        return 'TelemetryResources';
      case _i47.TelemetrySignalBatch():
        return 'TelemetrySignalBatch';
      case _i48.TelemetrySignalPayload():
        return 'TelemetrySignalPayload';
    }
    className = _i64.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i65.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    className = _i66.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'AiInsight') {
      return deserialize<_i2.AiInsight>(data['data']);
    }
    if (dataClassName == 'Playbook') {
      return deserialize<_i3.Playbook>(data['data']);
    }
    if (dataClassName == 'PlaybookExecution') {
      return deserialize<_i4.PlaybookExecution>(data['data']);
    }
    if (dataClassName == 'PlaybookStepExecution') {
      return deserialize<_i5.PlaybookStepExecution>(data['data']);
    }
    if (dataClassName == 'StepExecutorPayload') {
      return deserialize<_i6.StepExecutorPayload>(data['data']);
    }
    if (dataClassName == 'HealthSummary') {
      return deserialize<_i7.HealthSummary>(data['data']);
    }
    if (dataClassName == 'SystemMetrics') {
      return deserialize<_i8.SystemMetrics>(data['data']);
    }
    if (dataClassName == 'TeamMember') {
      return deserialize<_i9.TeamMember>(data['data']);
    }
    if (dataClassName == 'ExecutionStatus') {
      return deserialize<_i10.ExecutionStatus>(data['data']);
    }
    if (dataClassName == 'IncidentSeverity') {
      return deserialize<_i11.IncidentSeverity>(data['data']);
    }
    if (dataClassName == 'IncidentStatus') {
      return deserialize<_i12.IncidentStatus>(data['data']);
    }
    if (dataClassName == 'PlaybookType') {
      return deserialize<_i13.PlaybookType>(data['data']);
    }
    if (dataClassName == 'ServiceStatus') {
      return deserialize<_i14.ServiceStatus>(data['data']);
    }
    if (dataClassName == 'ServiceTier') {
      return deserialize<_i15.ServiceTier>(data['data']);
    }
    if (dataClassName == 'SignalType') {
      return deserialize<_i16.SignalType>(data['data']);
    }
    if (dataClassName == 'TimelineItemType') {
      return deserialize<_i17.TimelineItemType>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i18.Greeting>(data['data']);
    }
    if (dataClassName == 'Incident') {
      return deserialize<_i19.Incident>(data['data']);
    }
    if (dataClassName == 'IncidentTimelineItem') {
      return deserialize<_i20.IncidentTimelineItem>(data['data']);
    }
    if (dataClassName == 'ReportSnapshot') {
      return deserialize<_i21.ReportSnapshot>(data['data']);
    }
    if (dataClassName == 'AuditLog') {
      return deserialize<_i22.AuditLog>(data['data']);
    }
    if (dataClassName == 'OpsUser') {
      return deserialize<_i23.OpsUser>(data['data']);
    }
    if (dataClassName == 'Role') {
      return deserialize<_i24.Role>(data['data']);
    }
    if (dataClassName == 'ServiceToken') {
      return deserialize<_i25.ServiceToken>(data['data']);
    }
    if (dataClassName == 'UserRole') {
      return deserialize<_i26.UserRole>(data['data']);
    }
    if (dataClassName == 'HealthSignal') {
      return deserialize<_i27.HealthSignal>(data['data']);
    }
    if (dataClassName == 'Rule') {
      return deserialize<_i28.Rule>(data['data']);
    }
    if (dataClassName == 'Service') {
      return deserialize<_i29.Service>(data['data']);
    }
    if (dataClassName == 'Environment') {
      return deserialize<_i30.Environment>(data['data']);
    }
    if (dataClassName == 'Integration') {
      return deserialize<_i31.Integration>(data['data']);
    }
    if (dataClassName == 'NotificationPreference') {
      return deserialize<_i32.NotificationPreference>(data['data']);
    }
    if (dataClassName == 'SystemSetting') {
      return deserialize<_i33.SystemSetting>(data['data']);
    }
    if (dataClassName == 'StreamAlert') {
      return deserialize<_i34.StreamAlert>(data['data']);
    }
    if (dataClassName == 'StreamIncidentUpdate') {
      return deserialize<_i35.StreamIncidentUpdate>(data['data']);
    }
    if (dataClassName == 'StreamLogEntry') {
      return deserialize<_i36.StreamLogEntry>(data['data']);
    }
    if (dataClassName == 'StreamMetric') {
      return deserialize<_i37.StreamMetric>(data['data']);
    }
    if (dataClassName == 'StreamServiceStatus') {
      return deserialize<_i38.StreamServiceStatus>(data['data']);
    }
    if (dataClassName == 'StreamSignalUpdate') {
      return deserialize<_i39.StreamSignalUpdate>(data['data']);
    }
    if (dataClassName == 'StreamSubscription') {
      return deserialize<_i40.StreamSubscription>(data['data']);
    }
    if (dataClassName == 'StreamSubscriptionType') {
      return deserialize<_i41.StreamSubscriptionType>(data['data']);
    }
    if (dataClassName == 'StreamTimelineEvent') {
      return deserialize<_i42.StreamTimelineEvent>(data['data']);
    }
    if (dataClassName == 'StreamUpdateType') {
      return deserialize<_i43.StreamUpdateType>(data['data']);
    }
    if (dataClassName == 'TelemetryEvent') {
      return deserialize<_i44.TelemetryEvent>(data['data']);
    }
    if (dataClassName == 'TelemetryHeartbeat') {
      return deserialize<_i45.TelemetryHeartbeat>(data['data']);
    }
    if (dataClassName == 'TelemetryResources') {
      return deserialize<_i46.TelemetryResources>(data['data']);
    }
    if (dataClassName == 'TelemetrySignalBatch') {
      return deserialize<_i47.TelemetrySignalBatch>(data['data']);
    }
    if (dataClassName == 'TelemetrySignalPayload') {
      return deserialize<_i48.TelemetrySignalPayload>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i64.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i65.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i66.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
