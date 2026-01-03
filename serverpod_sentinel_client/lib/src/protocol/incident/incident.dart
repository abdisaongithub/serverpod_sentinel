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
import '../service/service.dart' as _i2;
import '../service/rule.dart' as _i3;
import '../enums/incident_status.dart' as _i4;
import '../enums/incident_severity.dart' as _i5;
import '../security/ops_user.dart' as _i6;
import '../incident/incident_timeline_item.dart' as _i7;
import '../automation/playbook_execution.dart' as _i8;
import 'package:serverpod_sentinel_client/src/protocol/protocol.dart' as _i9;

/// Represents a service disruption or alert.
abstract class Incident implements _i1.SerializableModel {
  Incident._({
    this.id,
    required this.title,
    this.summary,
    required this.serviceId,
    required this.serviceId,
    this.service,
    this.ruleId,
    required this.ruleId,
    this.rule,
    required this.status,
    required this.severity,
    this.commanderId,
    required this.commanderId,
    this.commander,
    this.timeline,
    this.executions,
    required this.startedAt,
    this.resolvedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Incident({
    int? id,
    required String title,
    String? summary,
    required int serviceId,
    required int serviceId,
    _i2.Service? service,
    int? ruleId,
    required int ruleId,
    _i3.Rule? rule,
    required _i4.IncidentStatus status,
    required _i5.IncidentSeverity severity,
    int? commanderId,
    required int commanderId,
    _i6.OpsUser? commander,
    List<_i7.IncidentTimelineItem>? timeline,
    List<_i8.PlaybookExecution>? executions,
    required DateTime startedAt,
    DateTime? resolvedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _IncidentImpl;

  factory Incident.fromJson(Map<String, dynamic> jsonSerialization) {
    return Incident(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      summary: jsonSerialization['summary'] as String?,
      serviceId: jsonSerialization['serviceId'] as int,
      service: jsonSerialization['service'] == null
          ? null
          : _i9.Protocol().deserialize<_i2.Service>(
              jsonSerialization['service'],
            ),
      ruleId: jsonSerialization['ruleId'] as int,
      rule: jsonSerialization['rule'] == null
          ? null
          : _i9.Protocol().deserialize<_i3.Rule>(jsonSerialization['rule']),
      status: _i4.IncidentStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      severity: _i5.IncidentSeverity.fromJson(
        (jsonSerialization['severity'] as String),
      ),
      commanderId: jsonSerialization['commanderId'] as int,
      commander: jsonSerialization['commander'] == null
          ? null
          : _i9.Protocol().deserialize<_i6.OpsUser>(
              jsonSerialization['commander'],
            ),
      timeline: jsonSerialization['timeline'] == null
          ? null
          : _i9.Protocol().deserialize<List<_i7.IncidentTimelineItem>>(
              jsonSerialization['timeline'],
            ),
      executions: jsonSerialization['executions'] == null
          ? null
          : _i9.Protocol().deserialize<List<_i8.PlaybookExecution>>(
              jsonSerialization['executions'],
            ),
      startedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['startedAt'],
      ),
      resolvedAt: jsonSerialization['resolvedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['resolvedAt']),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String title;

  String? summary;

  int serviceId;

  int serviceId;

  _i2.Service? service;

  int? ruleId;

  int ruleId;

  _i3.Rule? rule;

  _i4.IncidentStatus status;

  _i5.IncidentSeverity severity;

  int? commanderId;

  int commanderId;

  _i6.OpsUser? commander;

  List<_i7.IncidentTimelineItem>? timeline;

  List<_i8.PlaybookExecution>? executions;

  DateTime startedAt;

  DateTime? resolvedAt;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [Incident]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Incident copyWith({
    int? id,
    String? title,
    String? summary,
    int? serviceId,
    int? serviceId,
    _i2.Service? service,
    int? ruleId,
    int? ruleId,
    _i3.Rule? rule,
    _i4.IncidentStatus? status,
    _i5.IncidentSeverity? severity,
    int? commanderId,
    int? commanderId,
    _i6.OpsUser? commander,
    List<_i7.IncidentTimelineItem>? timeline,
    List<_i8.PlaybookExecution>? executions,
    DateTime? startedAt,
    DateTime? resolvedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Incident',
      if (id != null) 'id': id,
      'title': title,
      if (summary != null) 'summary': summary,
      'serviceId': serviceId,
      'serviceId': serviceId,
      if (service != null) 'service': service?.toJson(),
      if (ruleId != null) 'ruleId': ruleId,
      'ruleId': ruleId,
      if (rule != null) 'rule': rule?.toJson(),
      'status': status.toJson(),
      'severity': severity.toJson(),
      if (commanderId != null) 'commanderId': commanderId,
      'commanderId': commanderId,
      if (commander != null) 'commander': commander?.toJson(),
      if (timeline != null)
        'timeline': timeline?.toJson(valueToJson: (v) => v.toJson()),
      if (executions != null)
        'executions': executions?.toJson(valueToJson: (v) => v.toJson()),
      'startedAt': startedAt.toJson(),
      if (resolvedAt != null) 'resolvedAt': resolvedAt?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _IncidentImpl extends Incident {
  _IncidentImpl({
    int? id,
    required String title,
    String? summary,
    required int serviceId,
    required int serviceId,
    _i2.Service? service,
    int? ruleId,
    required int ruleId,
    _i3.Rule? rule,
    required _i4.IncidentStatus status,
    required _i5.IncidentSeverity severity,
    int? commanderId,
    required int commanderId,
    _i6.OpsUser? commander,
    List<_i7.IncidentTimelineItem>? timeline,
    List<_i8.PlaybookExecution>? executions,
    required DateTime startedAt,
    DateTime? resolvedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         title: title,
         summary: summary,
         serviceId: serviceId,
         service: service,
         ruleId: ruleId,
         rule: rule,
         status: status,
         severity: severity,
         commanderId: commanderId,
         commander: commander,
         timeline: timeline,
         executions: executions,
         startedAt: startedAt,
         resolvedAt: resolvedAt,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Incident]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Incident copyWith({
    Object? id = _Undefined,
    String? title,
    Object? summary = _Undefined,
    int? serviceId,
    int? serviceId,
    Object? service = _Undefined,
    Object? ruleId = _Undefined,
    int? ruleId,
    Object? rule = _Undefined,
    _i4.IncidentStatus? status,
    _i5.IncidentSeverity? severity,
    Object? commanderId = _Undefined,
    int? commanderId,
    Object? commander = _Undefined,
    Object? timeline = _Undefined,
    Object? executions = _Undefined,
    DateTime? startedAt,
    Object? resolvedAt = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Incident(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      summary: summary is String? ? summary : this.summary,
      serviceId: serviceId ?? this.serviceId,
      service: service is _i2.Service? ? service : this.service?.copyWith(),
      ruleId: ruleId ?? this.ruleId,
      rule: rule is _i3.Rule? ? rule : this.rule?.copyWith(),
      status: status ?? this.status,
      severity: severity ?? this.severity,
      commanderId: commanderId ?? this.commanderId,
      commander: commander is _i6.OpsUser?
          ? commander
          : this.commander?.copyWith(),
      timeline: timeline is List<_i7.IncidentTimelineItem>?
          ? timeline
          : this.timeline?.map((e0) => e0.copyWith()).toList(),
      executions: executions is List<_i8.PlaybookExecution>?
          ? executions
          : this.executions?.map((e0) => e0.copyWith()).toList(),
      startedAt: startedAt ?? this.startedAt,
      resolvedAt: resolvedAt is DateTime? ? resolvedAt : this.resolvedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
