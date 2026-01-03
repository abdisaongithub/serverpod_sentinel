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
import 'automation/playbook.dart' as _i2;
import 'automation/playbook_execution.dart' as _i3;
import 'automation/playbook_step_execution.dart' as _i4;
import 'automation/step_executor_payload.dart' as _i5;
import 'enums/execution_status.dart' as _i6;
import 'enums/incident_severity.dart' as _i7;
import 'enums/incident_status.dart' as _i8;
import 'enums/playbook_type.dart' as _i9;
import 'enums/service_status.dart' as _i10;
import 'enums/service_tier.dart' as _i11;
import 'enums/signal_type.dart' as _i12;
import 'enums/timeline_item_type.dart' as _i13;
import 'greetings/greeting.dart' as _i14;
import 'incident/incident.dart' as _i15;
import 'incident/incident_timeline_item.dart' as _i16;
import 'reporting/report_snapshot.dart' as _i17;
import 'security/audit_log.dart' as _i18;
import 'security/ops_user.dart' as _i19;
import 'security/role.dart' as _i20;
import 'security/service_token.dart' as _i21;
import 'security/user_role.dart' as _i22;
import 'service/health_signal.dart' as _i23;
import 'service/rule.dart' as _i24;
import 'service/service.dart' as _i25;
import 'streaming/stream_incident_update.dart' as _i26;
import 'streaming/stream_service_status.dart' as _i27;
import 'streaming/stream_subscription.dart' as _i28;
import 'streaming/stream_subscription_type.dart' as _i29;
import 'streaming/stream_timeline_event.dart' as _i30;
import 'streaming/stream_update_type.dart' as _i31;
import 'telemetry/telemetry_event.dart' as _i32;
import 'telemetry/telemetry_heartbeat.dart' as _i33;
import 'telemetry/telemetry_resources.dart' as _i34;
import 'telemetry/telemetry_signal_batch.dart' as _i35;
import 'telemetry/telemetry_signal_payload.dart' as _i36;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i37;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i38;
export 'automation/playbook.dart';
export 'automation/playbook_execution.dart';
export 'automation/playbook_step_execution.dart';
export 'automation/step_executor_payload.dart';
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
export 'streaming/stream_incident_update.dart';
export 'streaming/stream_service_status.dart';
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

    if (t == _i2.Playbook) {
      return _i2.Playbook.fromJson(data) as T;
    }
    if (t == _i3.PlaybookExecution) {
      return _i3.PlaybookExecution.fromJson(data) as T;
    }
    if (t == _i4.PlaybookStepExecution) {
      return _i4.PlaybookStepExecution.fromJson(data) as T;
    }
    if (t == _i5.StepExecutorPayload) {
      return _i5.StepExecutorPayload.fromJson(data) as T;
    }
    if (t == _i6.ExecutionStatus) {
      return _i6.ExecutionStatus.fromJson(data) as T;
    }
    if (t == _i7.IncidentSeverity) {
      return _i7.IncidentSeverity.fromJson(data) as T;
    }
    if (t == _i8.IncidentStatus) {
      return _i8.IncidentStatus.fromJson(data) as T;
    }
    if (t == _i9.PlaybookType) {
      return _i9.PlaybookType.fromJson(data) as T;
    }
    if (t == _i10.ServiceStatus) {
      return _i10.ServiceStatus.fromJson(data) as T;
    }
    if (t == _i11.ServiceTier) {
      return _i11.ServiceTier.fromJson(data) as T;
    }
    if (t == _i12.SignalType) {
      return _i12.SignalType.fromJson(data) as T;
    }
    if (t == _i13.TimelineItemType) {
      return _i13.TimelineItemType.fromJson(data) as T;
    }
    if (t == _i14.Greeting) {
      return _i14.Greeting.fromJson(data) as T;
    }
    if (t == _i15.Incident) {
      return _i15.Incident.fromJson(data) as T;
    }
    if (t == _i16.IncidentTimelineItem) {
      return _i16.IncidentTimelineItem.fromJson(data) as T;
    }
    if (t == _i17.ReportSnapshot) {
      return _i17.ReportSnapshot.fromJson(data) as T;
    }
    if (t == _i18.AuditLog) {
      return _i18.AuditLog.fromJson(data) as T;
    }
    if (t == _i19.OpsUser) {
      return _i19.OpsUser.fromJson(data) as T;
    }
    if (t == _i20.Role) {
      return _i20.Role.fromJson(data) as T;
    }
    if (t == _i21.ServiceToken) {
      return _i21.ServiceToken.fromJson(data) as T;
    }
    if (t == _i22.UserRole) {
      return _i22.UserRole.fromJson(data) as T;
    }
    if (t == _i23.HealthSignal) {
      return _i23.HealthSignal.fromJson(data) as T;
    }
    if (t == _i24.Rule) {
      return _i24.Rule.fromJson(data) as T;
    }
    if (t == _i25.Service) {
      return _i25.Service.fromJson(data) as T;
    }
    if (t == _i26.StreamIncidentUpdate) {
      return _i26.StreamIncidentUpdate.fromJson(data) as T;
    }
    if (t == _i27.StreamServiceStatus) {
      return _i27.StreamServiceStatus.fromJson(data) as T;
    }
    if (t == _i28.StreamSubscription) {
      return _i28.StreamSubscription.fromJson(data) as T;
    }
    if (t == _i29.StreamSubscriptionType) {
      return _i29.StreamSubscriptionType.fromJson(data) as T;
    }
    if (t == _i30.StreamTimelineEvent) {
      return _i30.StreamTimelineEvent.fromJson(data) as T;
    }
    if (t == _i31.StreamUpdateType) {
      return _i31.StreamUpdateType.fromJson(data) as T;
    }
    if (t == _i32.TelemetryEvent) {
      return _i32.TelemetryEvent.fromJson(data) as T;
    }
    if (t == _i33.TelemetryHeartbeat) {
      return _i33.TelemetryHeartbeat.fromJson(data) as T;
    }
    if (t == _i34.TelemetryResources) {
      return _i34.TelemetryResources.fromJson(data) as T;
    }
    if (t == _i35.TelemetrySignalBatch) {
      return _i35.TelemetrySignalBatch.fromJson(data) as T;
    }
    if (t == _i36.TelemetrySignalPayload) {
      return _i36.TelemetrySignalPayload.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Playbook?>()) {
      return (data != null ? _i2.Playbook.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.PlaybookExecution?>()) {
      return (data != null ? _i3.PlaybookExecution.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.PlaybookStepExecution?>()) {
      return (data != null ? _i4.PlaybookStepExecution.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i5.StepExecutorPayload?>()) {
      return (data != null ? _i5.StepExecutorPayload.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i6.ExecutionStatus?>()) {
      return (data != null ? _i6.ExecutionStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.IncidentSeverity?>()) {
      return (data != null ? _i7.IncidentSeverity.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.IncidentStatus?>()) {
      return (data != null ? _i8.IncidentStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.PlaybookType?>()) {
      return (data != null ? _i9.PlaybookType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.ServiceStatus?>()) {
      return (data != null ? _i10.ServiceStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.ServiceTier?>()) {
      return (data != null ? _i11.ServiceTier.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.SignalType?>()) {
      return (data != null ? _i12.SignalType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.TimelineItemType?>()) {
      return (data != null ? _i13.TimelineItemType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.Greeting?>()) {
      return (data != null ? _i14.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.Incident?>()) {
      return (data != null ? _i15.Incident.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.IncidentTimelineItem?>()) {
      return (data != null ? _i16.IncidentTimelineItem.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i17.ReportSnapshot?>()) {
      return (data != null ? _i17.ReportSnapshot.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.AuditLog?>()) {
      return (data != null ? _i18.AuditLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.OpsUser?>()) {
      return (data != null ? _i19.OpsUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.Role?>()) {
      return (data != null ? _i20.Role.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.ServiceToken?>()) {
      return (data != null ? _i21.ServiceToken.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.UserRole?>()) {
      return (data != null ? _i22.UserRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.HealthSignal?>()) {
      return (data != null ? _i23.HealthSignal.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.Rule?>()) {
      return (data != null ? _i24.Rule.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.Service?>()) {
      return (data != null ? _i25.Service.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.StreamIncidentUpdate?>()) {
      return (data != null ? _i26.StreamIncidentUpdate.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i27.StreamServiceStatus?>()) {
      return (data != null ? _i27.StreamServiceStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i28.StreamSubscription?>()) {
      return (data != null ? _i28.StreamSubscription.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i29.StreamSubscriptionType?>()) {
      return (data != null ? _i29.StreamSubscriptionType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i30.StreamTimelineEvent?>()) {
      return (data != null ? _i30.StreamTimelineEvent.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i31.StreamUpdateType?>()) {
      return (data != null ? _i31.StreamUpdateType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.TelemetryEvent?>()) {
      return (data != null ? _i32.TelemetryEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.TelemetryHeartbeat?>()) {
      return (data != null ? _i33.TelemetryHeartbeat.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i34.TelemetryResources?>()) {
      return (data != null ? _i34.TelemetryResources.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i35.TelemetrySignalBatch?>()) {
      return (data != null ? _i35.TelemetrySignalBatch.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i36.TelemetrySignalPayload?>()) {
      return (data != null ? _i36.TelemetrySignalPayload.fromJson(data) : null)
          as T;
    }
    if (t == List<_i3.PlaybookExecution>) {
      return (data as List)
              .map((e) => deserialize<_i3.PlaybookExecution>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i3.PlaybookExecution>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i3.PlaybookExecution>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i16.IncidentTimelineItem>) {
      return (data as List)
              .map((e) => deserialize<_i16.IncidentTimelineItem>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i16.IncidentTimelineItem>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i16.IncidentTimelineItem>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i22.UserRole>) {
      return (data as List).map((e) => deserialize<_i22.UserRole>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i22.UserRole>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i22.UserRole>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i25.Service>) {
      return (data as List).map((e) => deserialize<_i25.Service>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i25.Service>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i25.Service>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i15.Incident>) {
      return (data as List).map((e) => deserialize<_i15.Incident>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i15.Incident>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i15.Incident>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i18.AuditLog>) {
      return (data as List).map((e) => deserialize<_i18.AuditLog>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i18.AuditLog>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i18.AuditLog>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i23.HealthSignal>) {
      return (data as List)
              .map((e) => deserialize<_i23.HealthSignal>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i23.HealthSignal>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i23.HealthSignal>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i24.Rule>) {
      return (data as List).map((e) => deserialize<_i24.Rule>(e)).toList() as T;
    }
    if (t == _i1.getType<List<_i24.Rule>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i24.Rule>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i36.TelemetrySignalPayload>) {
      return (data as List)
              .map((e) => deserialize<_i36.TelemetrySignalPayload>(e))
              .toList()
          as T;
    }
    try {
      return _i37.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i38.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.Playbook => 'Playbook',
      _i3.PlaybookExecution => 'PlaybookExecution',
      _i4.PlaybookStepExecution => 'PlaybookStepExecution',
      _i5.StepExecutorPayload => 'StepExecutorPayload',
      _i6.ExecutionStatus => 'ExecutionStatus',
      _i7.IncidentSeverity => 'IncidentSeverity',
      _i8.IncidentStatus => 'IncidentStatus',
      _i9.PlaybookType => 'PlaybookType',
      _i10.ServiceStatus => 'ServiceStatus',
      _i11.ServiceTier => 'ServiceTier',
      _i12.SignalType => 'SignalType',
      _i13.TimelineItemType => 'TimelineItemType',
      _i14.Greeting => 'Greeting',
      _i15.Incident => 'Incident',
      _i16.IncidentTimelineItem => 'IncidentTimelineItem',
      _i17.ReportSnapshot => 'ReportSnapshot',
      _i18.AuditLog => 'AuditLog',
      _i19.OpsUser => 'OpsUser',
      _i20.Role => 'Role',
      _i21.ServiceToken => 'ServiceToken',
      _i22.UserRole => 'UserRole',
      _i23.HealthSignal => 'HealthSignal',
      _i24.Rule => 'Rule',
      _i25.Service => 'Service',
      _i26.StreamIncidentUpdate => 'StreamIncidentUpdate',
      _i27.StreamServiceStatus => 'StreamServiceStatus',
      _i28.StreamSubscription => 'StreamSubscription',
      _i29.StreamSubscriptionType => 'StreamSubscriptionType',
      _i30.StreamTimelineEvent => 'StreamTimelineEvent',
      _i31.StreamUpdateType => 'StreamUpdateType',
      _i32.TelemetryEvent => 'TelemetryEvent',
      _i33.TelemetryHeartbeat => 'TelemetryHeartbeat',
      _i34.TelemetryResources => 'TelemetryResources',
      _i35.TelemetrySignalBatch => 'TelemetrySignalBatch',
      _i36.TelemetrySignalPayload => 'TelemetrySignalPayload',
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
      case _i2.Playbook():
        return 'Playbook';
      case _i3.PlaybookExecution():
        return 'PlaybookExecution';
      case _i4.PlaybookStepExecution():
        return 'PlaybookStepExecution';
      case _i5.StepExecutorPayload():
        return 'StepExecutorPayload';
      case _i6.ExecutionStatus():
        return 'ExecutionStatus';
      case _i7.IncidentSeverity():
        return 'IncidentSeverity';
      case _i8.IncidentStatus():
        return 'IncidentStatus';
      case _i9.PlaybookType():
        return 'PlaybookType';
      case _i10.ServiceStatus():
        return 'ServiceStatus';
      case _i11.ServiceTier():
        return 'ServiceTier';
      case _i12.SignalType():
        return 'SignalType';
      case _i13.TimelineItemType():
        return 'TimelineItemType';
      case _i14.Greeting():
        return 'Greeting';
      case _i15.Incident():
        return 'Incident';
      case _i16.IncidentTimelineItem():
        return 'IncidentTimelineItem';
      case _i17.ReportSnapshot():
        return 'ReportSnapshot';
      case _i18.AuditLog():
        return 'AuditLog';
      case _i19.OpsUser():
        return 'OpsUser';
      case _i20.Role():
        return 'Role';
      case _i21.ServiceToken():
        return 'ServiceToken';
      case _i22.UserRole():
        return 'UserRole';
      case _i23.HealthSignal():
        return 'HealthSignal';
      case _i24.Rule():
        return 'Rule';
      case _i25.Service():
        return 'Service';
      case _i26.StreamIncidentUpdate():
        return 'StreamIncidentUpdate';
      case _i27.StreamServiceStatus():
        return 'StreamServiceStatus';
      case _i28.StreamSubscription():
        return 'StreamSubscription';
      case _i29.StreamSubscriptionType():
        return 'StreamSubscriptionType';
      case _i30.StreamTimelineEvent():
        return 'StreamTimelineEvent';
      case _i31.StreamUpdateType():
        return 'StreamUpdateType';
      case _i32.TelemetryEvent():
        return 'TelemetryEvent';
      case _i33.TelemetryHeartbeat():
        return 'TelemetryHeartbeat';
      case _i34.TelemetryResources():
        return 'TelemetryResources';
      case _i35.TelemetrySignalBatch():
        return 'TelemetrySignalBatch';
      case _i36.TelemetrySignalPayload():
        return 'TelemetrySignalPayload';
    }
    className = _i37.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i38.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'Playbook') {
      return deserialize<_i2.Playbook>(data['data']);
    }
    if (dataClassName == 'PlaybookExecution') {
      return deserialize<_i3.PlaybookExecution>(data['data']);
    }
    if (dataClassName == 'PlaybookStepExecution') {
      return deserialize<_i4.PlaybookStepExecution>(data['data']);
    }
    if (dataClassName == 'StepExecutorPayload') {
      return deserialize<_i5.StepExecutorPayload>(data['data']);
    }
    if (dataClassName == 'ExecutionStatus') {
      return deserialize<_i6.ExecutionStatus>(data['data']);
    }
    if (dataClassName == 'IncidentSeverity') {
      return deserialize<_i7.IncidentSeverity>(data['data']);
    }
    if (dataClassName == 'IncidentStatus') {
      return deserialize<_i8.IncidentStatus>(data['data']);
    }
    if (dataClassName == 'PlaybookType') {
      return deserialize<_i9.PlaybookType>(data['data']);
    }
    if (dataClassName == 'ServiceStatus') {
      return deserialize<_i10.ServiceStatus>(data['data']);
    }
    if (dataClassName == 'ServiceTier') {
      return deserialize<_i11.ServiceTier>(data['data']);
    }
    if (dataClassName == 'SignalType') {
      return deserialize<_i12.SignalType>(data['data']);
    }
    if (dataClassName == 'TimelineItemType') {
      return deserialize<_i13.TimelineItemType>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i14.Greeting>(data['data']);
    }
    if (dataClassName == 'Incident') {
      return deserialize<_i15.Incident>(data['data']);
    }
    if (dataClassName == 'IncidentTimelineItem') {
      return deserialize<_i16.IncidentTimelineItem>(data['data']);
    }
    if (dataClassName == 'ReportSnapshot') {
      return deserialize<_i17.ReportSnapshot>(data['data']);
    }
    if (dataClassName == 'AuditLog') {
      return deserialize<_i18.AuditLog>(data['data']);
    }
    if (dataClassName == 'OpsUser') {
      return deserialize<_i19.OpsUser>(data['data']);
    }
    if (dataClassName == 'Role') {
      return deserialize<_i20.Role>(data['data']);
    }
    if (dataClassName == 'ServiceToken') {
      return deserialize<_i21.ServiceToken>(data['data']);
    }
    if (dataClassName == 'UserRole') {
      return deserialize<_i22.UserRole>(data['data']);
    }
    if (dataClassName == 'HealthSignal') {
      return deserialize<_i23.HealthSignal>(data['data']);
    }
    if (dataClassName == 'Rule') {
      return deserialize<_i24.Rule>(data['data']);
    }
    if (dataClassName == 'Service') {
      return deserialize<_i25.Service>(data['data']);
    }
    if (dataClassName == 'StreamIncidentUpdate') {
      return deserialize<_i26.StreamIncidentUpdate>(data['data']);
    }
    if (dataClassName == 'StreamServiceStatus') {
      return deserialize<_i27.StreamServiceStatus>(data['data']);
    }
    if (dataClassName == 'StreamSubscription') {
      return deserialize<_i28.StreamSubscription>(data['data']);
    }
    if (dataClassName == 'StreamSubscriptionType') {
      return deserialize<_i29.StreamSubscriptionType>(data['data']);
    }
    if (dataClassName == 'StreamTimelineEvent') {
      return deserialize<_i30.StreamTimelineEvent>(data['data']);
    }
    if (dataClassName == 'StreamUpdateType') {
      return deserialize<_i31.StreamUpdateType>(data['data']);
    }
    if (dataClassName == 'TelemetryEvent') {
      return deserialize<_i32.TelemetryEvent>(data['data']);
    }
    if (dataClassName == 'TelemetryHeartbeat') {
      return deserialize<_i33.TelemetryHeartbeat>(data['data']);
    }
    if (dataClassName == 'TelemetryResources') {
      return deserialize<_i34.TelemetryResources>(data['data']);
    }
    if (dataClassName == 'TelemetrySignalBatch') {
      return deserialize<_i35.TelemetrySignalBatch>(data['data']);
    }
    if (dataClassName == 'TelemetrySignalPayload') {
      return deserialize<_i36.TelemetrySignalPayload>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i37.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i38.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
