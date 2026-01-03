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

enum StreamSubscriptionType implements _i1.SerializableModel {
  GLOBAL_SERVICE_UPDATES,
  INCIDENT_ROOM,
  PLAYBOOK_EXECUTION;

  static StreamSubscriptionType fromJson(String name) {
    switch (name) {
      case 'GLOBAL_SERVICE_UPDATES':
        return StreamSubscriptionType.GLOBAL_SERVICE_UPDATES;
      case 'INCIDENT_ROOM':
        return StreamSubscriptionType.INCIDENT_ROOM;
      case 'PLAYBOOK_EXECUTION':
        return StreamSubscriptionType.PLAYBOOK_EXECUTION;
      default:
        throw ArgumentError(
          'Value "$name" cannot be converted to "StreamSubscriptionType"',
        );
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
