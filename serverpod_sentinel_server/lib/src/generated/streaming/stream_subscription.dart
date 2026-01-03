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
import '../streaming/stream_subscription_type.dart' as _i2;

abstract class StreamSubscription
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  StreamSubscription._({
    required this.type,
    this.targetId,
  });

  factory StreamSubscription({
    required _i2.StreamSubscriptionType type,
    int? targetId,
  }) = _StreamSubscriptionImpl;

  factory StreamSubscription.fromJson(Map<String, dynamic> jsonSerialization) {
    return StreamSubscription(
      type: _i2.StreamSubscriptionType.fromJson(
        (jsonSerialization['type'] as String),
      ),
      targetId: jsonSerialization['targetId'] as int?,
    );
  }

  _i2.StreamSubscriptionType type;

  int? targetId;

  /// Returns a shallow copy of this [StreamSubscription]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StreamSubscription copyWith({
    _i2.StreamSubscriptionType? type,
    int? targetId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StreamSubscription',
      'type': type.toJson(),
      if (targetId != null) 'targetId': targetId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'StreamSubscription',
      'type': type.toJson(),
      if (targetId != null) 'targetId': targetId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StreamSubscriptionImpl extends StreamSubscription {
  _StreamSubscriptionImpl({
    required _i2.StreamSubscriptionType type,
    int? targetId,
  }) : super._(
         type: type,
         targetId: targetId,
       );

  /// Returns a shallow copy of this [StreamSubscription]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StreamSubscription copyWith({
    _i2.StreamSubscriptionType? type,
    Object? targetId = _Undefined,
  }) {
    return StreamSubscription(
      type: type ?? this.type,
      targetId: targetId is int? ? targetId : this.targetId,
    );
  }
}
