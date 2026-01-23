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
import '../agent/agent_task_status.dart' as _i2;
import 'package:serverpod_sentinel_client/src/protocol/protocol.dart' as _i3;

/// Model for agent-specific monitoring tasks and playbooks.
abstract class AgentTask implements _i1.SerializableModel {
  AgentTask._({
    this.id,
    required this.serviceId,
    required this.command,
    this.arguments,
    required this.timestamp,
    required this.timeoutSeconds,
    required this.status,
    this.output,
    this.exitCode,
  });

  factory AgentTask({
    int? id,
    required int serviceId,
    required String command,
    List<String>? arguments,
    required DateTime timestamp,
    required int timeoutSeconds,
    required _i2.AgentTaskStatus status,
    String? output,
    int? exitCode,
  }) = _AgentTaskImpl;

  factory AgentTask.fromJson(Map<String, dynamic> jsonSerialization) {
    return AgentTask(
      id: jsonSerialization['id'] as int?,
      serviceId: jsonSerialization['serviceId'] as int,
      command: jsonSerialization['command'] as String,
      arguments: jsonSerialization['arguments'] == null
          ? null
          : _i3.Protocol().deserialize<List<String>>(
              jsonSerialization['arguments'],
            ),
      timestamp: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      timeoutSeconds: jsonSerialization['timeoutSeconds'] as int,
      status: _i2.AgentTaskStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      output: jsonSerialization['output'] as String?,
      exitCode: jsonSerialization['exitCode'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int serviceId;

  String command;

  List<String>? arguments;

  DateTime timestamp;

  int timeoutSeconds;

  _i2.AgentTaskStatus status;

  String? output;

  int? exitCode;

  /// Returns a shallow copy of this [AgentTask]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AgentTask copyWith({
    int? id,
    int? serviceId,
    String? command,
    List<String>? arguments,
    DateTime? timestamp,
    int? timeoutSeconds,
    _i2.AgentTaskStatus? status,
    String? output,
    int? exitCode,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AgentTask',
      if (id != null) 'id': id,
      'serviceId': serviceId,
      'command': command,
      if (arguments != null) 'arguments': arguments?.toJson(),
      'timestamp': timestamp.toJson(),
      'timeoutSeconds': timeoutSeconds,
      'status': status.toJson(),
      if (output != null) 'output': output,
      if (exitCode != null) 'exitCode': exitCode,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AgentTaskImpl extends AgentTask {
  _AgentTaskImpl({
    int? id,
    required int serviceId,
    required String command,
    List<String>? arguments,
    required DateTime timestamp,
    required int timeoutSeconds,
    required _i2.AgentTaskStatus status,
    String? output,
    int? exitCode,
  }) : super._(
         id: id,
         serviceId: serviceId,
         command: command,
         arguments: arguments,
         timestamp: timestamp,
         timeoutSeconds: timeoutSeconds,
         status: status,
         output: output,
         exitCode: exitCode,
       );

  /// Returns a shallow copy of this [AgentTask]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AgentTask copyWith({
    Object? id = _Undefined,
    int? serviceId,
    String? command,
    Object? arguments = _Undefined,
    DateTime? timestamp,
    int? timeoutSeconds,
    _i2.AgentTaskStatus? status,
    Object? output = _Undefined,
    Object? exitCode = _Undefined,
  }) {
    return AgentTask(
      id: id is int? ? id : this.id,
      serviceId: serviceId ?? this.serviceId,
      command: command ?? this.command,
      arguments: arguments is List<String>?
          ? arguments
          : this.arguments?.map((e0) => e0).toList(),
      timestamp: timestamp ?? this.timestamp,
      timeoutSeconds: timeoutSeconds ?? this.timeoutSeconds,
      status: status ?? this.status,
      output: output is String? ? output : this.output,
      exitCode: exitCode is int? ? exitCode : this.exitCode,
    );
  }
}
