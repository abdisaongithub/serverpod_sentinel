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
import '../enums/service_status.dart' as _i2;
import '../telemetry/telemetry_resources.dart' as _i3;
import 'package:serverpod_sentinel_client/src/protocol/protocol.dart' as _i4;

/// Payload for agent heartbeat.
abstract class TelemetryHeartbeat implements _i1.SerializableModel {
  TelemetryHeartbeat._({
    this.id,
    required this.timestamp,
    required this.uptimeSeconds,
    required this.version,
    required this.status,
    this.resources,
  });

  factory TelemetryHeartbeat({
    int? id,
    required DateTime timestamp,
    required int uptimeSeconds,
    required String version,
    required _i2.ServiceStatus status,
    _i3.TelemetryResources? resources,
  }) = _TelemetryHeartbeatImpl;

  factory TelemetryHeartbeat.fromJson(Map<String, dynamic> jsonSerialization) {
    return TelemetryHeartbeat(
      id: jsonSerialization['id'] as int?,
      timestamp: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      uptimeSeconds: jsonSerialization['uptimeSeconds'] as int,
      version: jsonSerialization['version'] as String,
      status: _i2.ServiceStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      resources: jsonSerialization['resources'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.TelemetryResources>(
              jsonSerialization['resources'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  DateTime timestamp;

  int uptimeSeconds;

  String version;

  _i2.ServiceStatus status;

  _i3.TelemetryResources? resources;

  /// Returns a shallow copy of this [TelemetryHeartbeat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TelemetryHeartbeat copyWith({
    int? id,
    DateTime? timestamp,
    int? uptimeSeconds,
    String? version,
    _i2.ServiceStatus? status,
    _i3.TelemetryResources? resources,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TelemetryHeartbeat',
      if (id != null) 'id': id,
      'timestamp': timestamp.toJson(),
      'uptimeSeconds': uptimeSeconds,
      'version': version,
      'status': status.toJson(),
      if (resources != null) 'resources': resources?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TelemetryHeartbeatImpl extends TelemetryHeartbeat {
  _TelemetryHeartbeatImpl({
    int? id,
    required DateTime timestamp,
    required int uptimeSeconds,
    required String version,
    required _i2.ServiceStatus status,
    _i3.TelemetryResources? resources,
  }) : super._(
         id: id,
         timestamp: timestamp,
         uptimeSeconds: uptimeSeconds,
         version: version,
         status: status,
         resources: resources,
       );

  /// Returns a shallow copy of this [TelemetryHeartbeat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TelemetryHeartbeat copyWith({
    Object? id = _Undefined,
    DateTime? timestamp,
    int? uptimeSeconds,
    String? version,
    _i2.ServiceStatus? status,
    Object? resources = _Undefined,
  }) {
    return TelemetryHeartbeat(
      id: id is int? ? id : this.id,
      timestamp: timestamp ?? this.timestamp,
      uptimeSeconds: uptimeSeconds ?? this.uptimeSeconds,
      version: version ?? this.version,
      status: status ?? this.status,
      resources: resources is _i3.TelemetryResources?
          ? resources
          : this.resources?.copyWith(),
    );
  }
}
