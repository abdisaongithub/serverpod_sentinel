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

/// Helper class for streaming signal updates.
abstract class StreamSignalUpdate
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  StreamSignalUpdate._({
    required this.serviceId,
    required this.signalId,
    required this.identifier,
    required this.value,
    required this.timestamp,
  });

  factory StreamSignalUpdate({
    required int serviceId,
    required int signalId,
    required String identifier,
    required double value,
    required DateTime timestamp,
  }) = _StreamSignalUpdateImpl;

  factory StreamSignalUpdate.fromJson(Map<String, dynamic> jsonSerialization) {
    return StreamSignalUpdate(
      serviceId: jsonSerialization['serviceId'] as int,
      signalId: jsonSerialization['signalId'] as int,
      identifier: jsonSerialization['identifier'] as String,
      value: (jsonSerialization['value'] as num).toDouble(),
      timestamp: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
    );
  }

  int serviceId;

  int signalId;

  String identifier;

  double value;

  DateTime timestamp;

  /// Returns a shallow copy of this [StreamSignalUpdate]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StreamSignalUpdate copyWith({
    int? serviceId,
    int? signalId,
    String? identifier,
    double? value,
    DateTime? timestamp,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StreamSignalUpdate',
      'serviceId': serviceId,
      'signalId': signalId,
      'identifier': identifier,
      'value': value,
      'timestamp': timestamp.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'StreamSignalUpdate',
      'serviceId': serviceId,
      'signalId': signalId,
      'identifier': identifier,
      'value': value,
      'timestamp': timestamp.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _StreamSignalUpdateImpl extends StreamSignalUpdate {
  _StreamSignalUpdateImpl({
    required int serviceId,
    required int signalId,
    required String identifier,
    required double value,
    required DateTime timestamp,
  }) : super._(
         serviceId: serviceId,
         signalId: signalId,
         identifier: identifier,
         value: value,
         timestamp: timestamp,
       );

  /// Returns a shallow copy of this [StreamSignalUpdate]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StreamSignalUpdate copyWith({
    int? serviceId,
    int? signalId,
    String? identifier,
    double? value,
    DateTime? timestamp,
  }) {
    return StreamSignalUpdate(
      serviceId: serviceId ?? this.serviceId,
      signalId: signalId ?? this.signalId,
      identifier: identifier ?? this.identifier,
      value: value ?? this.value,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
