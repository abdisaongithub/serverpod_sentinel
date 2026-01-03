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
import '../incident/incident.dart' as _i2;
import '../security/ops_user.dart' as _i3;
import '../enums/timeline_item_type.dart' as _i4;
import 'package:serverpod_sentinel_client/src/protocol/protocol.dart' as _i5;

/// Represents an item in the timeline of an incident.
abstract class IncidentTimelineItem implements _i1.SerializableModel {
  IncidentTimelineItem._({
    this.id,
    required this.incidentId,
    required this.incidentId,
    this.incident,
    this.authorId,
    required this.authorId,
    this.author,
    required this.type,
    required this.content,
    this.metaData,
    required this.createdAt,
  });

  factory IncidentTimelineItem({
    int? id,
    required int incidentId,
    required int incidentId,
    _i2.Incident? incident,
    int? authorId,
    required int authorId,
    _i3.OpsUser? author,
    required _i4.TimelineItemType type,
    required String content,
    String? metaData,
    required DateTime createdAt,
  }) = _IncidentTimelineItemImpl;

  factory IncidentTimelineItem.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return IncidentTimelineItem(
      id: jsonSerialization['id'] as int?,
      incidentId: jsonSerialization['incidentId'] as int,
      incident: jsonSerialization['incident'] == null
          ? null
          : _i5.Protocol().deserialize<_i2.Incident>(
              jsonSerialization['incident'],
            ),
      authorId: jsonSerialization['authorId'] as int,
      author: jsonSerialization['author'] == null
          ? null
          : _i5.Protocol().deserialize<_i3.OpsUser>(
              jsonSerialization['author'],
            ),
      type: _i4.TimelineItemType.fromJson(
        (jsonSerialization['type'] as String),
      ),
      content: jsonSerialization['content'] as String,
      metaData: jsonSerialization['metaData'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int incidentId;

  int incidentId;

  _i2.Incident? incident;

  int? authorId;

  int authorId;

  _i3.OpsUser? author;

  _i4.TimelineItemType type;

  String content;

  String? metaData;

  DateTime createdAt;

  /// Returns a shallow copy of this [IncidentTimelineItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  IncidentTimelineItem copyWith({
    int? id,
    int? incidentId,
    int? incidentId,
    _i2.Incident? incident,
    int? authorId,
    int? authorId,
    _i3.OpsUser? author,
    _i4.TimelineItemType? type,
    String? content,
    String? metaData,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'IncidentTimelineItem',
      if (id != null) 'id': id,
      'incidentId': incidentId,
      'incidentId': incidentId,
      if (incident != null) 'incident': incident?.toJson(),
      if (authorId != null) 'authorId': authorId,
      'authorId': authorId,
      if (author != null) 'author': author?.toJson(),
      'type': type.toJson(),
      'content': content,
      if (metaData != null) 'metaData': metaData,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _IncidentTimelineItemImpl extends IncidentTimelineItem {
  _IncidentTimelineItemImpl({
    int? id,
    required int incidentId,
    required int incidentId,
    _i2.Incident? incident,
    int? authorId,
    required int authorId,
    _i3.OpsUser? author,
    required _i4.TimelineItemType type,
    required String content,
    String? metaData,
    required DateTime createdAt,
  }) : super._(
         id: id,
         incidentId: incidentId,
         incident: incident,
         authorId: authorId,
         author: author,
         type: type,
         content: content,
         metaData: metaData,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [IncidentTimelineItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  IncidentTimelineItem copyWith({
    Object? id = _Undefined,
    int? incidentId,
    int? incidentId,
    Object? incident = _Undefined,
    Object? authorId = _Undefined,
    int? authorId,
    Object? author = _Undefined,
    _i4.TimelineItemType? type,
    String? content,
    Object? metaData = _Undefined,
    DateTime? createdAt,
  }) {
    return IncidentTimelineItem(
      id: id is int? ? id : this.id,
      incidentId: incidentId ?? this.incidentId,
      incident: incident is _i2.Incident?
          ? incident
          : this.incident?.copyWith(),
      authorId: authorId ?? this.authorId,
      author: author is _i3.OpsUser? ? author : this.author?.copyWith(),
      type: type ?? this.type,
      content: content ?? this.content,
      metaData: metaData is String? ? metaData : this.metaData,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
