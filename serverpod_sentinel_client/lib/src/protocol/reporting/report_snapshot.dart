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
import 'package:serverpod_sentinel_client/src/protocol/protocol.dart' as _i4;

/// Stores a generated post-mortem report for historical access.
abstract class ReportSnapshot implements _i1.SerializableModel {
  ReportSnapshot._({
    this.id,
    required this.incidentId,
    required this.incidentId,
    this.incident,
    required this.generatedAt,
    this.generatedById,
    required this.generatedById,
    this.generatedBy,
    required this.content,
  });

  factory ReportSnapshot({
    int? id,
    required int incidentId,
    required int incidentId,
    _i2.Incident? incident,
    required DateTime generatedAt,
    int? generatedById,
    required int generatedById,
    _i3.OpsUser? generatedBy,
    required String content,
  }) = _ReportSnapshotImpl;

  factory ReportSnapshot.fromJson(Map<String, dynamic> jsonSerialization) {
    return ReportSnapshot(
      id: jsonSerialization['id'] as int?,
      incidentId: jsonSerialization['incidentId'] as int,
      incident: jsonSerialization['incident'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.Incident>(
              jsonSerialization['incident'],
            ),
      generatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['generatedAt'],
      ),
      generatedById: jsonSerialization['generatedById'] as int,
      generatedBy: jsonSerialization['generatedBy'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.OpsUser>(
              jsonSerialization['generatedBy'],
            ),
      content: jsonSerialization['content'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int incidentId;

  int incidentId;

  _i2.Incident? incident;

  DateTime generatedAt;

  int? generatedById;

  int generatedById;

  _i3.OpsUser? generatedBy;

  String content;

  /// Returns a shallow copy of this [ReportSnapshot]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ReportSnapshot copyWith({
    int? id,
    int? incidentId,
    int? incidentId,
    _i2.Incident? incident,
    DateTime? generatedAt,
    int? generatedById,
    int? generatedById,
    _i3.OpsUser? generatedBy,
    String? content,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ReportSnapshot',
      if (id != null) 'id': id,
      'incidentId': incidentId,
      'incidentId': incidentId,
      if (incident != null) 'incident': incident?.toJson(),
      'generatedAt': generatedAt.toJson(),
      if (generatedById != null) 'generatedById': generatedById,
      'generatedById': generatedById,
      if (generatedBy != null) 'generatedBy': generatedBy?.toJson(),
      'content': content,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ReportSnapshotImpl extends ReportSnapshot {
  _ReportSnapshotImpl({
    int? id,
    required int incidentId,
    required int incidentId,
    _i2.Incident? incident,
    required DateTime generatedAt,
    int? generatedById,
    required int generatedById,
    _i3.OpsUser? generatedBy,
    required String content,
  }) : super._(
         id: id,
         incidentId: incidentId,
         incident: incident,
         generatedAt: generatedAt,
         generatedById: generatedById,
         generatedBy: generatedBy,
         content: content,
       );

  /// Returns a shallow copy of this [ReportSnapshot]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ReportSnapshot copyWith({
    Object? id = _Undefined,
    int? incidentId,
    int? incidentId,
    Object? incident = _Undefined,
    DateTime? generatedAt,
    Object? generatedById = _Undefined,
    int? generatedById,
    Object? generatedBy = _Undefined,
    String? content,
  }) {
    return ReportSnapshot(
      id: id is int? ? id : this.id,
      incidentId: incidentId ?? this.incidentId,
      incident: incident is _i2.Incident?
          ? incident
          : this.incident?.copyWith(),
      generatedAt: generatedAt ?? this.generatedAt,
      generatedById: generatedById ?? this.generatedById,
      generatedBy: generatedBy is _i3.OpsUser?
          ? generatedBy
          : this.generatedBy?.copyWith(),
      content: content ?? this.content,
    );
  }
}
