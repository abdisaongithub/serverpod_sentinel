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
import '../enums/playbook_type.dart' as _i2;
import '../automation/playbook_execution.dart' as _i3;
import 'package:serverpod_sentinel_client/src/protocol/protocol.dart' as _i4;

/// A template for response procedures (manual checklists or automated scripts).
abstract class Playbook implements _i1.SerializableModel {
  Playbook._({
    this.id,
    required this.name,
    this.description,
    required this.type,
    required this.content,
    this.executions,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Playbook({
    int? id,
    required String name,
    String? description,
    required _i2.PlaybookType type,
    required String content,
    List<_i3.PlaybookExecution>? executions,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PlaybookImpl;

  factory Playbook.fromJson(Map<String, dynamic> jsonSerialization) {
    return Playbook(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      type: _i2.PlaybookType.fromJson((jsonSerialization['type'] as String)),
      content: jsonSerialization['content'] as String,
      executions: jsonSerialization['executions'] == null
          ? null
          : _i4.Protocol().deserialize<List<_i3.PlaybookExecution>>(
              jsonSerialization['executions'],
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

  _i2.PlaybookType type;

  String content;

  List<_i3.PlaybookExecution>? executions;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [Playbook]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Playbook copyWith({
    int? id,
    String? name,
    String? description,
    _i2.PlaybookType? type,
    String? content,
    List<_i3.PlaybookExecution>? executions,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Playbook',
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'type': type.toJson(),
      'content': content,
      if (executions != null)
        'executions': executions?.toJson(valueToJson: (v) => v.toJson()),
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

class _PlaybookImpl extends Playbook {
  _PlaybookImpl({
    int? id,
    required String name,
    String? description,
    required _i2.PlaybookType type,
    required String content,
    List<_i3.PlaybookExecution>? executions,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         name: name,
         description: description,
         type: type,
         content: content,
         executions: executions,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Playbook]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Playbook copyWith({
    Object? id = _Undefined,
    String? name,
    Object? description = _Undefined,
    _i2.PlaybookType? type,
    String? content,
    Object? executions = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Playbook(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      type: type ?? this.type,
      content: content ?? this.content,
      executions: executions is List<_i3.PlaybookExecution>?
          ? executions
          : this.executions?.map((e0) => e0.copyWith()).toList(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
