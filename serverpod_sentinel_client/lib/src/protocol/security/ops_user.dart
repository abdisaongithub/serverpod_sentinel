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
import '../security/user_role.dart' as _i2;
import '../service/service.dart' as _i3;
import '../incident/incident.dart' as _i4;
import '../incident/incident_timeline_item.dart' as _i5;
import '../automation/playbook_execution.dart' as _i6;
import '../security/audit_log.dart' as _i7;
import 'package:serverpod_sentinel_client/src/protocol/protocol.dart' as _i8;

/// A system operator or administrator.
abstract class OpsUser implements _i1.SerializableModel {
  OpsUser._({
    this.id,
    required this.userInfoId,
    this.roles,
    this.services,
    this.incidents,
    this.timelineItems,
    this.playbookExecutions,
    this.auditLogs,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OpsUser({
    int? id,
    required int userInfoId,
    List<_i2.UserRole>? roles,
    List<_i3.Service>? services,
    List<_i4.Incident>? incidents,
    List<_i5.IncidentTimelineItem>? timelineItems,
    List<_i6.PlaybookExecution>? playbookExecutions,
    List<_i7.AuditLog>? auditLogs,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _OpsUserImpl;

  factory OpsUser.fromJson(Map<String, dynamic> jsonSerialization) {
    return OpsUser(
      id: jsonSerialization['id'] as int?,
      userInfoId: jsonSerialization['userInfoId'] as int,
      roles: jsonSerialization['roles'] == null
          ? null
          : _i8.Protocol().deserialize<List<_i2.UserRole>>(
              jsonSerialization['roles'],
            ),
      services: jsonSerialization['services'] == null
          ? null
          : _i8.Protocol().deserialize<List<_i3.Service>>(
              jsonSerialization['services'],
            ),
      incidents: jsonSerialization['incidents'] == null
          ? null
          : _i8.Protocol().deserialize<List<_i4.Incident>>(
              jsonSerialization['incidents'],
            ),
      timelineItems: jsonSerialization['timelineItems'] == null
          ? null
          : _i8.Protocol().deserialize<List<_i5.IncidentTimelineItem>>(
              jsonSerialization['timelineItems'],
            ),
      playbookExecutions: jsonSerialization['playbookExecutions'] == null
          ? null
          : _i8.Protocol().deserialize<List<_i6.PlaybookExecution>>(
              jsonSerialization['playbookExecutions'],
            ),
      auditLogs: jsonSerialization['auditLogs'] == null
          ? null
          : _i8.Protocol().deserialize<List<_i7.AuditLog>>(
              jsonSerialization['auditLogs'],
            ),
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

  int userInfoId;

  List<_i2.UserRole>? roles;

  List<_i3.Service>? services;

  List<_i4.Incident>? incidents;

  List<_i5.IncidentTimelineItem>? timelineItems;

  List<_i6.PlaybookExecution>? playbookExecutions;

  List<_i7.AuditLog>? auditLogs;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [OpsUser]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  OpsUser copyWith({
    int? id,
    int? userInfoId,
    List<_i2.UserRole>? roles,
    List<_i3.Service>? services,
    List<_i4.Incident>? incidents,
    List<_i5.IncidentTimelineItem>? timelineItems,
    List<_i6.PlaybookExecution>? playbookExecutions,
    List<_i7.AuditLog>? auditLogs,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'OpsUser',
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (roles != null) 'roles': roles?.toJson(valueToJson: (v) => v.toJson()),
      if (services != null)
        'services': services?.toJson(valueToJson: (v) => v.toJson()),
      if (incidents != null)
        'incidents': incidents?.toJson(valueToJson: (v) => v.toJson()),
      if (timelineItems != null)
        'timelineItems': timelineItems?.toJson(valueToJson: (v) => v.toJson()),
      if (playbookExecutions != null)
        'playbookExecutions': playbookExecutions?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (auditLogs != null)
        'auditLogs': auditLogs?.toJson(valueToJson: (v) => v.toJson()),
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

class _OpsUserImpl extends OpsUser {
  _OpsUserImpl({
    int? id,
    required int userInfoId,
    List<_i2.UserRole>? roles,
    List<_i3.Service>? services,
    List<_i4.Incident>? incidents,
    List<_i5.IncidentTimelineItem>? timelineItems,
    List<_i6.PlaybookExecution>? playbookExecutions,
    List<_i7.AuditLog>? auditLogs,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         userInfoId: userInfoId,
         roles: roles,
         services: services,
         incidents: incidents,
         timelineItems: timelineItems,
         playbookExecutions: playbookExecutions,
         auditLogs: auditLogs,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [OpsUser]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  OpsUser copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    Object? roles = _Undefined,
    Object? services = _Undefined,
    Object? incidents = _Undefined,
    Object? timelineItems = _Undefined,
    Object? playbookExecutions = _Undefined,
    Object? auditLogs = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return OpsUser(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      roles: roles is List<_i2.UserRole>?
          ? roles
          : this.roles?.map((e0) => e0.copyWith()).toList(),
      services: services is List<_i3.Service>?
          ? services
          : this.services?.map((e0) => e0.copyWith()).toList(),
      incidents: incidents is List<_i4.Incident>?
          ? incidents
          : this.incidents?.map((e0) => e0.copyWith()).toList(),
      timelineItems: timelineItems is List<_i5.IncidentTimelineItem>?
          ? timelineItems
          : this.timelineItems?.map((e0) => e0.copyWith()).toList(),
      playbookExecutions: playbookExecutions is List<_i6.PlaybookExecution>?
          ? playbookExecutions
          : this.playbookExecutions?.map((e0) => e0.copyWith()).toList(),
      auditLogs: auditLogs is List<_i7.AuditLog>?
          ? auditLogs
          : this.auditLogs?.map((e0) => e0.copyWith()).toList(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
