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

/// Autonomous remediation policy for automated incident response.
abstract class RemediationPolicy implements _i1.SerializableModel {
  RemediationPolicy._({
    this.id,
    required this.name,
    required this.event,
    this.serviceId,
    required this.playbookId,
    bool? autoExecute,
    bool? requireApproval,
    bool? isEnabled,
    int? maxRetries,
    required this.cooldownPeriod,
    required this.createdAt,
    required this.updatedAt,
  }) : autoExecute = autoExecute ?? true,
       requireApproval = requireApproval ?? false,
       isEnabled = isEnabled ?? true,
       maxRetries = maxRetries ?? 3;

  factory RemediationPolicy({
    int? id,
    required String name,
    required String event,
    int? serviceId,
    required int playbookId,
    bool? autoExecute,
    bool? requireApproval,
    bool? isEnabled,
    int? maxRetries,
    required int cooldownPeriod,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _RemediationPolicyImpl;

  factory RemediationPolicy.fromJson(Map<String, dynamic> jsonSerialization) {
    return RemediationPolicy(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      event: jsonSerialization['event'] as String,
      serviceId: jsonSerialization['serviceId'] as int?,
      playbookId: jsonSerialization['playbookId'] as int,
      autoExecute: jsonSerialization['autoExecute'] as bool?,
      requireApproval: jsonSerialization['requireApproval'] as bool?,
      isEnabled: jsonSerialization['isEnabled'] as bool?,
      maxRetries: jsonSerialization['maxRetries'] as int?,
      cooldownPeriod: jsonSerialization['cooldownPeriod'] as int,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String event;

  int? serviceId;

  int playbookId;

  bool autoExecute;

  bool requireApproval;

  bool isEnabled;

  int maxRetries;

  int cooldownPeriod;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [RemediationPolicy]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RemediationPolicy copyWith({
    int? id,
    String? name,
    String? event,
    int? serviceId,
    int? playbookId,
    bool? autoExecute,
    bool? requireApproval,
    bool? isEnabled,
    int? maxRetries,
    int? cooldownPeriod,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RemediationPolicy',
      if (id != null) 'id': id,
      'name': name,
      'event': event,
      if (serviceId != null) 'serviceId': serviceId,
      'playbookId': playbookId,
      'autoExecute': autoExecute,
      'requireApproval': requireApproval,
      'isEnabled': isEnabled,
      'maxRetries': maxRetries,
      'cooldownPeriod': cooldownPeriod,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RemediationPolicyImpl extends RemediationPolicy {
  _RemediationPolicyImpl({
    int? id,
    required String name,
    required String event,
    int? serviceId,
    required int playbookId,
    bool? autoExecute,
    bool? requireApproval,
    bool? isEnabled,
    int? maxRetries,
    required int cooldownPeriod,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         name: name,
         event: event,
         serviceId: serviceId,
         playbookId: playbookId,
         autoExecute: autoExecute,
         requireApproval: requireApproval,
         isEnabled: isEnabled,
         maxRetries: maxRetries,
         cooldownPeriod: cooldownPeriod,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [RemediationPolicy]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RemediationPolicy copyWith({
    Object? id = _Undefined,
    String? name,
    String? event,
    Object? serviceId = _Undefined,
    int? playbookId,
    bool? autoExecute,
    bool? requireApproval,
    bool? isEnabled,
    int? maxRetries,
    int? cooldownPeriod,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return RemediationPolicy(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      event: event ?? this.event,
      serviceId: serviceId is int? ? serviceId : this.serviceId,
      playbookId: playbookId ?? this.playbookId,
      autoExecute: autoExecute ?? this.autoExecute,
      requireApproval: requireApproval ?? this.requireApproval,
      isEnabled: isEnabled ?? this.isEnabled,
      maxRetries: maxRetries ?? this.maxRetries,
      cooldownPeriod: cooldownPeriod ?? this.cooldownPeriod,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
