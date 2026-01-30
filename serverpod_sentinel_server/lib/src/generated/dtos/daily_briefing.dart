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
import 'package:serverpod/serverpod.dart' as _i1;

abstract class DailyBriefing
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  DailyBriefing._({
    required this.summary,
    required this.incidentCount,
    required this.alertCount,
    required this.automatedActionsCount,
    this.topIssue,
    required this.generatedAt,
  });

  factory DailyBriefing({
    required String summary,
    required int incidentCount,
    required int alertCount,
    required int automatedActionsCount,
    String? topIssue,
    required DateTime generatedAt,
  }) = _DailyBriefingImpl;

  factory DailyBriefing.fromJson(Map<String, dynamic> jsonSerialization) {
    return DailyBriefing(
      summary: jsonSerialization['summary'] as String,
      incidentCount: jsonSerialization['incidentCount'] as int,
      alertCount: jsonSerialization['alertCount'] as int,
      automatedActionsCount: jsonSerialization['automatedActionsCount'] as int,
      topIssue: jsonSerialization['topIssue'] as String?,
      generatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['generatedAt'],
      ),
    );
  }

  String summary;

  int incidentCount;

  int alertCount;

  int automatedActionsCount;

  String? topIssue;

  DateTime generatedAt;

  /// Returns a shallow copy of this [DailyBriefing]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DailyBriefing copyWith({
    String? summary,
    int? incidentCount,
    int? alertCount,
    int? automatedActionsCount,
    String? topIssue,
    DateTime? generatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DailyBriefing',
      'summary': summary,
      'incidentCount': incidentCount,
      'alertCount': alertCount,
      'automatedActionsCount': automatedActionsCount,
      if (topIssue != null) 'topIssue': topIssue,
      'generatedAt': generatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'DailyBriefing',
      'summary': summary,
      'incidentCount': incidentCount,
      'alertCount': alertCount,
      'automatedActionsCount': automatedActionsCount,
      if (topIssue != null) 'topIssue': topIssue,
      'generatedAt': generatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DailyBriefingImpl extends DailyBriefing {
  _DailyBriefingImpl({
    required String summary,
    required int incidentCount,
    required int alertCount,
    required int automatedActionsCount,
    String? topIssue,
    required DateTime generatedAt,
  }) : super._(
         summary: summary,
         incidentCount: incidentCount,
         alertCount: alertCount,
         automatedActionsCount: automatedActionsCount,
         topIssue: topIssue,
         generatedAt: generatedAt,
       );

  /// Returns a shallow copy of this [DailyBriefing]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DailyBriefing copyWith({
    String? summary,
    int? incidentCount,
    int? alertCount,
    int? automatedActionsCount,
    Object? topIssue = _Undefined,
    DateTime? generatedAt,
  }) {
    return DailyBriefing(
      summary: summary ?? this.summary,
      incidentCount: incidentCount ?? this.incidentCount,
      alertCount: alertCount ?? this.alertCount,
      automatedActionsCount:
          automatedActionsCount ?? this.automatedActionsCount,
      topIssue: topIssue is String? ? topIssue : this.topIssue,
      generatedAt: generatedAt ?? this.generatedAt,
    );
  }
}
