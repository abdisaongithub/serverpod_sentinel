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
import '../enums/service_status.dart' as _i2;

/// Helper class for streaming service status changes.
abstract class StreamServiceStatus implements _i1.SerializableModel {
  StreamServiceStatus._({
    required this.serviceId,
    required this.previousStatus,
    required this.newStatus,
    required this.timestamp,
    this.triggeringSignalId,
  });

  factory StreamServiceStatus({
    required int serviceId,
    required _i2.ServiceStatus previousStatus,
    required _i2.ServiceStatus newStatus,
    required DateTime timestamp,
    int? triggeringSignalId,
  }) = _StreamServiceStatusImpl;

  factory StreamServiceStatus.fromJson(Map<String, dynamic> jsonSerialization) {
    return StreamServiceStatus(
      serviceId: jsonSerialization['serviceId'] as int,
      previousStatus: _i2.ServiceStatus.fromJson(
        (jsonSerialization['previousStatus'] as String),
      ),
      newStatus: _i2.ServiceStatus.fromJson(
        (jsonSerialization['newStatus'] as String),
      ),
      timestamp: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      triggeringSignalId: jsonSerialization['triggeringSignalId'] as int?,
    );
  }

  int serviceId;

  _i2.ServiceStatus previousStatus;

  _i2.ServiceStatus newStatus;

  DateTime timestamp;

  int? triggeringSignalId;

  /// Returns a shallow copy of this [StreamServiceStatus]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StreamServiceStatus copyWith({
    int? serviceId,
    _i2.ServiceStatus? previousStatus,
    _i2.ServiceStatus? newStatus,
    DateTime? timestamp,
    int? triggeringSignalId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StreamServiceStatus',
      'serviceId': serviceId,
      'previousStatus': previousStatus.toJson(),
      'newStatus': newStatus.toJson(),
      'timestamp': timestamp.toJson(),
      if (triggeringSignalId != null) 'triggeringSignalId': triggeringSignalId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StreamServiceStatusImpl extends StreamServiceStatus {
  _StreamServiceStatusImpl({
    required int serviceId,
    required _i2.ServiceStatus previousStatus,
    required _i2.ServiceStatus newStatus,
    required DateTime timestamp,
    int? triggeringSignalId,
  }) : super._(
         serviceId: serviceId,
         previousStatus: previousStatus,
         newStatus: newStatus,
         timestamp: timestamp,
         triggeringSignalId: triggeringSignalId,
       );

  /// Returns a shallow copy of this [StreamServiceStatus]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StreamServiceStatus copyWith({
    int? serviceId,
    _i2.ServiceStatus? previousStatus,
    _i2.ServiceStatus? newStatus,
    DateTime? timestamp,
    Object? triggeringSignalId = _Undefined,
  }) {
    return StreamServiceStatus(
      serviceId: serviceId ?? this.serviceId,
      previousStatus: previousStatus ?? this.previousStatus,
      newStatus: newStatus ?? this.newStatus,
      timestamp: timestamp ?? this.timestamp,
      triggeringSignalId: triggeringSignalId is int?
          ? triggeringSignalId
          : this.triggeringSignalId,
    );
  }
}
