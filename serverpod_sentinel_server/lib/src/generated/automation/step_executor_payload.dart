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

abstract class StepExecutorPayload
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  StepExecutorPayload._({required this.stepExecutionId});

  factory StepExecutorPayload({required int stepExecutionId}) =
      _StepExecutorPayloadImpl;

  factory StepExecutorPayload.fromJson(Map<String, dynamic> jsonSerialization) {
    return StepExecutorPayload(
      stepExecutionId: jsonSerialization['stepExecutionId'] as int,
    );
  }

  int stepExecutionId;

  /// Returns a shallow copy of this [StepExecutorPayload]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StepExecutorPayload copyWith({int? stepExecutionId});
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StepExecutorPayload',
      'stepExecutionId': stepExecutionId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'StepExecutorPayload',
      'stepExecutionId': stepExecutionId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _StepExecutorPayloadImpl extends StepExecutorPayload {
  _StepExecutorPayloadImpl({required int stepExecutionId})
    : super._(stepExecutionId: stepExecutionId);

  /// Returns a shallow copy of this [StepExecutorPayload]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StepExecutorPayload copyWith({int? stepExecutionId}) {
    return StepExecutorPayload(
      stepExecutionId: stepExecutionId ?? this.stepExecutionId,
    );
  }
}
