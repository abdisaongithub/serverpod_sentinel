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
import '../enums/incident_severity.dart' as _i2;

/// Payload for discrete events.
abstract class TelemetryEvent
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TelemetryEvent._({
    required this.eventId,
    required this.timestamp,
    required this.type,
    required this.severity,
    required this.message,
    this.metadata,
  });

  factory TelemetryEvent({
    required _i1.UuidValue eventId,
    required DateTime timestamp,
    required String type,
    required _i2.IncidentSeverity severity,
    required String message,
    String? metadata,
  }) = _TelemetryEventImpl;

  factory TelemetryEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return TelemetryEvent(
      eventId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['eventId'],
      ),
      timestamp: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      type: jsonSerialization['type'] as String,
      severity: _i2.IncidentSeverity.fromJson(
        (jsonSerialization['severity'] as String),
      ),
      message: jsonSerialization['message'] as String,
      metadata: jsonSerialization['metadata'] as String?,
    );
  }

  _i1.UuidValue eventId;

  DateTime timestamp;

  String type;

  _i2.IncidentSeverity severity;

  String message;

  String? metadata;

  /// Returns a shallow copy of this [TelemetryEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TelemetryEvent copyWith({
    _i1.UuidValue? eventId,
    DateTime? timestamp,
    String? type,
    _i2.IncidentSeverity? severity,
    String? message,
    String? metadata,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TelemetryEvent',
      'eventId': eventId.toJson(),
      'timestamp': timestamp.toJson(),
      'type': type,
      'severity': severity.toJson(),
      'message': message,
      if (metadata != null) 'metadata': metadata,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TelemetryEvent',
      'eventId': eventId.toJson(),
      'timestamp': timestamp.toJson(),
      'type': type,
      'severity': severity.toJson(),
      'message': message,
      if (metadata != null) 'metadata': metadata,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TelemetryEventImpl extends TelemetryEvent {
  _TelemetryEventImpl({
    required _i1.UuidValue eventId,
    required DateTime timestamp,
    required String type,
    required _i2.IncidentSeverity severity,
    required String message,
    String? metadata,
  }) : super._(
         eventId: eventId,
         timestamp: timestamp,
         type: type,
         severity: severity,
         message: message,
         metadata: metadata,
       );

  /// Returns a shallow copy of this [TelemetryEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TelemetryEvent copyWith({
    _i1.UuidValue? eventId,
    DateTime? timestamp,
    String? type,
    _i2.IncidentSeverity? severity,
    String? message,
    Object? metadata = _Undefined,
  }) {
    return TelemetryEvent(
      eventId: eventId ?? this.eventId,
      timestamp: timestamp ?? this.timestamp,
      type: type ?? this.type,
      severity: severity ?? this.severity,
      message: message ?? this.message,
      metadata: metadata is String? ? metadata : this.metadata,
    );
  }
}
