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
import '../incident/incident_timeline_item.dart' as _i2;
import 'package:serverpod_sentinel_server/src/generated/protocol.dart' as _i3;

/// Helper class for streaming timeline additions.
abstract class StreamTimelineEvent
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  StreamTimelineEvent._({
    required this.incidentId,
    required this.item,
  });

  factory StreamTimelineEvent({
    required int incidentId,
    required _i2.IncidentTimelineItem item,
  }) = _StreamTimelineEventImpl;

  factory StreamTimelineEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return StreamTimelineEvent(
      incidentId: jsonSerialization['incidentId'] as int,
      item: _i3.Protocol().deserialize<_i2.IncidentTimelineItem>(
        jsonSerialization['item'],
      ),
    );
  }

  int incidentId;

  _i2.IncidentTimelineItem item;

  /// Returns a shallow copy of this [StreamTimelineEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StreamTimelineEvent copyWith({
    int? incidentId,
    _i2.IncidentTimelineItem? item,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StreamTimelineEvent',
      'incidentId': incidentId,
      'item': item.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'StreamTimelineEvent',
      'incidentId': incidentId,
      'item': item.toJsonForProtocol(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _StreamTimelineEventImpl extends StreamTimelineEvent {
  _StreamTimelineEventImpl({
    required int incidentId,
    required _i2.IncidentTimelineItem item,
  }) : super._(
         incidentId: incidentId,
         item: item,
       );

  /// Returns a shallow copy of this [StreamTimelineEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StreamTimelineEvent copyWith({
    int? incidentId,
    _i2.IncidentTimelineItem? item,
  }) {
    return StreamTimelineEvent(
      incidentId: incidentId ?? this.incidentId,
      item: item ?? this.item.copyWith(),
    );
  }
}
