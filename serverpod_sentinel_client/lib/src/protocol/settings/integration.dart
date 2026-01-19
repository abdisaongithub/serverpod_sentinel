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

abstract class Integration implements _i1.SerializableModel {
  Integration._({
    this.id,
    required this.name,
    required this.type,
    required this.provider,
    this.config,
    required this.isEnabled,
    this.lastSyncAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Integration({
    int? id,
    required String name,
    required String type,
    required String provider,
    String? config,
    required bool isEnabled,
    DateTime? lastSyncAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _IntegrationImpl;

  factory Integration.fromJson(Map<String, dynamic> jsonSerialization) {
    return Integration(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      type: jsonSerialization['type'] as String,
      provider: jsonSerialization['provider'] as String,
      config: jsonSerialization['config'] as String?,
      isEnabled: jsonSerialization['isEnabled'] as bool,
      lastSyncAt: jsonSerialization['lastSyncAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['lastSyncAt']),
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

  String type;

  String provider;

  String? config;

  bool isEnabled;

  DateTime? lastSyncAt;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [Integration]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Integration copyWith({
    int? id,
    String? name,
    String? type,
    String? provider,
    String? config,
    bool? isEnabled,
    DateTime? lastSyncAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Integration',
      if (id != null) 'id': id,
      'name': name,
      'type': type,
      'provider': provider,
      if (config != null) 'config': config,
      'isEnabled': isEnabled,
      if (lastSyncAt != null) 'lastSyncAt': lastSyncAt?.toJson(),
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

class _IntegrationImpl extends Integration {
  _IntegrationImpl({
    int? id,
    required String name,
    required String type,
    required String provider,
    String? config,
    required bool isEnabled,
    DateTime? lastSyncAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         name: name,
         type: type,
         provider: provider,
         config: config,
         isEnabled: isEnabled,
         lastSyncAt: lastSyncAt,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Integration]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Integration copyWith({
    Object? id = _Undefined,
    String? name,
    String? type,
    String? provider,
    Object? config = _Undefined,
    bool? isEnabled,
    Object? lastSyncAt = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Integration(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      provider: provider ?? this.provider,
      config: config is String? ? config : this.config,
      isEnabled: isEnabled ?? this.isEnabled,
      lastSyncAt: lastSyncAt is DateTime? ? lastSyncAt : this.lastSyncAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
