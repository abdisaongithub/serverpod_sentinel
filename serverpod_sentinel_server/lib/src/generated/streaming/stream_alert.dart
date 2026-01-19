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

abstract class StreamAlert
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  StreamAlert._({
    required this.id,
    this.serviceId,
    required this.title,
    required this.message,
    required this.severity,
    required this.source,
    required this.timestamp,
    required this.acknowledged,
  });

  factory StreamAlert({
    required int id,
    int? serviceId,
    required String title,
    required String message,
    required String severity,
    required String source,
    required DateTime timestamp,
    required bool acknowledged,
  }) = _StreamAlertImpl;

  factory StreamAlert.fromJson(Map<String, dynamic> jsonSerialization) {
    return StreamAlert(
      id: jsonSerialization['id'] as int,
      serviceId: jsonSerialization['serviceId'] as int?,
      title: jsonSerialization['title'] as String,
      message: jsonSerialization['message'] as String,
      severity: jsonSerialization['severity'] as String,
      source: jsonSerialization['source'] as String,
      timestamp: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      acknowledged: jsonSerialization['acknowledged'] as bool,
    );
  }

  int id;

  int? serviceId;

  String title;

  String message;

  String severity;

  String source;

  DateTime timestamp;

  bool acknowledged;

  /// Returns a shallow copy of this [StreamAlert]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StreamAlert copyWith({
    int? id,
    int? serviceId,
    String? title,
    String? message,
    String? severity,
    String? source,
    DateTime? timestamp,
    bool? acknowledged,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StreamAlert',
      'id': id,
      if (serviceId != null) 'serviceId': serviceId,
      'title': title,
      'message': message,
      'severity': severity,
      'source': source,
      'timestamp': timestamp.toJson(),
      'acknowledged': acknowledged,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'StreamAlert',
      'id': id,
      if (serviceId != null) 'serviceId': serviceId,
      'title': title,
      'message': message,
      'severity': severity,
      'source': source,
      'timestamp': timestamp.toJson(),
      'acknowledged': acknowledged,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StreamAlertImpl extends StreamAlert {
  _StreamAlertImpl({
    required int id,
    int? serviceId,
    required String title,
    required String message,
    required String severity,
    required String source,
    required DateTime timestamp,
    required bool acknowledged,
  }) : super._(
         id: id,
         serviceId: serviceId,
         title: title,
         message: message,
         severity: severity,
         source: source,
         timestamp: timestamp,
         acknowledged: acknowledged,
       );

  /// Returns a shallow copy of this [StreamAlert]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StreamAlert copyWith({
    int? id,
    Object? serviceId = _Undefined,
    String? title,
    String? message,
    String? severity,
    String? source,
    DateTime? timestamp,
    bool? acknowledged,
  }) {
    return StreamAlert(
      id: id ?? this.id,
      serviceId: serviceId is int? ? serviceId : this.serviceId,
      title: title ?? this.title,
      message: message ?? this.message,
      severity: severity ?? this.severity,
      source: source ?? this.source,
      timestamp: timestamp ?? this.timestamp,
      acknowledged: acknowledged ?? this.acknowledged,
    );
  }
}
