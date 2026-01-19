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
import '../security/ops_user.dart' as _i2;
import 'package:serverpod_sentinel_client/src/protocol/protocol.dart' as _i3;

abstract class TeamMember implements _i1.SerializableModel {
  TeamMember._({
    required this.user,
    required this.userName,
    this.email,
    this.imageUrl,
  });

  factory TeamMember({
    required _i2.OpsUser user,
    required String userName,
    String? email,
    String? imageUrl,
  }) = _TeamMemberImpl;

  factory TeamMember.fromJson(Map<String, dynamic> jsonSerialization) {
    return TeamMember(
      user: _i3.Protocol().deserialize<_i2.OpsUser>(jsonSerialization['user']),
      userName: jsonSerialization['userName'] as String,
      email: jsonSerialization['email'] as String?,
      imageUrl: jsonSerialization['imageUrl'] as String?,
    );
  }

  _i2.OpsUser user;

  String userName;

  String? email;

  String? imageUrl;

  /// Returns a shallow copy of this [TeamMember]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TeamMember copyWith({
    _i2.OpsUser? user,
    String? userName,
    String? email,
    String? imageUrl,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TeamMember',
      'user': user.toJson(),
      'userName': userName,
      if (email != null) 'email': email,
      if (imageUrl != null) 'imageUrl': imageUrl,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TeamMemberImpl extends TeamMember {
  _TeamMemberImpl({
    required _i2.OpsUser user,
    required String userName,
    String? email,
    String? imageUrl,
  }) : super._(
         user: user,
         userName: userName,
         email: email,
         imageUrl: imageUrl,
       );

  /// Returns a shallow copy of this [TeamMember]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TeamMember copyWith({
    _i2.OpsUser? user,
    String? userName,
    Object? email = _Undefined,
    Object? imageUrl = _Undefined,
  }) {
    return TeamMember(
      user: user ?? this.user.copyWith(),
      userName: userName ?? this.userName,
      email: email is String? ? email : this.email,
      imageUrl: imageUrl is String? ? imageUrl : this.imageUrl,
    );
  }
}
