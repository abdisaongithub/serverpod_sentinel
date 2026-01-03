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
import 'package:serverpod_sentinel_client/src/protocol/protocol.dart' as _i3;

/// API credentials for Services (Agents).
abstract class ServiceToken implements _i1.SerializableModel {
  ServiceToken._({
    this.id,
    required this.name,
    required this.token,
    required this.serviceId,
    required this.serviceId,
    this.service,
    this.lastUsedAt,
    this.expiresAt,
    required this.createdAt,
  });

  factory ServiceToken({
    int? id,
    required String name,
    required String token,
    required int serviceId,
    required int serviceId,
    _i2.Service? service,
    DateTime? lastUsedAt,
    DateTime? expiresAt,
    required DateTime createdAt,
  }) = _ServiceTokenImpl;

  factory ServiceToken.fromJson(Map<String, dynamic> jsonSerialization) {
    return ServiceToken(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      token: jsonSerialization['token'] as String,
      serviceId: jsonSerialization['serviceId'] as int,
      service: jsonSerialization['service'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.Service>(
              jsonSerialization['service'],
            ),
      lastUsedAt: jsonSerialization['lastUsedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['lastUsedAt']),
      expiresAt: jsonSerialization['expiresAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expiresAt']),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String token;

  int serviceId;

  int serviceId;

  _i2.Service? service;

  DateTime? lastUsedAt;

  DateTime? expiresAt;

  DateTime createdAt;

  /// Returns a shallow copy of this [ServiceToken]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ServiceToken copyWith({
    int? id,
    String? name,
    String? token,
    int? serviceId,
    int? serviceId,
    _i2.Service? service,
    DateTime? lastUsedAt,
    DateTime? expiresAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ServiceToken',
      if (id != null) 'id': id,
      'name': name,
      'token': token,
      'serviceId': serviceId,
      'serviceId': serviceId,
      if (service != null) 'service': service?.toJson(),
      if (lastUsedAt != null) 'lastUsedAt': lastUsedAt?.toJson(),
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ServiceTokenImpl extends ServiceToken {
  _ServiceTokenImpl({
    int? id,
    required String name,
    required String token,
    required int serviceId,
    required int serviceId,
    _i2.Service? service,
    DateTime? lastUsedAt,
    DateTime? expiresAt,
    required DateTime createdAt,
  }) : super._(
         id: id,
         name: name,
         token: token,
         serviceId: serviceId,
         service: service,
         lastUsedAt: lastUsedAt,
         expiresAt: expiresAt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [ServiceToken]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ServiceToken copyWith({
    Object? id = _Undefined,
    String? name,
    String? token,
    int? serviceId,
    int? serviceId,
    Object? service = _Undefined,
    Object? lastUsedAt = _Undefined,
    Object? expiresAt = _Undefined,
    DateTime? createdAt,
  }) {
    return ServiceToken(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      token: token ?? this.token,
      serviceId: serviceId ?? this.serviceId,
      service: service is _i2.Service? ? service : this.service?.copyWith(),
      lastUsedAt: lastUsedAt is DateTime? ? lastUsedAt : this.lastUsedAt,
      expiresAt: expiresAt is DateTime? ? expiresAt : this.expiresAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
