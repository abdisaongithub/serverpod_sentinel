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

/// Outgoing webhooks to notify external systems of platform events.
abstract class OutgoingWebhook implements _i1.SerializableModel {
  OutgoingWebhook._({
    this.id,
    required this.name,
    required this.url,
    required this.events,
    this.secret,
    required this.isEnabled,
    this.lastTriggeredAt,
    this.lastResponseCode,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OutgoingWebhook({
    int? id,
    required String name,
    required String url,
    required List<String> events,
    String? secret,
    required bool isEnabled,
    DateTime? lastTriggeredAt,
    int? lastResponseCode,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _OutgoingWebhookImpl;

  factory OutgoingWebhook.fromJson(Map<String, dynamic> jsonSerialization) {
    return OutgoingWebhook(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      url: jsonSerialization['url'] as String,
      events: _i2.Protocol().deserialize<List<String>>(
        jsonSerialization['events'],
      ),
      secret: jsonSerialization['secret'] as String?,
      isEnabled: jsonSerialization['isEnabled'] as bool,
      lastTriggeredAt: jsonSerialization['lastTriggeredAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastTriggeredAt'],
            ),
      lastResponseCode: jsonSerialization['lastResponseCode'] as int?,
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

  String url;

  List<String> events;

  String? secret;

  bool isEnabled;

  DateTime? lastTriggeredAt;

  int? lastResponseCode;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [OutgoingWebhook]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  OutgoingWebhook copyWith({
    int? id,
    String? name,
    String? url,
    List<String>? events,
    String? secret,
    bool? isEnabled,
    DateTime? lastTriggeredAt,
    int? lastResponseCode,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'OutgoingWebhook',
      if (id != null) 'id': id,
      'name': name,
      'url': url,
      'events': events.toJson(),
      if (secret != null) 'secret': secret,
      'isEnabled': isEnabled,
      if (lastTriggeredAt != null) 'lastTriggeredAt': lastTriggeredAt?.toJson(),
      if (lastResponseCode != null) 'lastResponseCode': lastResponseCode,
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

class _OutgoingWebhookImpl extends OutgoingWebhook {
  _OutgoingWebhookImpl({
    int? id,
    required String name,
    required String url,
    required List<String> events,
    String? secret,
    required bool isEnabled,
    DateTime? lastTriggeredAt,
    int? lastResponseCode,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         name: name,
         url: url,
         events: events,
         secret: secret,
         isEnabled: isEnabled,
         lastTriggeredAt: lastTriggeredAt,
         lastResponseCode: lastResponseCode,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [OutgoingWebhook]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  OutgoingWebhook copyWith({
    Object? id = _Undefined,
    String? name,
    String? url,
    List<String>? events,
    Object? secret = _Undefined,
    bool? isEnabled,
    Object? lastTriggeredAt = _Undefined,
    Object? lastResponseCode = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return OutgoingWebhook(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      url: url ?? this.url,
      events: events ?? this.events.map((e0) => e0).toList(),
      secret: secret is String? ? secret : this.secret,
      isEnabled: isEnabled ?? this.isEnabled,
      lastTriggeredAt: lastTriggeredAt is DateTime?
          ? lastTriggeredAt
          : this.lastTriggeredAt,
      lastResponseCode: lastResponseCode is int?
          ? lastResponseCode
          : this.lastResponseCode,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
