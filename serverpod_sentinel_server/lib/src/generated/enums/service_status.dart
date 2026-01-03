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

enum ServiceStatus implements _i1.SerializableModel {
  OPERATIONAL,
  DEGRADED,
  PARTIAL_OUTAGE,
  MAJOR_OUTAGE,
  MAINTENANCE;

  static ServiceStatus fromJson(String name) {
    switch (name) {
      case 'OPERATIONAL':
        return ServiceStatus.OPERATIONAL;
      case 'DEGRADED':
        return ServiceStatus.DEGRADED;
      case 'PARTIAL_OUTAGE':
        return ServiceStatus.PARTIAL_OUTAGE;
      case 'MAJOR_OUTAGE':
        return ServiceStatus.MAJOR_OUTAGE;
      case 'MAINTENANCE':
        return ServiceStatus.MAINTENANCE;
      default:
        throw ArgumentError(
          'Value "$name" cannot be converted to "ServiceStatus"',
        );
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
