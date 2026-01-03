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

/// Individual signal update payload.
abstract class TelemetrySignalPayload
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TelemetrySignalPayload._({
    required this.identifier,
    required this.value,
    this.unit,
    required this.isHealthy,
    this.errorMessage,
  });

  factory TelemetrySignalPayload({
    required String identifier,
    required double value,
    String? unit,
    required bool isHealthy,
    String? errorMessage,
  }) = _TelemetrySignalPayloadImpl;

  factory TelemetrySignalPayload.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return TelemetrySignalPayload(
      identifier: jsonSerialization['identifier'] as String,
      value: (jsonSerialization['value'] as num).toDouble(),
      unit: jsonSerialization['unit'] as String?,
      isHealthy: jsonSerialization['isHealthy'] as bool,
      errorMessage: jsonSerialization['errorMessage'] as String?,
    );
  }

  String identifier;

  double value;

  String? unit;

  bool isHealthy;

  String? errorMessage;

  /// Returns a shallow copy of this [TelemetrySignalPayload]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TelemetrySignalPayload copyWith({
    String? identifier,
    double? value,
    String? unit,
    bool? isHealthy,
    String? errorMessage,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TelemetrySignalPayload',
      'identifier': identifier,
      'value': value,
      if (unit != null) 'unit': unit,
      'isHealthy': isHealthy,
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TelemetrySignalPayload',
      'identifier': identifier,
      'value': value,
      if (unit != null) 'unit': unit,
      'isHealthy': isHealthy,
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TelemetrySignalPayloadImpl extends TelemetrySignalPayload {
  _TelemetrySignalPayloadImpl({
    required String identifier,
    required double value,
    String? unit,
    required bool isHealthy,
    String? errorMessage,
  }) : super._(
         identifier: identifier,
         value: value,
         unit: unit,
         isHealthy: isHealthy,
         errorMessage: errorMessage,
       );

  /// Returns a shallow copy of this [TelemetrySignalPayload]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TelemetrySignalPayload copyWith({
    String? identifier,
    double? value,
    Object? unit = _Undefined,
    bool? isHealthy,
    Object? errorMessage = _Undefined,
  }) {
    return TelemetrySignalPayload(
      identifier: identifier ?? this.identifier,
      value: value ?? this.value,
      unit: unit is String? ? unit : this.unit,
      isHealthy: isHealthy ?? this.isHealthy,
      errorMessage: errorMessage is String? ? errorMessage : this.errorMessage,
    );
  }
}
