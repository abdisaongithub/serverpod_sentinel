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

abstract class HealthSummary
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  HealthSummary._({
    required this.total,
    required this.healthy,
    required this.degraded,
    required this.down,
    required this.healthPercentage,
  });

  factory HealthSummary({
    required int total,
    required int healthy,
    required int degraded,
    required int down,
    required double healthPercentage,
  }) = _HealthSummaryImpl;

  factory HealthSummary.fromJson(Map<String, dynamic> jsonSerialization) {
    return HealthSummary(
      total: jsonSerialization['total'] as int,
      healthy: jsonSerialization['healthy'] as int,
      degraded: jsonSerialization['degraded'] as int,
      down: jsonSerialization['down'] as int,
      healthPercentage: (jsonSerialization['healthPercentage'] as num)
          .toDouble(),
    );
  }

  int total;

  int healthy;

  int degraded;

  int down;

  double healthPercentage;

  /// Returns a shallow copy of this [HealthSummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  HealthSummary copyWith({
    int? total,
    int? healthy,
    int? degraded,
    int? down,
    double? healthPercentage,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'HealthSummary',
      'total': total,
      'healthy': healthy,
      'degraded': degraded,
      'down': down,
      'healthPercentage': healthPercentage,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'HealthSummary',
      'total': total,
      'healthy': healthy,
      'degraded': degraded,
      'down': down,
      'healthPercentage': healthPercentage,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _HealthSummaryImpl extends HealthSummary {
  _HealthSummaryImpl({
    required int total,
    required int healthy,
    required int degraded,
    required int down,
    required double healthPercentage,
  }) : super._(
         total: total,
         healthy: healthy,
         degraded: degraded,
         down: down,
         healthPercentage: healthPercentage,
       );

  /// Returns a shallow copy of this [HealthSummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  HealthSummary copyWith({
    int? total,
    int? healthy,
    int? degraded,
    int? down,
    double? healthPercentage,
  }) {
    return HealthSummary(
      total: total ?? this.total,
      healthy: healthy ?? this.healthy,
      degraded: degraded ?? this.degraded,
      down: down ?? this.down,
      healthPercentage: healthPercentage ?? this.healthPercentage,
    );
  }
}
