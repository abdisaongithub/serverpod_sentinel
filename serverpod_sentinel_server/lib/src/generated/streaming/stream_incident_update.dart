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
import '../streaming/stream_update_type.dart' as _i2;
import '../incident/incident.dart' as _i3;
import 'package:serverpod_sentinel_server/src/generated/protocol.dart' as _i4;

/// Helper class for streaming incident updates.
abstract class StreamIncidentUpdate
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  StreamIncidentUpdate._({
    required this.type,
    required this.incident,
  });

  factory StreamIncidentUpdate({
    required _i2.StreamUpdateType type,
    required _i3.Incident incident,
  }) = _StreamIncidentUpdateImpl;

  factory StreamIncidentUpdate.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return StreamIncidentUpdate(
      type: _i2.StreamUpdateType.fromJson(
        (jsonSerialization['type'] as String),
      ),
      incident: _i4.Protocol().deserialize<_i3.Incident>(
        jsonSerialization['incident'],
      ),
    );
  }

  _i2.StreamUpdateType type;

  _i3.Incident incident;

  /// Returns a shallow copy of this [StreamIncidentUpdate]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StreamIncidentUpdate copyWith({
    _i2.StreamUpdateType? type,
    _i3.Incident? incident,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StreamIncidentUpdate',
      'type': type.toJson(),
      'incident': incident.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'StreamIncidentUpdate',
      'type': type.toJson(),
      'incident': incident.toJsonForProtocol(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _StreamIncidentUpdateImpl extends StreamIncidentUpdate {
  _StreamIncidentUpdateImpl({
    required _i2.StreamUpdateType type,
    required _i3.Incident incident,
  }) : super._(
         type: type,
         incident: incident,
       );

  /// Returns a shallow copy of this [StreamIncidentUpdate]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StreamIncidentUpdate copyWith({
    _i2.StreamUpdateType? type,
    _i3.Incident? incident,
  }) {
    return StreamIncidentUpdate(
      type: type ?? this.type,
      incident: incident ?? this.incident.copyWith(),
    );
  }
}
