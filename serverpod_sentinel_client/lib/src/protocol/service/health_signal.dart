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
import '../enums/signal_type.dart' as _i3;
import 'package:serverpod_sentinel_client/src/protocol/protocol.dart' as _i4;

/// Defines a specific metric or health check for a service.
abstract class HealthSignal implements _i1.SerializableModel {
  HealthSignal._({
    this.id,
    required this.serviceId,
    required this.serviceId,
    this.service,
    required this.name,
    required this.identifier,
    required this.type,
    this.lastCheckedAt,
    required this.isHealthy,
    this.currentValue,
    this.unit,
    this.endpoint,
    this.metadata,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HealthSignal({
    int? id,
    required int serviceId,
    required int serviceId,
    _i2.Service? service,
    required String name,
    required String identifier,
    required _i3.SignalType type,
    DateTime? lastCheckedAt,
    required bool isHealthy,
    double? currentValue,
    String? unit,
    String? endpoint,
    String? metadata,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _HealthSignalImpl;

  factory HealthSignal.fromJson(Map<String, dynamic> jsonSerialization) {
    return HealthSignal(
      id: jsonSerialization['id'] as int?,
      serviceId: jsonSerialization['serviceId'] as int,
      service: jsonSerialization['service'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.Service>(
              jsonSerialization['service'],
            ),
      name: jsonSerialization['name'] as String,
      identifier: jsonSerialization['identifier'] as String,
      type: _i3.SignalType.fromJson((jsonSerialization['type'] as String)),
      lastCheckedAt: jsonSerialization['lastCheckedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastCheckedAt'],
            ),
      isHealthy: jsonSerialization['isHealthy'] as bool,
      currentValue: (jsonSerialization['currentValue'] as num?)?.toDouble(),
      unit: jsonSerialization['unit'] as String?,
      endpoint: jsonSerialization['endpoint'] as String?,
      metadata: jsonSerialization['metadata'] as String?,
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

  String name;

  String identifier;

  _i3.SignalType type;

  DateTime? lastCheckedAt;

  bool isHealthy;

  double? currentValue;

  String? unit;

  String? endpoint;

  String? metadata;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [HealthSignal]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  HealthSignal copyWith({
    int? id,
    int? serviceId,
    int? serviceId,
    _i2.Service? service,
    String? name,
    String? identifier,
    _i3.SignalType? type,
    DateTime? lastCheckedAt,
    bool? isHealthy,
    double? currentValue,
    String? unit,
    String? endpoint,
    String? metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'HealthSignal',
      if (id != null) 'id': id,
      'serviceId': serviceId,
      'serviceId': serviceId,
      if (service != null) 'service': service?.toJson(),
      'name': name,
      'identifier': identifier,
      'type': type.toJson(),
      if (lastCheckedAt != null) 'lastCheckedAt': lastCheckedAt?.toJson(),
      'isHealthy': isHealthy,
      if (currentValue != null) 'currentValue': currentValue,
      if (unit != null) 'unit': unit,
      if (endpoint != null) 'endpoint': endpoint,
      if (metadata != null) 'metadata': metadata,
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

class _HealthSignalImpl extends HealthSignal {
  _HealthSignalImpl({
    int? id,
    required int serviceId,
    required int serviceId,
    _i2.Service? service,
    required String name,
    required String identifier,
    required _i3.SignalType type,
    DateTime? lastCheckedAt,
    required bool isHealthy,
    double? currentValue,
    String? unit,
    String? endpoint,
    String? metadata,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         serviceId: serviceId,
         service: service,
         name: name,
         identifier: identifier,
         type: type,
         lastCheckedAt: lastCheckedAt,
         isHealthy: isHealthy,
         currentValue: currentValue,
         unit: unit,
         endpoint: endpoint,
         metadata: metadata,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [HealthSignal]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  HealthSignal copyWith({
    Object? id = _Undefined,
    int? serviceId,
    int? serviceId,
    Object? service = _Undefined,
    String? name,
    String? identifier,
    _i3.SignalType? type,
    Object? lastCheckedAt = _Undefined,
    bool? isHealthy,
    Object? currentValue = _Undefined,
    Object? unit = _Undefined,
    Object? endpoint = _Undefined,
    Object? metadata = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return HealthSignal(
      id: id is int? ? id : this.id,
      serviceId: serviceId ?? this.serviceId,
      service: service is _i2.Service? ? service : this.service?.copyWith(),
      name: name ?? this.name,
      identifier: identifier ?? this.identifier,
      type: type ?? this.type,
      lastCheckedAt: lastCheckedAt is DateTime?
          ? lastCheckedAt
          : this.lastCheckedAt,
      isHealthy: isHealthy ?? this.isHealthy,
      currentValue: currentValue is double? ? currentValue : this.currentValue,
      unit: unit is String? ? unit : this.unit,
      endpoint: endpoint is String? ? endpoint : this.endpoint,
      metadata: metadata is String? ? metadata : this.metadata,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
