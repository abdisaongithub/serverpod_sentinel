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
import '../butler/butler_conversation.dart' as _i2;
import 'package:serverpod_sentinel_client/src/protocol/protocol.dart' as _i3;

abstract class ButlerMessage implements _i1.SerializableModel {
  ButlerMessage._({
    this.id,
    required this.conversationId,
    this.conversation,
    required this.role,
    required this.content,
    this.metadata,
    required this.createdAt,
  });

  factory ButlerMessage({
    int? id,
    required int conversationId,
    _i2.ButlerConversation? conversation,
    required String role,
    required String content,
    String? metadata,
    required DateTime createdAt,
  }) = _ButlerMessageImpl;

  factory ButlerMessage.fromJson(Map<String, dynamic> jsonSerialization) {
    return ButlerMessage(
      id: jsonSerialization['id'] as int?,
      conversationId: jsonSerialization['conversationId'] as int,
      conversation: jsonSerialization['conversation'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.ButlerConversation>(
              jsonSerialization['conversation'],
            ),
      role: jsonSerialization['role'] as String,
      content: jsonSerialization['content'] as String,
      metadata: jsonSerialization['metadata'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int conversationId;

  _i2.ButlerConversation? conversation;

  String role;

  String content;

  String? metadata;

  DateTime createdAt;

  /// Returns a shallow copy of this [ButlerMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ButlerMessage copyWith({
    int? id,
    int? conversationId,
    _i2.ButlerConversation? conversation,
    String? role,
    String? content,
    String? metadata,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ButlerMessage',
      if (id != null) 'id': id,
      'conversationId': conversationId,
      if (conversation != null) 'conversation': conversation?.toJson(),
      'role': role,
      'content': content,
      if (metadata != null) 'metadata': metadata,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ButlerMessageImpl extends ButlerMessage {
  _ButlerMessageImpl({
    int? id,
    required int conversationId,
    _i2.ButlerConversation? conversation,
    required String role,
    required String content,
    String? metadata,
    required DateTime createdAt,
  }) : super._(
         id: id,
         conversationId: conversationId,
         conversation: conversation,
         role: role,
         content: content,
         metadata: metadata,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [ButlerMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ButlerMessage copyWith({
    Object? id = _Undefined,
    int? conversationId,
    Object? conversation = _Undefined,
    String? role,
    String? content,
    Object? metadata = _Undefined,
    DateTime? createdAt,
  }) {
    return ButlerMessage(
      id: id is int? ? id : this.id,
      conversationId: conversationId ?? this.conversationId,
      conversation: conversation is _i2.ButlerConversation?
          ? conversation
          : this.conversation?.copyWith(),
      role: role ?? this.role,
      content: content ?? this.content,
      metadata: metadata is String? ? metadata : this.metadata,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
