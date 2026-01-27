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

/// Scheduled Chaos Engineering experiments.
abstract class ChaosExperiment implements _i1.SerializableModel {
  ChaosExperiment._({
    this.id,
    required this.name,
    this.description,
    required this.serviceId,
    required this.type,
    required this.config,
    required this.status,
    this.scheduledAt,
    this.startedAt,
    this.finishedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ChaosExperiment({
    int? id,
    required String name,
    String? description,
    required int serviceId,
    required String type,
    required String config,
    required String status,
    DateTime? scheduledAt,
    DateTime? startedAt,
    DateTime? finishedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ChaosExperimentImpl;

  factory ChaosExperiment.fromJson(Map<String, dynamic> jsonSerialization) {
    return ChaosExperiment(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      serviceId: jsonSerialization['serviceId'] as int,
      type: jsonSerialization['type'] as String,
      config: jsonSerialization['config'] as String,
      status: jsonSerialization['status'] as String,
      scheduledAt: jsonSerialization['scheduledAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['scheduledAt'],
            ),
      startedAt: jsonSerialization['startedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['startedAt']),
      finishedAt: jsonSerialization['finishedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['finishedAt']),
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

  String name;

  String? description;

  int serviceId;

  String type;

  String config;

  String status;

  DateTime? scheduledAt;

  DateTime? startedAt;

  DateTime? finishedAt;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [ChaosExperiment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ChaosExperiment copyWith({
    int? id,
    String? name,
    String? description,
    int? serviceId,
    String? type,
    String? config,
    String? status,
    DateTime? scheduledAt,
    DateTime? startedAt,
    DateTime? finishedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ChaosExperiment',
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'serviceId': serviceId,
      'type': type,
      'config': config,
      'status': status,
      if (scheduledAt != null) 'scheduledAt': scheduledAt?.toJson(),
      if (startedAt != null) 'startedAt': startedAt?.toJson(),
      if (finishedAt != null) 'finishedAt': finishedAt?.toJson(),
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

class _ChaosExperimentImpl extends ChaosExperiment {
  _ChaosExperimentImpl({
    int? id,
    required String name,
    String? description,
    required int serviceId,
    required String type,
    required String config,
    required String status,
    DateTime? scheduledAt,
    DateTime? startedAt,
    DateTime? finishedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         name: name,
         description: description,
         serviceId: serviceId,
         type: type,
         config: config,
         status: status,
         scheduledAt: scheduledAt,
         startedAt: startedAt,
         finishedAt: finishedAt,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [ChaosExperiment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ChaosExperiment copyWith({
    Object? id = _Undefined,
    String? name,
    Object? description = _Undefined,
    int? serviceId,
    String? type,
    String? config,
    String? status,
    Object? scheduledAt = _Undefined,
    Object? startedAt = _Undefined,
    Object? finishedAt = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ChaosExperiment(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      serviceId: serviceId ?? this.serviceId,
      type: type ?? this.type,
      config: config ?? this.config,
      status: status ?? this.status,
      scheduledAt: scheduledAt is DateTime? ? scheduledAt : this.scheduledAt,
      startedAt: startedAt is DateTime? ? startedAt : this.startedAt,
      finishedAt: finishedAt is DateTime? ? finishedAt : this.finishedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
