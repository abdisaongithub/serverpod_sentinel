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
import '../security/user_role.dart' as _i2;
import 'package:serverpod_sentinel_client/src/protocol/protocol.dart' as _i3;

/// A collection of permissions assignable to users.
abstract class Role implements _i1.SerializableModel {
  Role._({
    this.id,
    required this.name,
    this.description,
    required this.permissions,
    this.users,
  });

  factory Role({
    int? id,
    required String name,
    String? description,
    required List<String> permissions,
    List<_i2.UserRole>? users,
  }) = _RoleImpl;

  factory Role.fromJson(Map<String, dynamic> jsonSerialization) {
    return Role(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      permissions: _i3.Protocol().deserialize<List<String>>(
        jsonSerialization['permissions'],
      ),
      users: jsonSerialization['users'] == null
          ? null
          : _i3.Protocol().deserialize<List<_i2.UserRole>>(
              jsonSerialization['users'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String? description;

  List<String> permissions;

  List<_i2.UserRole>? users;

  /// Returns a shallow copy of this [Role]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Role copyWith({
    int? id,
    String? name,
    String? description,
    List<String>? permissions,
    List<_i2.UserRole>? users,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Role',
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'permissions': permissions.toJson(),
      if (users != null) 'users': users?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RoleImpl extends Role {
  _RoleImpl({
    int? id,
    required String name,
    String? description,
    required List<String> permissions,
    List<_i2.UserRole>? users,
  }) : super._(
         id: id,
         name: name,
         description: description,
         permissions: permissions,
         users: users,
       );

  /// Returns a shallow copy of this [Role]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Role copyWith({
    Object? id = _Undefined,
    String? name,
    Object? description = _Undefined,
    List<String>? permissions,
    Object? users = _Undefined,
  }) {
    return Role(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      permissions: permissions ?? this.permissions.map((e0) => e0).toList(),
      users: users is List<_i2.UserRole>?
          ? users
          : this.users?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
