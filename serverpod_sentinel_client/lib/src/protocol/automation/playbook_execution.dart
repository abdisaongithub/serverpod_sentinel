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
import '../automation/playbook.dart' as _i2;
import '../incident/incident.dart' as _i3;
import '../security/ops_user.dart' as _i4;
import '../enums/execution_status.dart' as _i5;
import 'package:serverpod_sentinel_client/src/protocol/protocol.dart' as _i6;

/// An instance of a playbook running against a specific incident.
abstract class PlaybookExecution implements _i1.SerializableModel {
  PlaybookExecution._({
    this.id,
    required this.playbookId,
    required this.playbookId,
    this.playbook,
    required this.incidentId,
    required this.incidentId,
    this.incident,
    required this.initiatorId,
    required this.initiatorId,
    this.initiator,
    required this.status,
    required this.startedAt,
    this.completedAt,
    this.resultSummary,
  });

  factory PlaybookExecution({
    int? id,
    required int playbookId,
    required int playbookId,
    _i2.Playbook? playbook,
    required int incidentId,
    required int incidentId,
    _i3.Incident? incident,
    required int initiatorId,
    required int initiatorId,
    _i4.OpsUser? initiator,
    required _i5.ExecutionStatus status,
    required DateTime startedAt,
    DateTime? completedAt,
    String? resultSummary,
  }) = _PlaybookExecutionImpl;

  factory PlaybookExecution.fromJson(Map<String, dynamic> jsonSerialization) {
    return PlaybookExecution(
      id: jsonSerialization['id'] as int?,
      playbookId: jsonSerialization['playbookId'] as int,
      playbook: jsonSerialization['playbook'] == null
          ? null
          : _i6.Protocol().deserialize<_i2.Playbook>(
              jsonSerialization['playbook'],
            ),
      incidentId: jsonSerialization['incidentId'] as int,
      incident: jsonSerialization['incident'] == null
          ? null
          : _i6.Protocol().deserialize<_i3.Incident>(
              jsonSerialization['incident'],
            ),
      initiatorId: jsonSerialization['initiatorId'] as int,
      initiator: jsonSerialization['initiator'] == null
          ? null
          : _i6.Protocol().deserialize<_i4.OpsUser>(
              jsonSerialization['initiator'],
            ),
      status: _i5.ExecutionStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      startedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['startedAt'],
      ),
      completedAt: jsonSerialization['completedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['completedAt'],
            ),
      resultSummary: jsonSerialization['resultSummary'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int playbookId;

  int playbookId;

  _i2.Playbook? playbook;

  int incidentId;

  int incidentId;

  _i3.Incident? incident;

  int initiatorId;

  int initiatorId;

  _i4.OpsUser? initiator;

  _i5.ExecutionStatus status;

  DateTime startedAt;

  DateTime? completedAt;

  String? resultSummary;

  /// Returns a shallow copy of this [PlaybookExecution]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PlaybookExecution copyWith({
    int? id,
    int? playbookId,
    int? playbookId,
    _i2.Playbook? playbook,
    int? incidentId,
    int? incidentId,
    _i3.Incident? incident,
    int? initiatorId,
    int? initiatorId,
    _i4.OpsUser? initiator,
    _i5.ExecutionStatus? status,
    DateTime? startedAt,
    DateTime? completedAt,
    String? resultSummary,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PlaybookExecution',
      if (id != null) 'id': id,
      'playbookId': playbookId,
      'playbookId': playbookId,
      if (playbook != null) 'playbook': playbook?.toJson(),
      'incidentId': incidentId,
      'incidentId': incidentId,
      if (incident != null) 'incident': incident?.toJson(),
      'initiatorId': initiatorId,
      'initiatorId': initiatorId,
      if (initiator != null) 'initiator': initiator?.toJson(),
      'status': status.toJson(),
      'startedAt': startedAt.toJson(),
      if (completedAt != null) 'completedAt': completedAt?.toJson(),
      if (resultSummary != null) 'resultSummary': resultSummary,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PlaybookExecutionImpl extends PlaybookExecution {
  _PlaybookExecutionImpl({
    int? id,
    required int playbookId,
    required int playbookId,
    _i2.Playbook? playbook,
    required int incidentId,
    required int incidentId,
    _i3.Incident? incident,
    required int initiatorId,
    required int initiatorId,
    _i4.OpsUser? initiator,
    required _i5.ExecutionStatus status,
    required DateTime startedAt,
    DateTime? completedAt,
    String? resultSummary,
  }) : super._(
         id: id,
         playbookId: playbookId,
         playbook: playbook,
         incidentId: incidentId,
         incident: incident,
         initiatorId: initiatorId,
         initiator: initiator,
         status: status,
         startedAt: startedAt,
         completedAt: completedAt,
         resultSummary: resultSummary,
       );

  /// Returns a shallow copy of this [PlaybookExecution]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PlaybookExecution copyWith({
    Object? id = _Undefined,
    int? playbookId,
    int? playbookId,
    Object? playbook = _Undefined,
    int? incidentId,
    int? incidentId,
    Object? incident = _Undefined,
    int? initiatorId,
    int? initiatorId,
    Object? initiator = _Undefined,
    _i5.ExecutionStatus? status,
    DateTime? startedAt,
    Object? completedAt = _Undefined,
    Object? resultSummary = _Undefined,
  }) {
    return PlaybookExecution(
      id: id is int? ? id : this.id,
      playbookId: playbookId ?? this.playbookId,
      playbook: playbook is _i2.Playbook?
          ? playbook
          : this.playbook?.copyWith(),
      incidentId: incidentId ?? this.incidentId,
      incident: incident is _i3.Incident?
          ? incident
          : this.incident?.copyWith(),
      initiatorId: initiatorId ?? this.initiatorId,
      initiator: initiator is _i4.OpsUser?
          ? initiator
          : this.initiator?.copyWith(),
      status: status ?? this.status,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt is DateTime? ? completedAt : this.completedAt,
      resultSummary: resultSummary is String?
          ? resultSummary
          : this.resultSummary,
    );
  }
}
