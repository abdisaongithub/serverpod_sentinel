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

abstract class AiInsight implements _i1.SerializableModel {
  AiInsight._({
    this.id,
    required this.type,
    required this.title,
    required this.content,
    this.severity,
    this.serviceId,
    this.incidentId,
    required this.confidence,
    this.metadata,
    this.expiresAt,
    required this.createdAt,
  });

  factory AiInsight({
    int? id,
    required String type,
    required String title,
    required String content,
    String? severity,
    int? serviceId,
    int? incidentId,
    required double confidence,
    String? metadata,
    DateTime? expiresAt,
    required DateTime createdAt,
  }) = _AiInsightImpl;

  factory AiInsight.fromJson(Map<String, dynamic> jsonSerialization) {
    return AiInsight(
      id: jsonSerialization['id'] as int?,
      type: jsonSerialization['type'] as String,
      title: jsonSerialization['title'] as String,
      content: jsonSerialization['content'] as String,
      severity: jsonSerialization['severity'] as String?,
      serviceId: jsonSerialization['serviceId'] as int?,
      incidentId: jsonSerialization['incidentId'] as int?,
      confidence: (jsonSerialization['confidence'] as num).toDouble(),
      metadata: jsonSerialization['metadata'] as String?,
      expiresAt: jsonSerialization['expiresAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expiresAt']),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String type;

  String title;

  String content;

  String? severity;

  int? serviceId;

  int? incidentId;

  double confidence;

  String? metadata;

  DateTime? expiresAt;

  DateTime createdAt;

  /// Returns a shallow copy of this [AiInsight]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AiInsight copyWith({
    int? id,
    String? type,
    String? title,
    String? content,
    String? severity,
    int? serviceId,
    int? incidentId,
    double? confidence,
    String? metadata,
    DateTime? expiresAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AiInsight',
      if (id != null) 'id': id,
      'type': type,
      'title': title,
      'content': content,
      if (severity != null) 'severity': severity,
      if (serviceId != null) 'serviceId': serviceId,
      if (incidentId != null) 'incidentId': incidentId,
      'confidence': confidence,
      if (metadata != null) 'metadata': metadata,
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AiInsightImpl extends AiInsight {
  _AiInsightImpl({
    int? id,
    required String type,
    required String title,
    required String content,
    String? severity,
    int? serviceId,
    int? incidentId,
    required double confidence,
    String? metadata,
    DateTime? expiresAt,
    required DateTime createdAt,
  }) : super._(
         id: id,
         type: type,
         title: title,
         content: content,
         severity: severity,
         serviceId: serviceId,
         incidentId: incidentId,
         confidence: confidence,
         metadata: metadata,
         expiresAt: expiresAt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [AiInsight]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AiInsight copyWith({
    Object? id = _Undefined,
    String? type,
    String? title,
    String? content,
    Object? severity = _Undefined,
    Object? serviceId = _Undefined,
    Object? incidentId = _Undefined,
    double? confidence,
    Object? metadata = _Undefined,
    Object? expiresAt = _Undefined,
    DateTime? createdAt,
  }) {
    return AiInsight(
      id: id is int? ? id : this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      content: content ?? this.content,
      severity: severity is String? ? severity : this.severity,
      serviceId: serviceId is int? ? serviceId : this.serviceId,
      incidentId: incidentId is int? ? incidentId : this.incidentId,
      confidence: confidence ?? this.confidence,
      metadata: metadata is String? ? metadata : this.metadata,
      expiresAt: expiresAt is DateTime? ? expiresAt : this.expiresAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
