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

abstract class StreamLogEntry implements _i1.SerializableModel {
  StreamLogEntry._({
    required this.serviceId,
    required this.timestamp,
    required this.level,
    required this.message,
    this.source,
    this.metadata,
  });

  factory StreamLogEntry({
    required int serviceId,
    required DateTime timestamp,
    required String level,
    required String message,
    String? source,
    String? metadata,
  }) = _StreamLogEntryImpl;

  factory StreamLogEntry.fromJson(Map<String, dynamic> jsonSerialization) {
    return StreamLogEntry(
      serviceId: jsonSerialization['serviceId'] as int,
      timestamp: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      level: jsonSerialization['level'] as String,
      message: jsonSerialization['message'] as String,
      source: jsonSerialization['source'] as String?,
      metadata: jsonSerialization['metadata'] as String?,
    );
  }

  int serviceId;

  DateTime timestamp;

  String level;

  String message;

  String? source;

  String? metadata;

  /// Returns a shallow copy of this [StreamLogEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StreamLogEntry copyWith({
    int? serviceId,
    DateTime? timestamp,
    String? level,
    String? message,
    String? source,
    String? metadata,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StreamLogEntry',
      'serviceId': serviceId,
      'timestamp': timestamp.toJson(),
      'level': level,
      'message': message,
      if (source != null) 'source': source,
      if (metadata != null) 'metadata': metadata,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StreamLogEntryImpl extends StreamLogEntry {
  _StreamLogEntryImpl({
    required int serviceId,
    required DateTime timestamp,
    required String level,
    required String message,
    String? source,
    String? metadata,
  }) : super._(
         serviceId: serviceId,
         timestamp: timestamp,
         level: level,
         message: message,
         source: source,
         metadata: metadata,
       );

  /// Returns a shallow copy of this [StreamLogEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StreamLogEntry copyWith({
    int? serviceId,
    DateTime? timestamp,
    String? level,
    String? message,
    Object? source = _Undefined,
    Object? metadata = _Undefined,
  }) {
    return StreamLogEntry(
      serviceId: serviceId ?? this.serviceId,
      timestamp: timestamp ?? this.timestamp,
      level: level ?? this.level,
      message: message ?? this.message,
      source: source is String? ? source : this.source,
      metadata: metadata is String? ? metadata : this.metadata,
    );
  }
}
