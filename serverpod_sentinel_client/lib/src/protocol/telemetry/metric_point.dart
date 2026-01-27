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
import '../service/health_signal.dart' as _i2;
import 'package:serverpod_sentinel_client/src/protocol/protocol.dart' as _i3;

abstract class MetricPoint implements _i1.SerializableModel {
  MetricPoint._({
    this.id,
    required this.signalId,
    this.signal,
    required this.timestamp,
    required this.value,
  });

  factory MetricPoint({
    int? id,
    required int signalId,
    _i2.HealthSignal? signal,
    required DateTime timestamp,
    required double value,
  }) = _MetricPointImpl;

  factory MetricPoint.fromJson(Map<String, dynamic> jsonSerialization) {
    return MetricPoint(
      id: jsonSerialization['id'] as int?,
      signalId: jsonSerialization['signalId'] as int,
      signal: jsonSerialization['signal'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.HealthSignal>(
              jsonSerialization['signal'],
            ),
      timestamp: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      value: (jsonSerialization['value'] as num).toDouble(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int signalId;

  _i2.HealthSignal? signal;

  DateTime timestamp;

  double value;

  /// Returns a shallow copy of this [MetricPoint]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MetricPoint copyWith({
    int? id,
    int? signalId,
    _i2.HealthSignal? signal,
    DateTime? timestamp,
    double? value,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MetricPoint',
      if (id != null) 'id': id,
      'signalId': signalId,
      if (signal != null) 'signal': signal?.toJson(),
      'timestamp': timestamp.toJson(),
      'value': value,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MetricPointImpl extends MetricPoint {
  _MetricPointImpl({
    int? id,
    required int signalId,
    _i2.HealthSignal? signal,
    required DateTime timestamp,
    required double value,
  }) : super._(
         id: id,
         signalId: signalId,
         signal: signal,
         timestamp: timestamp,
         value: value,
       );

  /// Returns a shallow copy of this [MetricPoint]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MetricPoint copyWith({
    Object? id = _Undefined,
    int? signalId,
    Object? signal = _Undefined,
    DateTime? timestamp,
    double? value,
  }) {
    return MetricPoint(
      id: id is int? ? id : this.id,
      signalId: signalId ?? this.signalId,
      signal: signal is _i2.HealthSignal? ? signal : this.signal?.copyWith(),
      timestamp: timestamp ?? this.timestamp,
      value: value ?? this.value,
    );
  }
}
