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

/// Internal model for tracking rate limits in cache.
abstract class RateLimitCount implements _i1.SerializableModel {
  RateLimitCount._({
    required this.count,
    required this.resetAt,
  });

  factory RateLimitCount({
    required int count,
    required DateTime resetAt,
  }) = _RateLimitCountImpl;

  factory RateLimitCount.fromJson(Map<String, dynamic> jsonSerialization) {
    return RateLimitCount(
      count: jsonSerialization['count'] as int,
      resetAt: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['resetAt']),
    );
  }

  int count;

  DateTime resetAt;

  /// Returns a shallow copy of this [RateLimitCount]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RateLimitCount copyWith({
    int? count,
    DateTime? resetAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RateLimitCount',
      'count': count,
      'resetAt': resetAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _RateLimitCountImpl extends RateLimitCount {
  _RateLimitCountImpl({
    required int count,
    required DateTime resetAt,
  }) : super._(
         count: count,
         resetAt: resetAt,
       );

  /// Returns a shallow copy of this [RateLimitCount]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RateLimitCount copyWith({
    int? count,
    DateTime? resetAt,
  }) {
    return RateLimitCount(
      count: count ?? this.count,
      resetAt: resetAt ?? this.resetAt,
    );
  }
}
