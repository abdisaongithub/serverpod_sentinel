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
import '../security/ops_user.dart' as _i2;
import '../enums/service_status.dart' as _i3;
import '../enums/service_tier.dart' as _i4;
import '../service/health_signal.dart' as _i5;
import '../service/rule.dart' as _i6;
import '../incident/incident.dart' as _i7;
import 'package:serverpod_sentinel_client/src/protocol/protocol.dart' as _i8;

/// Represents a logical monitoring target (e.g., API, Database, Worker).
abstract class Service implements _i1.SerializableModel {
  Service._({
    this.id,
    required this.name,
    this.description,
    required this.ownerId,
    required this.ownerId,
    this.owner,
    required this.status,
    required this.tier,
    required this.tags,
    this.signals,
    this.rules,
    this.incidents,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Service({
    int? id,
    required String name,
    String? description,
    required int ownerId,
    required int ownerId,
    _i2.OpsUser? owner,
    required _i3.ServiceStatus status,
    required _i4.ServiceTier tier,
    required List<String> tags,
    List<_i5.HealthSignal>? signals,
    List<_i6.Rule>? rules,
    List<_i7.Incident>? incidents,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ServiceImpl;

  factory Service.fromJson(Map<String, dynamic> jsonSerialization) {
    return Service(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i8.Protocol().deserialize<_i2.OpsUser>(jsonSerialization['owner']),
      status: _i3.ServiceStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      tier: _i4.ServiceTier.fromJson((jsonSerialization['tier'] as String)),
      tags: _i8.Protocol().deserialize<List<String>>(jsonSerialization['tags']),
      signals: jsonSerialization['signals'] == null
          ? null
          : _i8.Protocol().deserialize<List<_i5.HealthSignal>>(
              jsonSerialization['signals'],
            ),
      rules: jsonSerialization['rules'] == null
          ? null
          : _i8.Protocol().deserialize<List<_i6.Rule>>(
              jsonSerialization['rules'],
            ),
      incidents: jsonSerialization['incidents'] == null
          ? null
          : _i8.Protocol().deserialize<List<_i7.Incident>>(
              jsonSerialization['incidents'],
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

  String name;

  String? description;

  int ownerId;

  int ownerId;

  _i2.OpsUser? owner;

  _i3.ServiceStatus status;

  _i4.ServiceTier tier;

  List<String> tags;

  List<_i5.HealthSignal>? signals;

  List<_i6.Rule>? rules;

  List<_i7.Incident>? incidents;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [Service]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Service copyWith({
    int? id,
    String? name,
    String? description,
    int? ownerId,
    int? ownerId,
    _i2.OpsUser? owner,
    _i3.ServiceStatus? status,
    _i4.ServiceTier? tier,
    List<String>? tags,
    List<_i5.HealthSignal>? signals,
    List<_i6.Rule>? rules,
    List<_i7.Incident>? incidents,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Service',
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'ownerId': ownerId,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'status': status.toJson(),
      'tier': tier.toJson(),
      'tags': tags.toJson(),
      if (signals != null)
        'signals': signals?.toJson(valueToJson: (v) => v.toJson()),
      if (rules != null) 'rules': rules?.toJson(valueToJson: (v) => v.toJson()),
      if (incidents != null)
        'incidents': incidents?.toJson(valueToJson: (v) => v.toJson()),
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

class _ServiceImpl extends Service {
  _ServiceImpl({
    int? id,
    required String name,
    String? description,
    required int ownerId,
    required int ownerId,
    _i2.OpsUser? owner,
    required _i3.ServiceStatus status,
    required _i4.ServiceTier tier,
    required List<String> tags,
    List<_i5.HealthSignal>? signals,
    List<_i6.Rule>? rules,
    List<_i7.Incident>? incidents,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         name: name,
         description: description,
         ownerId: ownerId,
         owner: owner,
         status: status,
         tier: tier,
         tags: tags,
         signals: signals,
         rules: rules,
         incidents: incidents,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Service]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Service copyWith({
    Object? id = _Undefined,
    String? name,
    Object? description = _Undefined,
    int? ownerId,
    int? ownerId,
    Object? owner = _Undefined,
    _i3.ServiceStatus? status,
    _i4.ServiceTier? tier,
    List<String>? tags,
    Object? signals = _Undefined,
    Object? rules = _Undefined,
    Object? incidents = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Service(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.OpsUser? ? owner : this.owner?.copyWith(),
      status: status ?? this.status,
      tier: tier ?? this.tier,
      tags: tags ?? this.tags.map((e0) => e0).toList(),
      signals: signals is List<_i5.HealthSignal>?
          ? signals
          : this.signals?.map((e0) => e0.copyWith()).toList(),
      rules: rules is List<_i6.Rule>?
          ? rules
          : this.rules?.map((e0) => e0.copyWith()).toList(),
      incidents: incidents is List<_i7.Incident>?
          ? incidents
          : this.incidents?.map((e0) => e0.copyWith()).toList(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
