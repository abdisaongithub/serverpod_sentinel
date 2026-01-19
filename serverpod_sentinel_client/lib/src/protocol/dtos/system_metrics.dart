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

abstract class SystemMetrics implements _i1.SerializableModel {
  SystemMetrics._({
    required this.uptimeDays,
    required this.uptimeHours,
    required this.averageLatencyMs,
    this.totalRequests,
    this.errorRate,
  });

  factory SystemMetrics({
    required int uptimeDays,
    required int uptimeHours,
    required int averageLatencyMs,
    int? totalRequests,
    double? errorRate,
  }) = _SystemMetricsImpl;

  factory SystemMetrics.fromJson(Map<String, dynamic> jsonSerialization) {
    return SystemMetrics(
      uptimeDays: jsonSerialization['uptimeDays'] as int,
      uptimeHours: jsonSerialization['uptimeHours'] as int,
      averageLatencyMs: jsonSerialization['averageLatencyMs'] as int,
      totalRequests: jsonSerialization['totalRequests'] as int?,
      errorRate: (jsonSerialization['errorRate'] as num?)?.toDouble(),
    );
  }

  int uptimeDays;

  int uptimeHours;

  int averageLatencyMs;

  int? totalRequests;

  double? errorRate;

  /// Returns a shallow copy of this [SystemMetrics]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SystemMetrics copyWith({
    int? uptimeDays,
    int? uptimeHours,
    int? averageLatencyMs,
    int? totalRequests,
    double? errorRate,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SystemMetrics',
      'uptimeDays': uptimeDays,
      'uptimeHours': uptimeHours,
      'averageLatencyMs': averageLatencyMs,
      if (totalRequests != null) 'totalRequests': totalRequests,
      if (errorRate != null) 'errorRate': errorRate,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SystemMetricsImpl extends SystemMetrics {
  _SystemMetricsImpl({
    required int uptimeDays,
    required int uptimeHours,
    required int averageLatencyMs,
    int? totalRequests,
    double? errorRate,
  }) : super._(
         uptimeDays: uptimeDays,
         uptimeHours: uptimeHours,
         averageLatencyMs: averageLatencyMs,
         totalRequests: totalRequests,
         errorRate: errorRate,
       );

  /// Returns a shallow copy of this [SystemMetrics]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SystemMetrics copyWith({
    int? uptimeDays,
    int? uptimeHours,
    int? averageLatencyMs,
    Object? totalRequests = _Undefined,
    Object? errorRate = _Undefined,
  }) {
    return SystemMetrics(
      uptimeDays: uptimeDays ?? this.uptimeDays,
      uptimeHours: uptimeHours ?? this.uptimeHours,
      averageLatencyMs: averageLatencyMs ?? this.averageLatencyMs,
      totalRequests: totalRequests is int? ? totalRequests : this.totalRequests,
      errorRate: errorRate is double? ? errorRate : this.errorRate,
    );
  }
}
