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

abstract class Environment implements _i1.SerializableModel {
  Environment._({
    this.id,
    required this.name,
    required this.region,
    this.description,
    required this.isActive,
    this.config,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Environment({
    int? id,
    required String name,
    required String region,
    String? description,
    required bool isActive,
    String? config,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _EnvironmentImpl;

  factory Environment.fromJson(Map<String, dynamic> jsonSerialization) {
    return Environment(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      region: jsonSerialization['region'] as String,
      description: jsonSerialization['description'] as String?,
      isActive: jsonSerialization['isActive'] as bool,
      config: jsonSerialization['config'] as String?,
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

  String region;

  String? description;

  bool isActive;

  String? config;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [Environment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Environment copyWith({
    int? id,
    String? name,
    String? region,
    String? description,
    bool? isActive,
    String? config,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Environment',
      if (id != null) 'id': id,
      'name': name,
      'region': region,
      if (description != null) 'description': description,
      'isActive': isActive,
      if (config != null) 'config': config,
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

class _EnvironmentImpl extends Environment {
  _EnvironmentImpl({
    int? id,
    required String name,
    required String region,
    String? description,
    required bool isActive,
    String? config,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         name: name,
         region: region,
         description: description,
         isActive: isActive,
         config: config,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Environment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Environment copyWith({
    Object? id = _Undefined,
    String? name,
    String? region,
    Object? description = _Undefined,
    bool? isActive,
    Object? config = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Environment(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      region: region ?? this.region,
      description: description is String? ? description : this.description,
      isActive: isActive ?? this.isActive,
      config: config is String? ? config : this.config,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
