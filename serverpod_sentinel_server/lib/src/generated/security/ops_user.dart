/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../security/user_role.dart' as _i2;
import '../service/service.dart' as _i3;
import '../incident/incident.dart' as _i4;
import '../incident/incident_timeline_item.dart' as _i5;
import '../automation/playbook_execution.dart' as _i6;
import '../security/audit_log.dart' as _i7;
import 'package:serverpod_sentinel_server/src/generated/protocol.dart' as _i8;

/// A system operator or administrator.
abstract class OpsUser
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  OpsUser._({
    this.id,
    required this.userInfoId,
    this.roles,
    this.services,
    this.incidents,
    this.timelineItems,
    this.playbookExecutions,
    this.auditLogs,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OpsUser({
    int? id,
    required int userInfoId,
    List<_i2.UserRole>? roles,
    List<_i3.Service>? services,
    List<_i4.Incident>? incidents,
    List<_i5.IncidentTimelineItem>? timelineItems,
    List<_i6.PlaybookExecution>? playbookExecutions,
    List<_i7.AuditLog>? auditLogs,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _OpsUserImpl;

  factory OpsUser.fromJson(Map<String, dynamic> jsonSerialization) {
    return OpsUser(
      id: jsonSerialization['id'] as int?,
      userInfoId: jsonSerialization['userInfoId'] as int,
      roles: jsonSerialization['roles'] == null
          ? null
          : _i8.Protocol().deserialize<List<_i2.UserRole>>(
              jsonSerialization['roles'],
            ),
      services: jsonSerialization['services'] == null
          ? null
          : _i8.Protocol().deserialize<List<_i3.Service>>(
              jsonSerialization['services'],
            ),
      incidents: jsonSerialization['incidents'] == null
          ? null
          : _i8.Protocol().deserialize<List<_i4.Incident>>(
              jsonSerialization['incidents'],
            ),
      timelineItems: jsonSerialization['timelineItems'] == null
          ? null
          : _i8.Protocol().deserialize<List<_i5.IncidentTimelineItem>>(
              jsonSerialization['timelineItems'],
            ),
      playbookExecutions: jsonSerialization['playbookExecutions'] == null
          ? null
          : _i8.Protocol().deserialize<List<_i6.PlaybookExecution>>(
              jsonSerialization['playbookExecutions'],
            ),
      auditLogs: jsonSerialization['auditLogs'] == null
          ? null
          : _i8.Protocol().deserialize<List<_i7.AuditLog>>(
              jsonSerialization['auditLogs'],
            ),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  static final t = OpsUserTable();

  static const db = OpsUserRepository._();

  @override
  int? id;

  int userInfoId;

  List<_i2.UserRole>? roles;

  List<_i3.Service>? services;

  List<_i4.Incident>? incidents;

  List<_i5.IncidentTimelineItem>? timelineItems;

  List<_i6.PlaybookExecution>? playbookExecutions;

  List<_i7.AuditLog>? auditLogs;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [OpsUser]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  OpsUser copyWith({
    int? id,
    int? userInfoId,
    List<_i2.UserRole>? roles,
    List<_i3.Service>? services,
    List<_i4.Incident>? incidents,
    List<_i5.IncidentTimelineItem>? timelineItems,
    List<_i6.PlaybookExecution>? playbookExecutions,
    List<_i7.AuditLog>? auditLogs,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'OpsUser',
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (roles != null) 'roles': roles?.toJson(valueToJson: (v) => v.toJson()),
      if (services != null)
        'services': services?.toJson(valueToJson: (v) => v.toJson()),
      if (incidents != null)
        'incidents': incidents?.toJson(valueToJson: (v) => v.toJson()),
      if (timelineItems != null)
        'timelineItems': timelineItems?.toJson(valueToJson: (v) => v.toJson()),
      if (playbookExecutions != null)
        'playbookExecutions': playbookExecutions?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (auditLogs != null)
        'auditLogs': auditLogs?.toJson(valueToJson: (v) => v.toJson()),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'OpsUser',
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (roles != null)
        'roles': roles?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (services != null)
        'services': services?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (incidents != null)
        'incidents': incidents?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (timelineItems != null)
        'timelineItems': timelineItems?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (playbookExecutions != null)
        'playbookExecutions': playbookExecutions?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (auditLogs != null)
        'auditLogs': auditLogs?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static OpsUserInclude include({
    _i2.UserRoleIncludeList? roles,
    _i3.ServiceIncludeList? services,
    _i4.IncidentIncludeList? incidents,
    _i5.IncidentTimelineItemIncludeList? timelineItems,
    _i6.PlaybookExecutionIncludeList? playbookExecutions,
    _i7.AuditLogIncludeList? auditLogs,
  }) {
    return OpsUserInclude._(
      roles: roles,
      services: services,
      incidents: incidents,
      timelineItems: timelineItems,
      playbookExecutions: playbookExecutions,
      auditLogs: auditLogs,
    );
  }

  static OpsUserIncludeList includeList({
    _i1.WhereExpressionBuilder<OpsUserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OpsUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OpsUserTable>? orderByList,
    OpsUserInclude? include,
  }) {
    return OpsUserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(OpsUser.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(OpsUser.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _OpsUserImpl extends OpsUser {
  _OpsUserImpl({
    int? id,
    required int userInfoId,
    List<_i2.UserRole>? roles,
    List<_i3.Service>? services,
    List<_i4.Incident>? incidents,
    List<_i5.IncidentTimelineItem>? timelineItems,
    List<_i6.PlaybookExecution>? playbookExecutions,
    List<_i7.AuditLog>? auditLogs,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         userInfoId: userInfoId,
         roles: roles,
         services: services,
         incidents: incidents,
         timelineItems: timelineItems,
         playbookExecutions: playbookExecutions,
         auditLogs: auditLogs,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [OpsUser]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  OpsUser copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    Object? roles = _Undefined,
    Object? services = _Undefined,
    Object? incidents = _Undefined,
    Object? timelineItems = _Undefined,
    Object? playbookExecutions = _Undefined,
    Object? auditLogs = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return OpsUser(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      roles: roles is List<_i2.UserRole>?
          ? roles
          : this.roles?.map((e0) => e0.copyWith()).toList(),
      services: services is List<_i3.Service>?
          ? services
          : this.services?.map((e0) => e0.copyWith()).toList(),
      incidents: incidents is List<_i4.Incident>?
          ? incidents
          : this.incidents?.map((e0) => e0.copyWith()).toList(),
      timelineItems: timelineItems is List<_i5.IncidentTimelineItem>?
          ? timelineItems
          : this.timelineItems?.map((e0) => e0.copyWith()).toList(),
      playbookExecutions: playbookExecutions is List<_i6.PlaybookExecution>?
          ? playbookExecutions
          : this.playbookExecutions?.map((e0) => e0.copyWith()).toList(),
      auditLogs: auditLogs is List<_i7.AuditLog>?
          ? auditLogs
          : this.auditLogs?.map((e0) => e0.copyWith()).toList(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class OpsUserUpdateTable extends _i1.UpdateTable<OpsUserTable> {
  OpsUserUpdateTable(super.table);

  _i1.ColumnValue<int, int> userInfoId(int value) => _i1.ColumnValue(
    table.userInfoId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _i1.ColumnValue(
        table.updatedAt,
        value,
      );
}

class OpsUserTable extends _i1.Table<int?> {
  OpsUserTable({super.tableRelation}) : super(tableName: 'ops_user') {
    updateTable = OpsUserUpdateTable(this);
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final OpsUserUpdateTable updateTable;

  late final _i1.ColumnInt userInfoId;

  _i2.UserRoleTable? ___roles;

  _i1.ManyRelation<_i2.UserRoleTable>? _roles;

  _i3.ServiceTable? ___services;

  _i1.ManyRelation<_i3.ServiceTable>? _services;

  _i4.IncidentTable? ___incidents;

  _i1.ManyRelation<_i4.IncidentTable>? _incidents;

  _i5.IncidentTimelineItemTable? ___timelineItems;

  _i1.ManyRelation<_i5.IncidentTimelineItemTable>? _timelineItems;

  _i6.PlaybookExecutionTable? ___playbookExecutions;

  _i1.ManyRelation<_i6.PlaybookExecutionTable>? _playbookExecutions;

  _i7.AuditLogTable? ___auditLogs;

  _i1.ManyRelation<_i7.AuditLogTable>? _auditLogs;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.UserRoleTable get __roles {
    if (___roles != null) return ___roles!;
    ___roles = _i1.createRelationTable(
      relationFieldName: '__roles',
      field: OpsUser.t.id,
      foreignField: _i2.UserRole.t.$_opsUserRolesOpsUserId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserRoleTable(tableRelation: foreignTableRelation),
    );
    return ___roles!;
  }

  _i3.ServiceTable get __services {
    if (___services != null) return ___services!;
    ___services = _i1.createRelationTable(
      relationFieldName: '__services',
      field: OpsUser.t.id,
      foreignField: _i3.Service.t.$_opsUserServicesOpsUserId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ServiceTable(tableRelation: foreignTableRelation),
    );
    return ___services!;
  }

  _i4.IncidentTable get __incidents {
    if (___incidents != null) return ___incidents!;
    ___incidents = _i1.createRelationTable(
      relationFieldName: '__incidents',
      field: OpsUser.t.id,
      foreignField: _i4.Incident.t.$_opsUserIncidentsOpsUserId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.IncidentTable(tableRelation: foreignTableRelation),
    );
    return ___incidents!;
  }

  _i5.IncidentTimelineItemTable get __timelineItems {
    if (___timelineItems != null) return ___timelineItems!;
    ___timelineItems = _i1.createRelationTable(
      relationFieldName: '__timelineItems',
      field: OpsUser.t.id,
      foreignField: _i5.IncidentTimelineItem.t.$_opsUserTimelineitemsOpsUserId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.IncidentTimelineItemTable(tableRelation: foreignTableRelation),
    );
    return ___timelineItems!;
  }

  _i6.PlaybookExecutionTable get __playbookExecutions {
    if (___playbookExecutions != null) return ___playbookExecutions!;
    ___playbookExecutions = _i1.createRelationTable(
      relationFieldName: '__playbookExecutions',
      field: OpsUser.t.id,
      foreignField:
          _i6.PlaybookExecution.t.$_opsUserPlaybookexecutionsOpsUserId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.PlaybookExecutionTable(tableRelation: foreignTableRelation),
    );
    return ___playbookExecutions!;
  }

  _i7.AuditLogTable get __auditLogs {
    if (___auditLogs != null) return ___auditLogs!;
    ___auditLogs = _i1.createRelationTable(
      relationFieldName: '__auditLogs',
      field: OpsUser.t.id,
      foreignField: _i7.AuditLog.t.$_opsUserAuditlogsOpsUserId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i7.AuditLogTable(tableRelation: foreignTableRelation),
    );
    return ___auditLogs!;
  }

  _i1.ManyRelation<_i2.UserRoleTable> get roles {
    if (_roles != null) return _roles!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'roles',
      field: OpsUser.t.id,
      foreignField: _i2.UserRole.t.$_opsUserRolesOpsUserId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserRoleTable(tableRelation: foreignTableRelation),
    );
    _roles = _i1.ManyRelation<_i2.UserRoleTable>(
      tableWithRelations: relationTable,
      table: _i2.UserRoleTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _roles!;
  }

  _i1.ManyRelation<_i3.ServiceTable> get services {
    if (_services != null) return _services!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'services',
      field: OpsUser.t.id,
      foreignField: _i3.Service.t.$_opsUserServicesOpsUserId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ServiceTable(tableRelation: foreignTableRelation),
    );
    _services = _i1.ManyRelation<_i3.ServiceTable>(
      tableWithRelations: relationTable,
      table: _i3.ServiceTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _services!;
  }

  _i1.ManyRelation<_i4.IncidentTable> get incidents {
    if (_incidents != null) return _incidents!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'incidents',
      field: OpsUser.t.id,
      foreignField: _i4.Incident.t.$_opsUserIncidentsOpsUserId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.IncidentTable(tableRelation: foreignTableRelation),
    );
    _incidents = _i1.ManyRelation<_i4.IncidentTable>(
      tableWithRelations: relationTable,
      table: _i4.IncidentTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _incidents!;
  }

  _i1.ManyRelation<_i5.IncidentTimelineItemTable> get timelineItems {
    if (_timelineItems != null) return _timelineItems!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'timelineItems',
      field: OpsUser.t.id,
      foreignField: _i5.IncidentTimelineItem.t.$_opsUserTimelineitemsOpsUserId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.IncidentTimelineItemTable(tableRelation: foreignTableRelation),
    );
    _timelineItems = _i1.ManyRelation<_i5.IncidentTimelineItemTable>(
      tableWithRelations: relationTable,
      table: _i5.IncidentTimelineItemTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _timelineItems!;
  }

  _i1.ManyRelation<_i6.PlaybookExecutionTable> get playbookExecutions {
    if (_playbookExecutions != null) return _playbookExecutions!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'playbookExecutions',
      field: OpsUser.t.id,
      foreignField:
          _i6.PlaybookExecution.t.$_opsUserPlaybookexecutionsOpsUserId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.PlaybookExecutionTable(tableRelation: foreignTableRelation),
    );
    _playbookExecutions = _i1.ManyRelation<_i6.PlaybookExecutionTable>(
      tableWithRelations: relationTable,
      table: _i6.PlaybookExecutionTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _playbookExecutions!;
  }

  _i1.ManyRelation<_i7.AuditLogTable> get auditLogs {
    if (_auditLogs != null) return _auditLogs!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'auditLogs',
      field: OpsUser.t.id,
      foreignField: _i7.AuditLog.t.$_opsUserAuditlogsOpsUserId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i7.AuditLogTable(tableRelation: foreignTableRelation),
    );
    _auditLogs = _i1.ManyRelation<_i7.AuditLogTable>(
      tableWithRelations: relationTable,
      table: _i7.AuditLogTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _auditLogs!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    userInfoId,
    createdAt,
    updatedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'roles') {
      return __roles;
    }
    if (relationField == 'services') {
      return __services;
    }
    if (relationField == 'incidents') {
      return __incidents;
    }
    if (relationField == 'timelineItems') {
      return __timelineItems;
    }
    if (relationField == 'playbookExecutions') {
      return __playbookExecutions;
    }
    if (relationField == 'auditLogs') {
      return __auditLogs;
    }
    return null;
  }
}

class OpsUserInclude extends _i1.IncludeObject {
  OpsUserInclude._({
    _i2.UserRoleIncludeList? roles,
    _i3.ServiceIncludeList? services,
    _i4.IncidentIncludeList? incidents,
    _i5.IncidentTimelineItemIncludeList? timelineItems,
    _i6.PlaybookExecutionIncludeList? playbookExecutions,
    _i7.AuditLogIncludeList? auditLogs,
  }) {
    _roles = roles;
    _services = services;
    _incidents = incidents;
    _timelineItems = timelineItems;
    _playbookExecutions = playbookExecutions;
    _auditLogs = auditLogs;
  }

  _i2.UserRoleIncludeList? _roles;

  _i3.ServiceIncludeList? _services;

  _i4.IncidentIncludeList? _incidents;

  _i5.IncidentTimelineItemIncludeList? _timelineItems;

  _i6.PlaybookExecutionIncludeList? _playbookExecutions;

  _i7.AuditLogIncludeList? _auditLogs;

  @override
  Map<String, _i1.Include?> get includes => {
    'roles': _roles,
    'services': _services,
    'incidents': _incidents,
    'timelineItems': _timelineItems,
    'playbookExecutions': _playbookExecutions,
    'auditLogs': _auditLogs,
  };

  @override
  _i1.Table<int?> get table => OpsUser.t;
}

class OpsUserIncludeList extends _i1.IncludeList {
  OpsUserIncludeList._({
    _i1.WhereExpressionBuilder<OpsUserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(OpsUser.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => OpsUser.t;
}

class OpsUserRepository {
  const OpsUserRepository._();

  final attach = const OpsUserAttachRepository._();

  final attachRow = const OpsUserAttachRowRepository._();

  final detach = const OpsUserDetachRepository._();

  final detachRow = const OpsUserDetachRowRepository._();

  /// Returns a list of [OpsUser]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<OpsUser>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OpsUserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OpsUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OpsUserTable>? orderByList,
    _i1.Transaction? transaction,
    OpsUserInclude? include,
  }) async {
    return session.db.find<OpsUser>(
      where: where?.call(OpsUser.t),
      orderBy: orderBy?.call(OpsUser.t),
      orderByList: orderByList?.call(OpsUser.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [OpsUser] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<OpsUser?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OpsUserTable>? where,
    int? offset,
    _i1.OrderByBuilder<OpsUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OpsUserTable>? orderByList,
    _i1.Transaction? transaction,
    OpsUserInclude? include,
  }) async {
    return session.db.findFirstRow<OpsUser>(
      where: where?.call(OpsUser.t),
      orderBy: orderBy?.call(OpsUser.t),
      orderByList: orderByList?.call(OpsUser.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [OpsUser] by its [id] or null if no such row exists.
  Future<OpsUser?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    OpsUserInclude? include,
  }) async {
    return session.db.findById<OpsUser>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [OpsUser]s in the list and returns the inserted rows.
  ///
  /// The returned [OpsUser]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<OpsUser>> insert(
    _i1.Session session,
    List<OpsUser> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<OpsUser>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [OpsUser] and returns the inserted row.
  ///
  /// The returned [OpsUser] will have its `id` field set.
  Future<OpsUser> insertRow(
    _i1.Session session,
    OpsUser row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<OpsUser>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [OpsUser]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<OpsUser>> update(
    _i1.Session session,
    List<OpsUser> rows, {
    _i1.ColumnSelections<OpsUserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<OpsUser>(
      rows,
      columns: columns?.call(OpsUser.t),
      transaction: transaction,
    );
  }

  /// Updates a single [OpsUser]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<OpsUser> updateRow(
    _i1.Session session,
    OpsUser row, {
    _i1.ColumnSelections<OpsUserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<OpsUser>(
      row,
      columns: columns?.call(OpsUser.t),
      transaction: transaction,
    );
  }

  /// Updates a single [OpsUser] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<OpsUser?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<OpsUserUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<OpsUser>(
      id,
      columnValues: columnValues(OpsUser.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [OpsUser]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<OpsUser>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<OpsUserUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<OpsUserTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OpsUserTable>? orderBy,
    _i1.OrderByListBuilder<OpsUserTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<OpsUser>(
      columnValues: columnValues(OpsUser.t.updateTable),
      where: where(OpsUser.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(OpsUser.t),
      orderByList: orderByList?.call(OpsUser.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [OpsUser]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<OpsUser>> delete(
    _i1.Session session,
    List<OpsUser> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<OpsUser>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [OpsUser].
  Future<OpsUser> deleteRow(
    _i1.Session session,
    OpsUser row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<OpsUser>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<OpsUser>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<OpsUserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<OpsUser>(
      where: where(OpsUser.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OpsUserTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<OpsUser>(
      where: where?.call(OpsUser.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class OpsUserAttachRepository {
  const OpsUserAttachRepository._();

  /// Creates a relation between this [OpsUser] and the given [UserRole]s
  /// by setting each [UserRole]'s foreign key `_opsUserRolesOpsUserId` to refer to this [OpsUser].
  Future<void> roles(
    _i1.Session session,
    OpsUser opsUser,
    List<_i2.UserRole> userRole, {
    _i1.Transaction? transaction,
  }) async {
    if (userRole.any((e) => e.id == null)) {
      throw ArgumentError.notNull('userRole.id');
    }
    if (opsUser.id == null) {
      throw ArgumentError.notNull('opsUser.id');
    }

    var $userRole = userRole
        .map(
          (e) => _i2.UserRoleImplicit(
            e,
            $_opsUserRolesOpsUserId: opsUser.id,
          ),
        )
        .toList();
    await session.db.update<_i2.UserRole>(
      $userRole,
      columns: [_i2.UserRole.t.$_opsUserRolesOpsUserId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [OpsUser] and the given [Service]s
  /// by setting each [Service]'s foreign key `_opsUserServicesOpsUserId` to refer to this [OpsUser].
  Future<void> services(
    _i1.Session session,
    OpsUser opsUser,
    List<_i3.Service> service, {
    _i1.Transaction? transaction,
  }) async {
    if (service.any((e) => e.id == null)) {
      throw ArgumentError.notNull('service.id');
    }
    if (opsUser.id == null) {
      throw ArgumentError.notNull('opsUser.id');
    }

    var $service = service
        .map(
          (e) => _i3.ServiceImplicit(
            e,
            $_opsUserServicesOpsUserId: opsUser.id,
          ),
        )
        .toList();
    await session.db.update<_i3.Service>(
      $service,
      columns: [_i3.Service.t.$_opsUserServicesOpsUserId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [OpsUser] and the given [Incident]s
  /// by setting each [Incident]'s foreign key `_opsUserIncidentsOpsUserId` to refer to this [OpsUser].
  Future<void> incidents(
    _i1.Session session,
    OpsUser opsUser,
    List<_i4.Incident> incident, {
    _i1.Transaction? transaction,
  }) async {
    if (incident.any((e) => e.id == null)) {
      throw ArgumentError.notNull('incident.id');
    }
    if (opsUser.id == null) {
      throw ArgumentError.notNull('opsUser.id');
    }

    var $incident = incident
        .map(
          (e) => _i4.IncidentImplicit(
            e,
            $_opsUserIncidentsOpsUserId: opsUser.id,
          ),
        )
        .toList();
    await session.db.update<_i4.Incident>(
      $incident,
      columns: [_i4.Incident.t.$_opsUserIncidentsOpsUserId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [OpsUser] and the given [IncidentTimelineItem]s
  /// by setting each [IncidentTimelineItem]'s foreign key `_opsUserTimelineitemsOpsUserId` to refer to this [OpsUser].
  Future<void> timelineItems(
    _i1.Session session,
    OpsUser opsUser,
    List<_i5.IncidentTimelineItem> incidentTimelineItem, {
    _i1.Transaction? transaction,
  }) async {
    if (incidentTimelineItem.any((e) => e.id == null)) {
      throw ArgumentError.notNull('incidentTimelineItem.id');
    }
    if (opsUser.id == null) {
      throw ArgumentError.notNull('opsUser.id');
    }

    var $incidentTimelineItem = incidentTimelineItem
        .map(
          (e) => _i5.IncidentTimelineItemImplicit(
            e,
            $_opsUserTimelineitemsOpsUserId: opsUser.id,
          ),
        )
        .toList();
    await session.db.update<_i5.IncidentTimelineItem>(
      $incidentTimelineItem,
      columns: [_i5.IncidentTimelineItem.t.$_opsUserTimelineitemsOpsUserId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [OpsUser] and the given [PlaybookExecution]s
  /// by setting each [PlaybookExecution]'s foreign key `_opsUserPlaybookexecutionsOpsUserId` to refer to this [OpsUser].
  Future<void> playbookExecutions(
    _i1.Session session,
    OpsUser opsUser,
    List<_i6.PlaybookExecution> playbookExecution, {
    _i1.Transaction? transaction,
  }) async {
    if (playbookExecution.any((e) => e.id == null)) {
      throw ArgumentError.notNull('playbookExecution.id');
    }
    if (opsUser.id == null) {
      throw ArgumentError.notNull('opsUser.id');
    }

    var $playbookExecution = playbookExecution
        .map(
          (e) => _i6.PlaybookExecutionImplicit(
            e,
            $_opsUserPlaybookexecutionsOpsUserId: opsUser.id,
          ),
        )
        .toList();
    await session.db.update<_i6.PlaybookExecution>(
      $playbookExecution,
      columns: [_i6.PlaybookExecution.t.$_opsUserPlaybookexecutionsOpsUserId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [OpsUser] and the given [AuditLog]s
  /// by setting each [AuditLog]'s foreign key `_opsUserAuditlogsOpsUserId` to refer to this [OpsUser].
  Future<void> auditLogs(
    _i1.Session session,
    OpsUser opsUser,
    List<_i7.AuditLog> auditLog, {
    _i1.Transaction? transaction,
  }) async {
    if (auditLog.any((e) => e.id == null)) {
      throw ArgumentError.notNull('auditLog.id');
    }
    if (opsUser.id == null) {
      throw ArgumentError.notNull('opsUser.id');
    }

    var $auditLog = auditLog
        .map(
          (e) => _i7.AuditLogImplicit(
            e,
            $_opsUserAuditlogsOpsUserId: opsUser.id,
          ),
        )
        .toList();
    await session.db.update<_i7.AuditLog>(
      $auditLog,
      columns: [_i7.AuditLog.t.$_opsUserAuditlogsOpsUserId],
      transaction: transaction,
    );
  }
}

class OpsUserAttachRowRepository {
  const OpsUserAttachRowRepository._();

  /// Creates a relation between this [OpsUser] and the given [UserRole]
  /// by setting the [UserRole]'s foreign key `_opsUserRolesOpsUserId` to refer to this [OpsUser].
  Future<void> roles(
    _i1.Session session,
    OpsUser opsUser,
    _i2.UserRole userRole, {
    _i1.Transaction? transaction,
  }) async {
    if (userRole.id == null) {
      throw ArgumentError.notNull('userRole.id');
    }
    if (opsUser.id == null) {
      throw ArgumentError.notNull('opsUser.id');
    }

    var $userRole = _i2.UserRoleImplicit(
      userRole,
      $_opsUserRolesOpsUserId: opsUser.id,
    );
    await session.db.updateRow<_i2.UserRole>(
      $userRole,
      columns: [_i2.UserRole.t.$_opsUserRolesOpsUserId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [OpsUser] and the given [Service]
  /// by setting the [Service]'s foreign key `_opsUserServicesOpsUserId` to refer to this [OpsUser].
  Future<void> services(
    _i1.Session session,
    OpsUser opsUser,
    _i3.Service service, {
    _i1.Transaction? transaction,
  }) async {
    if (service.id == null) {
      throw ArgumentError.notNull('service.id');
    }
    if (opsUser.id == null) {
      throw ArgumentError.notNull('opsUser.id');
    }

    var $service = _i3.ServiceImplicit(
      service,
      $_opsUserServicesOpsUserId: opsUser.id,
    );
    await session.db.updateRow<_i3.Service>(
      $service,
      columns: [_i3.Service.t.$_opsUserServicesOpsUserId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [OpsUser] and the given [Incident]
  /// by setting the [Incident]'s foreign key `_opsUserIncidentsOpsUserId` to refer to this [OpsUser].
  Future<void> incidents(
    _i1.Session session,
    OpsUser opsUser,
    _i4.Incident incident, {
    _i1.Transaction? transaction,
  }) async {
    if (incident.id == null) {
      throw ArgumentError.notNull('incident.id');
    }
    if (opsUser.id == null) {
      throw ArgumentError.notNull('opsUser.id');
    }

    var $incident = _i4.IncidentImplicit(
      incident,
      $_opsUserIncidentsOpsUserId: opsUser.id,
    );
    await session.db.updateRow<_i4.Incident>(
      $incident,
      columns: [_i4.Incident.t.$_opsUserIncidentsOpsUserId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [OpsUser] and the given [IncidentTimelineItem]
  /// by setting the [IncidentTimelineItem]'s foreign key `_opsUserTimelineitemsOpsUserId` to refer to this [OpsUser].
  Future<void> timelineItems(
    _i1.Session session,
    OpsUser opsUser,
    _i5.IncidentTimelineItem incidentTimelineItem, {
    _i1.Transaction? transaction,
  }) async {
    if (incidentTimelineItem.id == null) {
      throw ArgumentError.notNull('incidentTimelineItem.id');
    }
    if (opsUser.id == null) {
      throw ArgumentError.notNull('opsUser.id');
    }

    var $incidentTimelineItem = _i5.IncidentTimelineItemImplicit(
      incidentTimelineItem,
      $_opsUserTimelineitemsOpsUserId: opsUser.id,
    );
    await session.db.updateRow<_i5.IncidentTimelineItem>(
      $incidentTimelineItem,
      columns: [_i5.IncidentTimelineItem.t.$_opsUserTimelineitemsOpsUserId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [OpsUser] and the given [PlaybookExecution]
  /// by setting the [PlaybookExecution]'s foreign key `_opsUserPlaybookexecutionsOpsUserId` to refer to this [OpsUser].
  Future<void> playbookExecutions(
    _i1.Session session,
    OpsUser opsUser,
    _i6.PlaybookExecution playbookExecution, {
    _i1.Transaction? transaction,
  }) async {
    if (playbookExecution.id == null) {
      throw ArgumentError.notNull('playbookExecution.id');
    }
    if (opsUser.id == null) {
      throw ArgumentError.notNull('opsUser.id');
    }

    var $playbookExecution = _i6.PlaybookExecutionImplicit(
      playbookExecution,
      $_opsUserPlaybookexecutionsOpsUserId: opsUser.id,
    );
    await session.db.updateRow<_i6.PlaybookExecution>(
      $playbookExecution,
      columns: [_i6.PlaybookExecution.t.$_opsUserPlaybookexecutionsOpsUserId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [OpsUser] and the given [AuditLog]
  /// by setting the [AuditLog]'s foreign key `_opsUserAuditlogsOpsUserId` to refer to this [OpsUser].
  Future<void> auditLogs(
    _i1.Session session,
    OpsUser opsUser,
    _i7.AuditLog auditLog, {
    _i1.Transaction? transaction,
  }) async {
    if (auditLog.id == null) {
      throw ArgumentError.notNull('auditLog.id');
    }
    if (opsUser.id == null) {
      throw ArgumentError.notNull('opsUser.id');
    }

    var $auditLog = _i7.AuditLogImplicit(
      auditLog,
      $_opsUserAuditlogsOpsUserId: opsUser.id,
    );
    await session.db.updateRow<_i7.AuditLog>(
      $auditLog,
      columns: [_i7.AuditLog.t.$_opsUserAuditlogsOpsUserId],
      transaction: transaction,
    );
  }
}

class OpsUserDetachRepository {
  const OpsUserDetachRepository._();

  /// Detaches the relation between this [OpsUser] and the given [UserRole]
  /// by setting the [UserRole]'s foreign key `_opsUserRolesOpsUserId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> roles(
    _i1.Session session,
    List<_i2.UserRole> userRole, {
    _i1.Transaction? transaction,
  }) async {
    if (userRole.any((e) => e.id == null)) {
      throw ArgumentError.notNull('userRole.id');
    }

    var $userRole = userRole
        .map(
          (e) => _i2.UserRoleImplicit(
            e,
            $_opsUserRolesOpsUserId: null,
          ),
        )
        .toList();
    await session.db.update<_i2.UserRole>(
      $userRole,
      columns: [_i2.UserRole.t.$_opsUserRolesOpsUserId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [OpsUser] and the given [Service]
  /// by setting the [Service]'s foreign key `_opsUserServicesOpsUserId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> services(
    _i1.Session session,
    List<_i3.Service> service, {
    _i1.Transaction? transaction,
  }) async {
    if (service.any((e) => e.id == null)) {
      throw ArgumentError.notNull('service.id');
    }

    var $service = service
        .map(
          (e) => _i3.ServiceImplicit(
            e,
            $_opsUserServicesOpsUserId: null,
          ),
        )
        .toList();
    await session.db.update<_i3.Service>(
      $service,
      columns: [_i3.Service.t.$_opsUserServicesOpsUserId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [OpsUser] and the given [Incident]
  /// by setting the [Incident]'s foreign key `_opsUserIncidentsOpsUserId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> incidents(
    _i1.Session session,
    List<_i4.Incident> incident, {
    _i1.Transaction? transaction,
  }) async {
    if (incident.any((e) => e.id == null)) {
      throw ArgumentError.notNull('incident.id');
    }

    var $incident = incident
        .map(
          (e) => _i4.IncidentImplicit(
            e,
            $_opsUserIncidentsOpsUserId: null,
          ),
        )
        .toList();
    await session.db.update<_i4.Incident>(
      $incident,
      columns: [_i4.Incident.t.$_opsUserIncidentsOpsUserId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [OpsUser] and the given [IncidentTimelineItem]
  /// by setting the [IncidentTimelineItem]'s foreign key `_opsUserTimelineitemsOpsUserId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> timelineItems(
    _i1.Session session,
    List<_i5.IncidentTimelineItem> incidentTimelineItem, {
    _i1.Transaction? transaction,
  }) async {
    if (incidentTimelineItem.any((e) => e.id == null)) {
      throw ArgumentError.notNull('incidentTimelineItem.id');
    }

    var $incidentTimelineItem = incidentTimelineItem
        .map(
          (e) => _i5.IncidentTimelineItemImplicit(
            e,
            $_opsUserTimelineitemsOpsUserId: null,
          ),
        )
        .toList();
    await session.db.update<_i5.IncidentTimelineItem>(
      $incidentTimelineItem,
      columns: [_i5.IncidentTimelineItem.t.$_opsUserTimelineitemsOpsUserId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [OpsUser] and the given [PlaybookExecution]
  /// by setting the [PlaybookExecution]'s foreign key `_opsUserPlaybookexecutionsOpsUserId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> playbookExecutions(
    _i1.Session session,
    List<_i6.PlaybookExecution> playbookExecution, {
    _i1.Transaction? transaction,
  }) async {
    if (playbookExecution.any((e) => e.id == null)) {
      throw ArgumentError.notNull('playbookExecution.id');
    }

    var $playbookExecution = playbookExecution
        .map(
          (e) => _i6.PlaybookExecutionImplicit(
            e,
            $_opsUserPlaybookexecutionsOpsUserId: null,
          ),
        )
        .toList();
    await session.db.update<_i6.PlaybookExecution>(
      $playbookExecution,
      columns: [_i6.PlaybookExecution.t.$_opsUserPlaybookexecutionsOpsUserId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [OpsUser] and the given [AuditLog]
  /// by setting the [AuditLog]'s foreign key `_opsUserAuditlogsOpsUserId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> auditLogs(
    _i1.Session session,
    List<_i7.AuditLog> auditLog, {
    _i1.Transaction? transaction,
  }) async {
    if (auditLog.any((e) => e.id == null)) {
      throw ArgumentError.notNull('auditLog.id');
    }

    var $auditLog = auditLog
        .map(
          (e) => _i7.AuditLogImplicit(
            e,
            $_opsUserAuditlogsOpsUserId: null,
          ),
        )
        .toList();
    await session.db.update<_i7.AuditLog>(
      $auditLog,
      columns: [_i7.AuditLog.t.$_opsUserAuditlogsOpsUserId],
      transaction: transaction,
    );
  }
}

class OpsUserDetachRowRepository {
  const OpsUserDetachRowRepository._();

  /// Detaches the relation between this [OpsUser] and the given [UserRole]
  /// by setting the [UserRole]'s foreign key `_opsUserRolesOpsUserId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> roles(
    _i1.Session session,
    _i2.UserRole userRole, {
    _i1.Transaction? transaction,
  }) async {
    if (userRole.id == null) {
      throw ArgumentError.notNull('userRole.id');
    }

    var $userRole = _i2.UserRoleImplicit(
      userRole,
      $_opsUserRolesOpsUserId: null,
    );
    await session.db.updateRow<_i2.UserRole>(
      $userRole,
      columns: [_i2.UserRole.t.$_opsUserRolesOpsUserId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [OpsUser] and the given [Service]
  /// by setting the [Service]'s foreign key `_opsUserServicesOpsUserId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> services(
    _i1.Session session,
    _i3.Service service, {
    _i1.Transaction? transaction,
  }) async {
    if (service.id == null) {
      throw ArgumentError.notNull('service.id');
    }

    var $service = _i3.ServiceImplicit(
      service,
      $_opsUserServicesOpsUserId: null,
    );
    await session.db.updateRow<_i3.Service>(
      $service,
      columns: [_i3.Service.t.$_opsUserServicesOpsUserId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [OpsUser] and the given [Incident]
  /// by setting the [Incident]'s foreign key `_opsUserIncidentsOpsUserId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> incidents(
    _i1.Session session,
    _i4.Incident incident, {
    _i1.Transaction? transaction,
  }) async {
    if (incident.id == null) {
      throw ArgumentError.notNull('incident.id');
    }

    var $incident = _i4.IncidentImplicit(
      incident,
      $_opsUserIncidentsOpsUserId: null,
    );
    await session.db.updateRow<_i4.Incident>(
      $incident,
      columns: [_i4.Incident.t.$_opsUserIncidentsOpsUserId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [OpsUser] and the given [IncidentTimelineItem]
  /// by setting the [IncidentTimelineItem]'s foreign key `_opsUserTimelineitemsOpsUserId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> timelineItems(
    _i1.Session session,
    _i5.IncidentTimelineItem incidentTimelineItem, {
    _i1.Transaction? transaction,
  }) async {
    if (incidentTimelineItem.id == null) {
      throw ArgumentError.notNull('incidentTimelineItem.id');
    }

    var $incidentTimelineItem = _i5.IncidentTimelineItemImplicit(
      incidentTimelineItem,
      $_opsUserTimelineitemsOpsUserId: null,
    );
    await session.db.updateRow<_i5.IncidentTimelineItem>(
      $incidentTimelineItem,
      columns: [_i5.IncidentTimelineItem.t.$_opsUserTimelineitemsOpsUserId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [OpsUser] and the given [PlaybookExecution]
  /// by setting the [PlaybookExecution]'s foreign key `_opsUserPlaybookexecutionsOpsUserId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> playbookExecutions(
    _i1.Session session,
    _i6.PlaybookExecution playbookExecution, {
    _i1.Transaction? transaction,
  }) async {
    if (playbookExecution.id == null) {
      throw ArgumentError.notNull('playbookExecution.id');
    }

    var $playbookExecution = _i6.PlaybookExecutionImplicit(
      playbookExecution,
      $_opsUserPlaybookexecutionsOpsUserId: null,
    );
    await session.db.updateRow<_i6.PlaybookExecution>(
      $playbookExecution,
      columns: [_i6.PlaybookExecution.t.$_opsUserPlaybookexecutionsOpsUserId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [OpsUser] and the given [AuditLog]
  /// by setting the [AuditLog]'s foreign key `_opsUserAuditlogsOpsUserId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> auditLogs(
    _i1.Session session,
    _i7.AuditLog auditLog, {
    _i1.Transaction? transaction,
  }) async {
    if (auditLog.id == null) {
      throw ArgumentError.notNull('auditLog.id');
    }

    var $auditLog = _i7.AuditLogImplicit(
      auditLog,
      $_opsUserAuditlogsOpsUserId: null,
    );
    await session.db.updateRow<_i7.AuditLog>(
      $auditLog,
      columns: [_i7.AuditLog.t.$_opsUserAuditlogsOpsUserId],
      transaction: transaction,
    );
  }
}
