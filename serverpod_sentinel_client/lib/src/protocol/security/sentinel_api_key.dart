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
import 'package:serverpod_sentinel_client/src/protocol/protocol.dart' as _i2;

/// Scoped API keys for platform-level access.
abstract class SentinelApiKey implements _i1.SerializableModel {
  SentinelApiKey._({
    this.id,
    required this.name,
    required this.key,
    required this.keyHash,
    required this.scopes,
    this.userId,
    this.lastUsedAt,
    this.expiresAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SentinelApiKey({
    int? id,
    required String name,
    required String key,
    required String keyHash,
    required List<String> scopes,
    int? userId,
    DateTime? lastUsedAt,
    DateTime? expiresAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SentinelApiKeyImpl;

  factory SentinelApiKey.fromJson(Map<String, dynamic> jsonSerialization) {
    return SentinelApiKey(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      key: jsonSerialization['key'] as String,
      keyHash: jsonSerialization['keyHash'] as String,
      scopes: _i2.Protocol().deserialize<List<String>>(
        jsonSerialization['scopes'],
      ),
      userId: jsonSerialization['userId'] as int?,
      lastUsedAt: jsonSerialization['lastUsedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['lastUsedAt']),
      expiresAt: jsonSerialization['expiresAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expiresAt']),
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

  String key;

  String keyHash;

  List<String> scopes;

  int? userId;

  DateTime? lastUsedAt;

  DateTime? expiresAt;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [SentinelApiKey]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SentinelApiKey copyWith({
    int? id,
    String? name,
    String? key,
    String? keyHash,
    List<String>? scopes,
    int? userId,
    DateTime? lastUsedAt,
    DateTime? expiresAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SentinelApiKey',
      if (id != null) 'id': id,
      'name': name,
      'key': key,
      'keyHash': keyHash,
      'scopes': scopes.toJson(),
      if (userId != null) 'userId': userId,
      if (lastUsedAt != null) 'lastUsedAt': lastUsedAt?.toJson(),
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
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

class _SentinelApiKeyImpl extends SentinelApiKey {
  _SentinelApiKeyImpl({
    int? id,
    required String name,
    required String key,
    required String keyHash,
    required List<String> scopes,
    int? userId,
    DateTime? lastUsedAt,
    DateTime? expiresAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         name: name,
         key: key,
         keyHash: keyHash,
         scopes: scopes,
         userId: userId,
         lastUsedAt: lastUsedAt,
         expiresAt: expiresAt,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [SentinelApiKey]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SentinelApiKey copyWith({
    Object? id = _Undefined,
    String? name,
    String? key,
    String? keyHash,
    List<String>? scopes,
    Object? userId = _Undefined,
    Object? lastUsedAt = _Undefined,
    Object? expiresAt = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SentinelApiKey(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      key: key ?? this.key,
      keyHash: keyHash ?? this.keyHash,
      scopes: scopes ?? this.scopes.map((e0) => e0).toList(),
      userId: userId is int? ? userId : this.userId,
      lastUsedAt: lastUsedAt is DateTime? ? lastUsedAt : this.lastUsedAt,
      expiresAt: expiresAt is DateTime? ? expiresAt : this.expiresAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
