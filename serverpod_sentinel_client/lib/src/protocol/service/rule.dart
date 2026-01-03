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
import '../service/health_signal.dart' as _i3;
import '../enums/incident_severity.dart' as _i4;
import 'package:serverpod_sentinel_client/src/protocol/protocol.dart' as _i5;

/// Logic definition for triggering incidents based on signal values.
abstract class Rule implements _i1.SerializableModel {
  Rule._({
    this.id,
    required this.serviceId,
    required this.serviceId,
    this.service,
    required this.signalId,
    required this.signalId,
    this.signal,
    required this.name,
    required this.condition,
    required this.durationSeconds,
    required this.severity,
    required this.enabled,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Rule({
    int? id,
    required int serviceId,
    required int serviceId,
    _i2.Service? service,
    required int signalId,
    required int signalId,
    _i3.HealthSignal? signal,
    required String name,
    required String condition,
    required int durationSeconds,
    required _i4.IncidentSeverity severity,
    required bool enabled,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _RuleImpl;

  factory Rule.fromJson(Map<String, dynamic> jsonSerialization) {
    return Rule(
      id: jsonSerialization['id'] as int?,
      serviceId: jsonSerialization['serviceId'] as int,
      service: jsonSerialization['service'] == null
          ? null
          : _i5.Protocol().deserialize<_i2.Service>(
              jsonSerialization['service'],
            ),
      signalId: jsonSerialization['signalId'] as int,
      signal: jsonSerialization['signal'] == null
          ? null
          : _i5.Protocol().deserialize<_i3.HealthSignal>(
              jsonSerialization['signal'],
            ),
      name: jsonSerialization['name'] as String,
      condition: jsonSerialization['condition'] as String,
      durationSeconds: jsonSerialization['durationSeconds'] as int,
      severity: _i4.IncidentSeverity.fromJson(
        (jsonSerialization['severity'] as String),
      ),
      enabled: jsonSerialization['enabled'] as bool,
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

  int serviceId;

  int serviceId;

  _i2.Service? service;

  int signalId;

  int signalId;

  _i3.HealthSignal? signal;

  String name;

  String condition;

  int durationSeconds;

  _i4.IncidentSeverity severity;

  bool enabled;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [Rule]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Rule copyWith({
    int? id,
    int? serviceId,
    int? serviceId,
    _i2.Service? service,
    int? signalId,
    int? signalId,
    _i3.HealthSignal? signal,
    String? name,
    String? condition,
    int? durationSeconds,
    _i4.IncidentSeverity? severity,
    bool? enabled,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Rule',
      if (id != null) 'id': id,
      'serviceId': serviceId,
      'serviceId': serviceId,
      if (service != null) 'service': service?.toJson(),
      'signalId': signalId,
      'signalId': signalId,
      if (signal != null) 'signal': signal?.toJson(),
      'name': name,
      'condition': condition,
      'durationSeconds': durationSeconds,
      'severity': severity.toJson(),
      'enabled': enabled,
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

class _RuleImpl extends Rule {
  _RuleImpl({
    int? id,
    required int serviceId,
    required int serviceId,
    _i2.Service? service,
    required int signalId,
    required int signalId,
    _i3.HealthSignal? signal,
    required String name,
    required String condition,
    required int durationSeconds,
    required _i4.IncidentSeverity severity,
    required bool enabled,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         serviceId: serviceId,
         service: service,
         signalId: signalId,
         signal: signal,
         name: name,
         condition: condition,
         durationSeconds: durationSeconds,
         severity: severity,
         enabled: enabled,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Rule]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Rule copyWith({
    Object? id = _Undefined,
    int? serviceId,
    int? serviceId,
    Object? service = _Undefined,
    int? signalId,
    int? signalId,
    Object? signal = _Undefined,
    String? name,
    String? condition,
    int? durationSeconds,
    _i4.IncidentSeverity? severity,
    bool? enabled,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Rule(
      id: id is int? ? id : this.id,
      serviceId: serviceId ?? this.serviceId,
      service: service is _i2.Service? ? service : this.service?.copyWith(),
      signalId: signalId ?? this.signalId,
      signal: signal is _i3.HealthSignal? ? signal : this.signal?.copyWith(),
      name: name ?? this.name,
      condition: condition ?? this.condition,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      severity: severity ?? this.severity,
      enabled: enabled ?? this.enabled,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
