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
import '../automation/playbook_execution.dart' as _i2;
import '../enums/execution_status.dart' as _i3;
import 'package:serverpod_sentinel_client/src/protocol/protocol.dart' as _i4;

/// Tracks the execution status of a single step within a PlaybookExecution.
abstract class PlaybookStepExecution implements _i1.SerializableModel {
  PlaybookStepExecution._({
    this.id,
    required this.executionId,
    required this.executionId,
    this.execution,
    required this.stepId,
    required this.status,
    required this.startedAt,
    this.completedAt,
    this.logs,
    this.output,
  });

  factory PlaybookStepExecution({
    int? id,
    required int executionId,
    required int executionId,
    _i2.PlaybookExecution? execution,
    required String stepId,
    required _i3.ExecutionStatus status,
    required DateTime startedAt,
    DateTime? completedAt,
    String? logs,
    String? output,
  }) = _PlaybookStepExecutionImpl;

  factory PlaybookStepExecution.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return PlaybookStepExecution(
      id: jsonSerialization['id'] as int?,
      executionId: jsonSerialization['executionId'] as int,
      execution: jsonSerialization['execution'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.PlaybookExecution>(
              jsonSerialization['execution'],
            ),
      stepId: jsonSerialization['stepId'] as String,
      status: _i3.ExecutionStatus.fromJson(
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
      logs: jsonSerialization['logs'] as String?,
      output: jsonSerialization['output'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int executionId;

  int executionId;

  _i2.PlaybookExecution? execution;

  String stepId;

  _i3.ExecutionStatus status;

  DateTime startedAt;

  DateTime? completedAt;

  String? logs;

  String? output;

  /// Returns a shallow copy of this [PlaybookStepExecution]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PlaybookStepExecution copyWith({
    int? id,
    int? executionId,
    int? executionId,
    _i2.PlaybookExecution? execution,
    String? stepId,
    _i3.ExecutionStatus? status,
    DateTime? startedAt,
    DateTime? completedAt,
    String? logs,
    String? output,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PlaybookStepExecution',
      if (id != null) 'id': id,
      'executionId': executionId,
      'executionId': executionId,
      if (execution != null) 'execution': execution?.toJson(),
      'stepId': stepId,
      'status': status.toJson(),
      'startedAt': startedAt.toJson(),
      if (completedAt != null) 'completedAt': completedAt?.toJson(),
      if (logs != null) 'logs': logs,
      if (output != null) 'output': output,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PlaybookStepExecutionImpl extends PlaybookStepExecution {
  _PlaybookStepExecutionImpl({
    int? id,
    required int executionId,
    required int executionId,
    _i2.PlaybookExecution? execution,
    required String stepId,
    required _i3.ExecutionStatus status,
    required DateTime startedAt,
    DateTime? completedAt,
    String? logs,
    String? output,
  }) : super._(
         id: id,
         executionId: executionId,
         execution: execution,
         stepId: stepId,
         status: status,
         startedAt: startedAt,
         completedAt: completedAt,
         logs: logs,
         output: output,
       );

  /// Returns a shallow copy of this [PlaybookStepExecution]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PlaybookStepExecution copyWith({
    Object? id = _Undefined,
    int? executionId,
    int? executionId,
    Object? execution = _Undefined,
    String? stepId,
    _i3.ExecutionStatus? status,
    DateTime? startedAt,
    Object? completedAt = _Undefined,
    Object? logs = _Undefined,
    Object? output = _Undefined,
  }) {
    return PlaybookStepExecution(
      id: id is int? ? id : this.id,
      executionId: executionId ?? this.executionId,
      execution: execution is _i2.PlaybookExecution?
          ? execution
          : this.execution?.copyWith(),
      stepId: stepId ?? this.stepId,
      status: status ?? this.status,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt is DateTime? ? completedAt : this.completedAt,
      logs: logs is String? ? logs : this.logs,
      output: output is String? ? output : this.output,
    );
  }
}
