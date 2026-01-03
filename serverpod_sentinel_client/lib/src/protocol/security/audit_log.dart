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
import 'package:serverpod_sentinel_client/src/protocol/protocol.dart' as _i3;

/// Immutable record of system-level changes.
abstract class AuditLog implements _i1.SerializableModel {
  AuditLog._({
    this.id,
    required this.actorId,
    required this.actorId,
    this.actor,
    required this.action,
    required this.entityType,
    required this.entityId,
    this.changes,
    this.ipAddress,
    required this.createdAt,
  });

  factory AuditLog({
    int? id,
    required int actorId,
    required int actorId,
    _i2.OpsUser? actor,
    required String action,
    required String entityType,
    required int entityId,
    String? changes,
    String? ipAddress,
    required DateTime createdAt,
  }) = _AuditLogImpl;

  factory AuditLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return AuditLog(
      id: jsonSerialization['id'] as int?,
      actorId: jsonSerialization['actorId'] as int,
      actor: jsonSerialization['actor'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.OpsUser>(jsonSerialization['actor']),
      action: jsonSerialization['action'] as String,
      entityType: jsonSerialization['entityType'] as String,
      entityId: jsonSerialization['entityId'] as int,
      changes: jsonSerialization['changes'] as String?,
      ipAddress: jsonSerialization['ipAddress'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int actorId;

  int actorId;

  _i2.OpsUser? actor;

  String action;

  String entityType;

  int entityId;

  String? changes;

  String? ipAddress;

  DateTime createdAt;

  /// Returns a shallow copy of this [AuditLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AuditLog copyWith({
    int? id,
    int? actorId,
    int? actorId,
    _i2.OpsUser? actor,
    String? action,
    String? entityType,
    int? entityId,
    String? changes,
    String? ipAddress,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AuditLog',
      if (id != null) 'id': id,
      'actorId': actorId,
      'actorId': actorId,
      if (actor != null) 'actor': actor?.toJson(),
      'action': action,
      'entityType': entityType,
      'entityId': entityId,
      if (changes != null) 'changes': changes,
      if (ipAddress != null) 'ipAddress': ipAddress,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AuditLogImpl extends AuditLog {
  _AuditLogImpl({
    int? id,
    required int actorId,
    required int actorId,
    _i2.OpsUser? actor,
    required String action,
    required String entityType,
    required int entityId,
    String? changes,
    String? ipAddress,
    required DateTime createdAt,
  }) : super._(
         id: id,
         actorId: actorId,
         actor: actor,
         action: action,
         entityType: entityType,
         entityId: entityId,
         changes: changes,
         ipAddress: ipAddress,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [AuditLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AuditLog copyWith({
    Object? id = _Undefined,
    int? actorId,
    int? actorId,
    Object? actor = _Undefined,
    String? action,
    String? entityType,
    int? entityId,
    Object? changes = _Undefined,
    Object? ipAddress = _Undefined,
    DateTime? createdAt,
  }) {
    return AuditLog(
      id: id is int? ? id : this.id,
      actorId: actorId ?? this.actorId,
      actor: actor is _i2.OpsUser? ? actor : this.actor?.copyWith(),
      action: action ?? this.action,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      changes: changes is String? ? changes : this.changes,
      ipAddress: ipAddress is String? ? ipAddress : this.ipAddress,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
