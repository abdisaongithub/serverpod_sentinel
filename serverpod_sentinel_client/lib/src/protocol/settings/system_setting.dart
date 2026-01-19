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

abstract class SystemSetting implements _i1.SerializableModel {
  SystemSetting._({
    this.id,
    required this.key,
    required this.value,
    this.description,
    required this.category,
    required this.isSecret,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SystemSetting({
    int? id,
    required String key,
    required String value,
    String? description,
    required String category,
    required bool isSecret,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SystemSettingImpl;

  factory SystemSetting.fromJson(Map<String, dynamic> jsonSerialization) {
    return SystemSetting(
      id: jsonSerialization['id'] as int?,
      key: jsonSerialization['key'] as String,
      value: jsonSerialization['value'] as String,
      description: jsonSerialization['description'] as String?,
      category: jsonSerialization['category'] as String,
      isSecret: jsonSerialization['isSecret'] as bool,
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

  String key;

  String value;

  String? description;

  String category;

  bool isSecret;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [SystemSetting]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SystemSetting copyWith({
    int? id,
    String? key,
    String? value,
    String? description,
    String? category,
    bool? isSecret,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SystemSetting',
      if (id != null) 'id': id,
      'key': key,
      'value': value,
      if (description != null) 'description': description,
      'category': category,
      'isSecret': isSecret,
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

class _SystemSettingImpl extends SystemSetting {
  _SystemSettingImpl({
    int? id,
    required String key,
    required String value,
    String? description,
    required String category,
    required bool isSecret,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         key: key,
         value: value,
         description: description,
         category: category,
         isSecret: isSecret,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [SystemSetting]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SystemSetting copyWith({
    Object? id = _Undefined,
    String? key,
    String? value,
    Object? description = _Undefined,
    String? category,
    bool? isSecret,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SystemSetting(
      id: id is int? ? id : this.id,
      key: key ?? this.key,
      value: value ?? this.value,
      description: description is String? ? description : this.description,
      category: category ?? this.category,
      isSecret: isSecret ?? this.isSecret,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
