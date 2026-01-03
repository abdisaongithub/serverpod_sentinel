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
import '../telemetry/telemetry_signal_payload.dart' as _i2;
import 'package:serverpod_sentinel_client/src/protocol/protocol.dart' as _i3;

/// Batch payload for health signals.
abstract class TelemetrySignalBatch implements _i1.SerializableModel {
  TelemetrySignalBatch._({
    required this.timestamp,
    required this.signals,
  });

  factory TelemetrySignalBatch({
    required DateTime timestamp,
    required List<_i2.TelemetrySignalPayload> signals,
  }) = _TelemetrySignalBatchImpl;

  factory TelemetrySignalBatch.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return TelemetrySignalBatch(
      timestamp: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      signals: _i3.Protocol().deserialize<List<_i2.TelemetrySignalPayload>>(
        jsonSerialization['signals'],
      ),
    );
  }

  DateTime timestamp;

  List<_i2.TelemetrySignalPayload> signals;

  /// Returns a shallow copy of this [TelemetrySignalBatch]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TelemetrySignalBatch copyWith({
    DateTime? timestamp,
    List<_i2.TelemetrySignalPayload>? signals,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TelemetrySignalBatch',
      'timestamp': timestamp.toJson(),
      'signals': signals.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _TelemetrySignalBatchImpl extends TelemetrySignalBatch {
  _TelemetrySignalBatchImpl({
    required DateTime timestamp,
    required List<_i2.TelemetrySignalPayload> signals,
  }) : super._(
         timestamp: timestamp,
         signals: signals,
       );

  /// Returns a shallow copy of this [TelemetrySignalBatch]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TelemetrySignalBatch copyWith({
    DateTime? timestamp,
    List<_i2.TelemetrySignalPayload>? signals,
  }) {
    return TelemetrySignalBatch(
      timestamp: timestamp ?? this.timestamp,
      signals: signals ?? this.signals.map((e0) => e0.copyWith()).toList(),
    );
  }
}
