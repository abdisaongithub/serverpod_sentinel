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

abstract class StreamMetric implements _i1.SerializableModel {
  StreamMetric._({
    required this.serviceId,
    required this.timestamp,
    required this.name,
    required this.value,
    this.unit,
    this.labels,
  });

  factory StreamMetric({
    required int serviceId,
    required DateTime timestamp,
    required String name,
    required double value,
    String? unit,
    String? labels,
  }) = _StreamMetricImpl;

  factory StreamMetric.fromJson(Map<String, dynamic> jsonSerialization) {
    return StreamMetric(
      serviceId: jsonSerialization['serviceId'] as int,
      timestamp: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      name: jsonSerialization['name'] as String,
      value: (jsonSerialization['value'] as num).toDouble(),
      unit: jsonSerialization['unit'] as String?,
      labels: jsonSerialization['labels'] as String?,
    );
  }

  int serviceId;

  DateTime timestamp;

  String name;

  double value;

  String? unit;

  String? labels;

  /// Returns a shallow copy of this [StreamMetric]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StreamMetric copyWith({
    int? serviceId,
    DateTime? timestamp,
    String? name,
    double? value,
    String? unit,
    String? labels,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StreamMetric',
      'serviceId': serviceId,
      'timestamp': timestamp.toJson(),
      'name': name,
      'value': value,
      if (unit != null) 'unit': unit,
      if (labels != null) 'labels': labels,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StreamMetricImpl extends StreamMetric {
  _StreamMetricImpl({
    required int serviceId,
    required DateTime timestamp,
    required String name,
    required double value,
    String? unit,
    String? labels,
  }) : super._(
         serviceId: serviceId,
         timestamp: timestamp,
         name: name,
         value: value,
         unit: unit,
         labels: labels,
       );

  /// Returns a shallow copy of this [StreamMetric]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StreamMetric copyWith({
    int? serviceId,
    DateTime? timestamp,
    String? name,
    double? value,
    Object? unit = _Undefined,
    Object? labels = _Undefined,
  }) {
    return StreamMetric(
      serviceId: serviceId ?? this.serviceId,
      timestamp: timestamp ?? this.timestamp,
      name: name ?? this.name,
      value: value ?? this.value,
      unit: unit is String? ? unit : this.unit,
      labels: labels is String? ? labels : this.labels,
    );
  }
}
