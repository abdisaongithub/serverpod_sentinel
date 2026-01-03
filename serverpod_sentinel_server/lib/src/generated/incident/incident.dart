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
import '../service/service.dart' as _i2;
import '../service/rule.dart' as _i3;
import '../enums/incident_status.dart' as _i4;
import '../enums/incident_severity.dart' as _i5;
import '../security/ops_user.dart' as _i6;
import '../incident/incident_timeline_item.dart' as _i7;
import '../automation/playbook_execution.dart' as _i8;
import 'package:serverpod_sentinel_server/src/generated/protocol.dart' as _i9;

/// Represents a service disruption or alert.
abstract class Incident
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Incident._({
    this.id,
    required this.title,
    this.summary,
    required this.serviceId,
    required this.serviceId,
    this.service,
    this.ruleId,
    required this.ruleId,
    this.rule,
    required this.status,
    required this.severity,
    this.commanderId,
    required this.commanderId,
    this.commander,
    this.timeline,
    this.executions,
    required this.startedAt,
    this.resolvedAt,
    required this.createdAt,
    required this.updatedAt,
  }) : _opsUserIncidentsOpsUserId = null,
       _serviceIncidentsServiceId = null;

  factory Incident({
    int? id,
    required String title,
    String? summary,
    required int serviceId,
    required int serviceId,
    _i2.Service? service,
    int? ruleId,
    required int ruleId,
    _i3.Rule? rule,
    required _i4.IncidentStatus status,
    required _i5.IncidentSeverity severity,
    int? commanderId,
    required int commanderId,
    _i6.OpsUser? commander,
    List<_i7.IncidentTimelineItem>? timeline,
    List<_i8.PlaybookExecution>? executions,
    required DateTime startedAt,
    DateTime? resolvedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _IncidentImpl;

  factory Incident.fromJson(Map<String, dynamic> jsonSerialization) {
    return IncidentImplicit._(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      summary: jsonSerialization['summary'] as String?,
      serviceId: jsonSerialization['serviceId'] as int,
      service: jsonSerialization['service'] == null
          ? null
          : _i9.Protocol().deserialize<_i2.Service>(
              jsonSerialization['service'],
            ),
      ruleId: jsonSerialization['ruleId'] as int,
      rule: jsonSerialization['rule'] == null
          ? null
          : _i9.Protocol().deserialize<_i3.Rule>(jsonSerialization['rule']),
      status: _i4.IncidentStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      severity: _i5.IncidentSeverity.fromJson(
        (jsonSerialization['severity'] as String),
      ),
      commanderId: jsonSerialization['commanderId'] as int,
      commander: jsonSerialization['commander'] == null
          ? null
          : _i9.Protocol().deserialize<_i6.OpsUser>(
              jsonSerialization['commander'],
            ),
      timeline: jsonSerialization['timeline'] == null
          ? null
          : _i9.Protocol().deserialize<List<_i7.IncidentTimelineItem>>(
              jsonSerialization['timeline'],
            ),
      executions: jsonSerialization['executions'] == null
          ? null
          : _i9.Protocol().deserialize<List<_i8.PlaybookExecution>>(
              jsonSerialization['executions'],
            ),
      startedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['startedAt'],
      ),
      resolvedAt: jsonSerialization['resolvedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['resolvedAt']),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
      $_opsUserIncidentsOpsUserId:
          jsonSerialization['_opsUserIncidentsOpsUserId'] as int?,
      $_serviceIncidentsServiceId:
          jsonSerialization['_serviceIncidentsServiceId'] as int?,
    );
  }

  static final t = IncidentTable();

  static const db = IncidentRepository._();

  @override
  int? id;

  String title;

  String? summary;

  int serviceId;

  int serviceId;

  _i2.Service? service;

  int? ruleId;

  int ruleId;

  _i3.Rule? rule;

  _i4.IncidentStatus status;

  _i5.IncidentSeverity severity;

  int? commanderId;

  int commanderId;

  _i6.OpsUser? commander;

  List<_i7.IncidentTimelineItem>? timeline;

  List<_i8.PlaybookExecution>? executions;

  DateTime startedAt;

  DateTime? resolvedAt;

  DateTime createdAt;

  DateTime updatedAt;

  final int? _opsUserIncidentsOpsUserId;

  final int? _serviceIncidentsServiceId;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Incident]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Incident copyWith({
    int? id,
    String? title,
    String? summary,
    int? serviceId,
    int? serviceId,
    _i2.Service? service,
    int? ruleId,
    int? ruleId,
    _i3.Rule? rule,
    _i4.IncidentStatus? status,
    _i5.IncidentSeverity? severity,
    int? commanderId,
    int? commanderId,
    _i6.OpsUser? commander,
    List<_i7.IncidentTimelineItem>? timeline,
    List<_i8.PlaybookExecution>? executions,
    DateTime? startedAt,
    DateTime? resolvedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Incident',
      if (id != null) 'id': id,
      'title': title,
      if (summary != null) 'summary': summary,
      'serviceId': serviceId,
      'serviceId': serviceId,
      if (service != null) 'service': service?.toJson(),
      if (ruleId != null) 'ruleId': ruleId,
      'ruleId': ruleId,
      if (rule != null) 'rule': rule?.toJson(),
      'status': status.toJson(),
      'severity': severity.toJson(),
      if (commanderId != null) 'commanderId': commanderId,
      'commanderId': commanderId,
      if (commander != null) 'commander': commander?.toJson(),
      if (timeline != null)
        'timeline': timeline?.toJson(valueToJson: (v) => v.toJson()),
      if (executions != null)
        'executions': executions?.toJson(valueToJson: (v) => v.toJson()),
      'startedAt': startedAt.toJson(),
      if (resolvedAt != null) 'resolvedAt': resolvedAt?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (_opsUserIncidentsOpsUserId != null)
        '_opsUserIncidentsOpsUserId': _opsUserIncidentsOpsUserId,
      if (_serviceIncidentsServiceId != null)
        '_serviceIncidentsServiceId': _serviceIncidentsServiceId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Incident',
      if (id != null) 'id': id,
      'title': title,
      if (summary != null) 'summary': summary,
      'serviceId': serviceId,
      'serviceId': serviceId,
      if (service != null) 'service': service?.toJsonForProtocol(),
      if (ruleId != null) 'ruleId': ruleId,
      'ruleId': ruleId,
      if (rule != null) 'rule': rule?.toJsonForProtocol(),
      'status': status.toJson(),
      'severity': severity.toJson(),
      if (commanderId != null) 'commanderId': commanderId,
      'commanderId': commanderId,
      if (commander != null) 'commander': commander?.toJsonForProtocol(),
      if (timeline != null)
        'timeline': timeline?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (executions != null)
        'executions': executions?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      'startedAt': startedAt.toJson(),
      if (resolvedAt != null) 'resolvedAt': resolvedAt?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static IncidentInclude include({
    _i2.ServiceInclude? service,
    _i3.RuleInclude? rule,
    _i6.OpsUserInclude? commander,
    _i7.IncidentTimelineItemIncludeList? timeline,
    _i8.PlaybookExecutionIncludeList? executions,
  }) {
    return IncidentInclude._(
      service: service,
      rule: rule,
      commander: commander,
      timeline: timeline,
      executions: executions,
    );
  }

  static IncidentIncludeList includeList({
    _i1.WhereExpressionBuilder<IncidentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<IncidentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<IncidentTable>? orderByList,
    IncidentInclude? include,
  }) {
    return IncidentIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Incident.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Incident.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _IncidentImpl extends Incident {
  _IncidentImpl({
    int? id,
    required String title,
    String? summary,
    required int serviceId,
    required int serviceId,
    _i2.Service? service,
    int? ruleId,
    required int ruleId,
    _i3.Rule? rule,
    required _i4.IncidentStatus status,
    required _i5.IncidentSeverity severity,
    int? commanderId,
    required int commanderId,
    _i6.OpsUser? commander,
    List<_i7.IncidentTimelineItem>? timeline,
    List<_i8.PlaybookExecution>? executions,
    required DateTime startedAt,
    DateTime? resolvedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         title: title,
         summary: summary,
         serviceId: serviceId,
         service: service,
         ruleId: ruleId,
         rule: rule,
         status: status,
         severity: severity,
         commanderId: commanderId,
         commander: commander,
         timeline: timeline,
         executions: executions,
         startedAt: startedAt,
         resolvedAt: resolvedAt,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Incident]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Incident copyWith({
    Object? id = _Undefined,
    String? title,
    Object? summary = _Undefined,
    int? serviceId,
    int? serviceId,
    Object? service = _Undefined,
    Object? ruleId = _Undefined,
    int? ruleId,
    Object? rule = _Undefined,
    _i4.IncidentStatus? status,
    _i5.IncidentSeverity? severity,
    Object? commanderId = _Undefined,
    int? commanderId,
    Object? commander = _Undefined,
    Object? timeline = _Undefined,
    Object? executions = _Undefined,
    DateTime? startedAt,
    Object? resolvedAt = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return IncidentImplicit._(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      summary: summary is String? ? summary : this.summary,
      serviceId: serviceId ?? this.serviceId,
      service: service is _i2.Service? ? service : this.service?.copyWith(),
      ruleId: ruleId ?? this.ruleId,
      rule: rule is _i3.Rule? ? rule : this.rule?.copyWith(),
      status: status ?? this.status,
      severity: severity ?? this.severity,
      commanderId: commanderId ?? this.commanderId,
      commander: commander is _i6.OpsUser?
          ? commander
          : this.commander?.copyWith(),
      timeline: timeline is List<_i7.IncidentTimelineItem>?
          ? timeline
          : this.timeline?.map((e0) => e0.copyWith()).toList(),
      executions: executions is List<_i8.PlaybookExecution>?
          ? executions
          : this.executions?.map((e0) => e0.copyWith()).toList(),
      startedAt: startedAt ?? this.startedAt,
      resolvedAt: resolvedAt is DateTime? ? resolvedAt : this.resolvedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      $_opsUserIncidentsOpsUserId: this._opsUserIncidentsOpsUserId,
      $_serviceIncidentsServiceId: this._serviceIncidentsServiceId,
    );
  }
}

class IncidentImplicit extends _IncidentImpl {
  IncidentImplicit._({
    int? id,
    required String title,
    String? summary,
    required int serviceId,
    required int serviceId,
    _i2.Service? service,
    int? ruleId,
    required int ruleId,
    _i3.Rule? rule,
    required _i4.IncidentStatus status,
    required _i5.IncidentSeverity severity,
    int? commanderId,
    required int commanderId,
    _i6.OpsUser? commander,
    List<_i7.IncidentTimelineItem>? timeline,
    List<_i8.PlaybookExecution>? executions,
    required DateTime startedAt,
    DateTime? resolvedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? $_opsUserIncidentsOpsUserId,
    int? $_serviceIncidentsServiceId,
  }) : _opsUserIncidentsOpsUserId = $_opsUserIncidentsOpsUserId,
       _serviceIncidentsServiceId = $_serviceIncidentsServiceId,
       super(
         id: id,
         title: title,
         summary: summary,
         serviceId: serviceId,
         service: service,
         ruleId: ruleId,
         rule: rule,
         status: status,
         severity: severity,
         commanderId: commanderId,
         commander: commander,
         timeline: timeline,
         executions: executions,
         startedAt: startedAt,
         resolvedAt: resolvedAt,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  factory IncidentImplicit(
    Incident incident, {
    int? $_opsUserIncidentsOpsUserId,
    int? $_serviceIncidentsServiceId,
  }) {
    return IncidentImplicit._(
      id: incident.id,
      title: incident.title,
      summary: incident.summary,
      serviceId: incident.serviceId,
      service: incident.service,
      ruleId: incident.ruleId,
      rule: incident.rule,
      status: incident.status,
      severity: incident.severity,
      commanderId: incident.commanderId,
      commander: incident.commander,
      timeline: incident.timeline,
      executions: incident.executions,
      startedAt: incident.startedAt,
      resolvedAt: incident.resolvedAt,
      createdAt: incident.createdAt,
      updatedAt: incident.updatedAt,
      $_opsUserIncidentsOpsUserId: $_opsUserIncidentsOpsUserId,
      $_serviceIncidentsServiceId: $_serviceIncidentsServiceId,
    );
  }

  @override
  final int? _opsUserIncidentsOpsUserId;

  @override
  final int? _serviceIncidentsServiceId;
}

class IncidentUpdateTable extends _i1.UpdateTable<IncidentTable> {
  IncidentUpdateTable(super.table);

  _i1.ColumnValue<String, String> title(String value) => _i1.ColumnValue(
    table.title,
    value,
  );

  _i1.ColumnValue<String, String> summary(String? value) => _i1.ColumnValue(
    table.summary,
    value,
  );

  _i1.ColumnValue<int, int> serviceId(int value) => _i1.ColumnValue(
    table.serviceId,
    value,
  );

  _i1.ColumnValue<int, int> serviceId(int value) => _i1.ColumnValue(
    table.serviceId,
    value,
  );

  _i1.ColumnValue<int, int> ruleId(int? value) => _i1.ColumnValue(
    table.ruleId,
    value,
  );

  _i1.ColumnValue<int, int> ruleId(int value) => _i1.ColumnValue(
    table.ruleId,
    value,
  );

  _i1.ColumnValue<_i4.IncidentStatus, _i4.IncidentStatus> status(
    _i4.IncidentStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<_i5.IncidentSeverity, _i5.IncidentSeverity> severity(
    _i5.IncidentSeverity value,
  ) => _i1.ColumnValue(
    table.severity,
    value,
  );

  _i1.ColumnValue<int, int> commanderId(int? value) => _i1.ColumnValue(
    table.commanderId,
    value,
  );

  _i1.ColumnValue<int, int> commanderId(int value) => _i1.ColumnValue(
    table.commanderId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> startedAt(DateTime value) =>
      _i1.ColumnValue(
        table.startedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> resolvedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.resolvedAt,
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

  _i1.ColumnValue<int, int> $_opsUserIncidentsOpsUserId(int? value) =>
      _i1.ColumnValue(
        table.$_opsUserIncidentsOpsUserId,
        value,
      );

  _i1.ColumnValue<int, int> $_serviceIncidentsServiceId(int? value) =>
      _i1.ColumnValue(
        table.$_serviceIncidentsServiceId,
        value,
      );
}

class IncidentTable extends _i1.Table<int?> {
  IncidentTable({super.tableRelation}) : super(tableName: 'incident') {
    updateTable = IncidentUpdateTable(this);
    title = _i1.ColumnString(
      'title',
      this,
    );
    summary = _i1.ColumnString(
      'summary',
      this,
    );
    serviceId = _i1.ColumnInt(
      'serviceId',
      this,
    );
    serviceId = _i1.ColumnInt(
      'serviceId',
      this,
    );
    ruleId = _i1.ColumnInt(
      'ruleId',
      this,
    );
    ruleId = _i1.ColumnInt(
      'ruleId',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
    );
    severity = _i1.ColumnEnum(
      'severity',
      this,
      _i1.EnumSerialization.byName,
    );
    commanderId = _i1.ColumnInt(
      'commanderId',
      this,
    );
    commanderId = _i1.ColumnInt(
      'commanderId',
      this,
    );
    startedAt = _i1.ColumnDateTime(
      'startedAt',
      this,
    );
    resolvedAt = _i1.ColumnDateTime(
      'resolvedAt',
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
    $_opsUserIncidentsOpsUserId = _i1.ColumnInt(
      '_opsUserIncidentsOpsUserId',
      this,
    );
    $_serviceIncidentsServiceId = _i1.ColumnInt(
      '_serviceIncidentsServiceId',
      this,
    );
  }

  late final IncidentUpdateTable updateTable;

  late final _i1.ColumnString title;

  late final _i1.ColumnString summary;

  late final _i1.ColumnInt serviceId;

  late final _i1.ColumnInt serviceId;

  _i2.ServiceTable? _service;

  late final _i1.ColumnInt ruleId;

  late final _i1.ColumnInt ruleId;

  _i3.RuleTable? _rule;

  late final _i1.ColumnEnum<_i4.IncidentStatus> status;

  late final _i1.ColumnEnum<_i5.IncidentSeverity> severity;

  late final _i1.ColumnInt commanderId;

  late final _i1.ColumnInt commanderId;

  _i6.OpsUserTable? _commander;

  _i7.IncidentTimelineItemTable? ___timeline;

  _i1.ManyRelation<_i7.IncidentTimelineItemTable>? _timeline;

  _i8.PlaybookExecutionTable? ___executions;

  _i1.ManyRelation<_i8.PlaybookExecutionTable>? _executions;

  late final _i1.ColumnDateTime startedAt;

  late final _i1.ColumnDateTime resolvedAt;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnInt $_opsUserIncidentsOpsUserId;

  late final _i1.ColumnInt $_serviceIncidentsServiceId;

  _i2.ServiceTable get service {
    if (_service != null) return _service!;
    _service = _i1.createRelationTable(
      relationFieldName: 'service',
      field: Incident.t.serviceId,
      foreignField: _i2.Service.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ServiceTable(tableRelation: foreignTableRelation),
    );
    return _service!;
  }

  _i3.RuleTable get rule {
    if (_rule != null) return _rule!;
    _rule = _i1.createRelationTable(
      relationFieldName: 'rule',
      field: Incident.t.ruleId,
      foreignField: _i3.Rule.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.RuleTable(tableRelation: foreignTableRelation),
    );
    return _rule!;
  }

  _i6.OpsUserTable get commander {
    if (_commander != null) return _commander!;
    _commander = _i1.createRelationTable(
      relationFieldName: 'commander',
      field: Incident.t.commanderId,
      foreignField: _i6.OpsUser.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.OpsUserTable(tableRelation: foreignTableRelation),
    );
    return _commander!;
  }

  _i7.IncidentTimelineItemTable get __timeline {
    if (___timeline != null) return ___timeline!;
    ___timeline = _i1.createRelationTable(
      relationFieldName: '__timeline',
      field: Incident.t.id,
      foreignField: _i7.IncidentTimelineItem.t.$_incidentTimelineIncidentId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i7.IncidentTimelineItemTable(tableRelation: foreignTableRelation),
    );
    return ___timeline!;
  }

  _i8.PlaybookExecutionTable get __executions {
    if (___executions != null) return ___executions!;
    ___executions = _i1.createRelationTable(
      relationFieldName: '__executions',
      field: Incident.t.id,
      foreignField: _i8.PlaybookExecution.t.$_incidentExecutionsIncidentId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i8.PlaybookExecutionTable(tableRelation: foreignTableRelation),
    );
    return ___executions!;
  }

  _i1.ManyRelation<_i7.IncidentTimelineItemTable> get timeline {
    if (_timeline != null) return _timeline!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'timeline',
      field: Incident.t.id,
      foreignField: _i7.IncidentTimelineItem.t.$_incidentTimelineIncidentId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i7.IncidentTimelineItemTable(tableRelation: foreignTableRelation),
    );
    _timeline = _i1.ManyRelation<_i7.IncidentTimelineItemTable>(
      tableWithRelations: relationTable,
      table: _i7.IncidentTimelineItemTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _timeline!;
  }

  _i1.ManyRelation<_i8.PlaybookExecutionTable> get executions {
    if (_executions != null) return _executions!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'executions',
      field: Incident.t.id,
      foreignField: _i8.PlaybookExecution.t.$_incidentExecutionsIncidentId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i8.PlaybookExecutionTable(tableRelation: foreignTableRelation),
    );
    _executions = _i1.ManyRelation<_i8.PlaybookExecutionTable>(
      tableWithRelations: relationTable,
      table: _i8.PlaybookExecutionTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _executions!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    title,
    summary,
    serviceId,
    serviceId,
    ruleId,
    ruleId,
    status,
    severity,
    commanderId,
    commanderId,
    startedAt,
    resolvedAt,
    createdAt,
    updatedAt,
    $_opsUserIncidentsOpsUserId,
    $_serviceIncidentsServiceId,
  ];

  @override
  List<_i1.Column> get managedColumns => [
    id,
    title,
    summary,
    serviceId,
    serviceId,
    ruleId,
    ruleId,
    status,
    severity,
    commanderId,
    commanderId,
    startedAt,
    resolvedAt,
    createdAt,
    updatedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'service') {
      return service;
    }
    if (relationField == 'rule') {
      return rule;
    }
    if (relationField == 'commander') {
      return commander;
    }
    if (relationField == 'timeline') {
      return __timeline;
    }
    if (relationField == 'executions') {
      return __executions;
    }
    return null;
  }
}

class IncidentInclude extends _i1.IncludeObject {
  IncidentInclude._({
    _i2.ServiceInclude? service,
    _i3.RuleInclude? rule,
    _i6.OpsUserInclude? commander,
    _i7.IncidentTimelineItemIncludeList? timeline,
    _i8.PlaybookExecutionIncludeList? executions,
  }) {
    _service = service;
    _rule = rule;
    _commander = commander;
    _timeline = timeline;
    _executions = executions;
  }

  _i2.ServiceInclude? _service;

  _i3.RuleInclude? _rule;

  _i6.OpsUserInclude? _commander;

  _i7.IncidentTimelineItemIncludeList? _timeline;

  _i8.PlaybookExecutionIncludeList? _executions;

  @override
  Map<String, _i1.Include?> get includes => {
    'service': _service,
    'rule': _rule,
    'commander': _commander,
    'timeline': _timeline,
    'executions': _executions,
  };

  @override
  _i1.Table<int?> get table => Incident.t;
}

class IncidentIncludeList extends _i1.IncludeList {
  IncidentIncludeList._({
    _i1.WhereExpressionBuilder<IncidentTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Incident.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Incident.t;
}

class IncidentRepository {
  const IncidentRepository._();

  final attach = const IncidentAttachRepository._();

  final attachRow = const IncidentAttachRowRepository._();

  final detach = const IncidentDetachRepository._();

  final detachRow = const IncidentDetachRowRepository._();

  /// Returns a list of [Incident]s matching the given query parameters.
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
  Future<List<Incident>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<IncidentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<IncidentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<IncidentTable>? orderByList,
    _i1.Transaction? transaction,
    IncidentInclude? include,
  }) async {
    return session.db.find<Incident>(
      where: where?.call(Incident.t),
      orderBy: orderBy?.call(Incident.t),
      orderByList: orderByList?.call(Incident.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Incident] matching the given query parameters.
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
  Future<Incident?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<IncidentTable>? where,
    int? offset,
    _i1.OrderByBuilder<IncidentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<IncidentTable>? orderByList,
    _i1.Transaction? transaction,
    IncidentInclude? include,
  }) async {
    return session.db.findFirstRow<Incident>(
      where: where?.call(Incident.t),
      orderBy: orderBy?.call(Incident.t),
      orderByList: orderByList?.call(Incident.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Incident] by its [id] or null if no such row exists.
  Future<Incident?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    IncidentInclude? include,
  }) async {
    return session.db.findById<Incident>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Incident]s in the list and returns the inserted rows.
  ///
  /// The returned [Incident]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Incident>> insert(
    _i1.Session session,
    List<Incident> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Incident>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Incident] and returns the inserted row.
  ///
  /// The returned [Incident] will have its `id` field set.
  Future<Incident> insertRow(
    _i1.Session session,
    Incident row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Incident>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Incident]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Incident>> update(
    _i1.Session session,
    List<Incident> rows, {
    _i1.ColumnSelections<IncidentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Incident>(
      rows,
      columns: columns?.call(Incident.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Incident]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Incident> updateRow(
    _i1.Session session,
    Incident row, {
    _i1.ColumnSelections<IncidentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Incident>(
      row,
      columns: columns?.call(Incident.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Incident] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Incident?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<IncidentUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Incident>(
      id,
      columnValues: columnValues(Incident.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Incident]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Incident>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<IncidentUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<IncidentTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<IncidentTable>? orderBy,
    _i1.OrderByListBuilder<IncidentTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Incident>(
      columnValues: columnValues(Incident.t.updateTable),
      where: where(Incident.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Incident.t),
      orderByList: orderByList?.call(Incident.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Incident]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Incident>> delete(
    _i1.Session session,
    List<Incident> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Incident>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Incident].
  Future<Incident> deleteRow(
    _i1.Session session,
    Incident row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Incident>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Incident>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<IncidentTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Incident>(
      where: where(Incident.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<IncidentTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Incident>(
      where: where?.call(Incident.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class IncidentAttachRepository {
  const IncidentAttachRepository._();

  /// Creates a relation between this [Incident] and the given [IncidentTimelineItem]s
  /// by setting each [IncidentTimelineItem]'s foreign key `_incidentTimelineIncidentId` to refer to this [Incident].
  Future<void> timeline(
    _i1.Session session,
    Incident incident,
    List<_i7.IncidentTimelineItem> incidentTimelineItem, {
    _i1.Transaction? transaction,
  }) async {
    if (incidentTimelineItem.any((e) => e.id == null)) {
      throw ArgumentError.notNull('incidentTimelineItem.id');
    }
    if (incident.id == null) {
      throw ArgumentError.notNull('incident.id');
    }

    var $incidentTimelineItem = incidentTimelineItem
        .map(
          (e) => _i7.IncidentTimelineItemImplicit(
            e,
            $_incidentTimelineIncidentId: incident.id,
          ),
        )
        .toList();
    await session.db.update<_i7.IncidentTimelineItem>(
      $incidentTimelineItem,
      columns: [_i7.IncidentTimelineItem.t.$_incidentTimelineIncidentId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Incident] and the given [PlaybookExecution]s
  /// by setting each [PlaybookExecution]'s foreign key `_incidentExecutionsIncidentId` to refer to this [Incident].
  Future<void> executions(
    _i1.Session session,
    Incident incident,
    List<_i8.PlaybookExecution> playbookExecution, {
    _i1.Transaction? transaction,
  }) async {
    if (playbookExecution.any((e) => e.id == null)) {
      throw ArgumentError.notNull('playbookExecution.id');
    }
    if (incident.id == null) {
      throw ArgumentError.notNull('incident.id');
    }

    var $playbookExecution = playbookExecution
        .map(
          (e) => _i8.PlaybookExecutionImplicit(
            e,
            $_incidentExecutionsIncidentId: incident.id,
          ),
        )
        .toList();
    await session.db.update<_i8.PlaybookExecution>(
      $playbookExecution,
      columns: [_i8.PlaybookExecution.t.$_incidentExecutionsIncidentId],
      transaction: transaction,
    );
  }
}

class IncidentAttachRowRepository {
  const IncidentAttachRowRepository._();

  /// Creates a relation between the given [Incident] and [Service]
  /// by setting the [Incident]'s foreign key `serviceId` to refer to the [Service].
  Future<void> service(
    _i1.Session session,
    Incident incident,
    _i2.Service service, {
    _i1.Transaction? transaction,
  }) async {
    if (incident.id == null) {
      throw ArgumentError.notNull('incident.id');
    }
    if (service.id == null) {
      throw ArgumentError.notNull('service.id');
    }

    var $incident = incident.copyWith(serviceId: service.id);
    await session.db.updateRow<Incident>(
      $incident,
      columns: [Incident.t.serviceId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Incident] and [Rule]
  /// by setting the [Incident]'s foreign key `ruleId` to refer to the [Rule].
  Future<void> rule(
    _i1.Session session,
    Incident incident,
    _i3.Rule rule, {
    _i1.Transaction? transaction,
  }) async {
    if (incident.id == null) {
      throw ArgumentError.notNull('incident.id');
    }
    if (rule.id == null) {
      throw ArgumentError.notNull('rule.id');
    }

    var $incident = incident.copyWith(ruleId: rule.id);
    await session.db.updateRow<Incident>(
      $incident,
      columns: [Incident.t.ruleId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Incident] and [OpsUser]
  /// by setting the [Incident]'s foreign key `commanderId` to refer to the [OpsUser].
  Future<void> commander(
    _i1.Session session,
    Incident incident,
    _i6.OpsUser commander, {
    _i1.Transaction? transaction,
  }) async {
    if (incident.id == null) {
      throw ArgumentError.notNull('incident.id');
    }
    if (commander.id == null) {
      throw ArgumentError.notNull('commander.id');
    }

    var $incident = incident.copyWith(commanderId: commander.id);
    await session.db.updateRow<Incident>(
      $incident,
      columns: [Incident.t.commanderId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Incident] and the given [IncidentTimelineItem]
  /// by setting the [IncidentTimelineItem]'s foreign key `_incidentTimelineIncidentId` to refer to this [Incident].
  Future<void> timeline(
    _i1.Session session,
    Incident incident,
    _i7.IncidentTimelineItem incidentTimelineItem, {
    _i1.Transaction? transaction,
  }) async {
    if (incidentTimelineItem.id == null) {
      throw ArgumentError.notNull('incidentTimelineItem.id');
    }
    if (incident.id == null) {
      throw ArgumentError.notNull('incident.id');
    }

    var $incidentTimelineItem = _i7.IncidentTimelineItemImplicit(
      incidentTimelineItem,
      $_incidentTimelineIncidentId: incident.id,
    );
    await session.db.updateRow<_i7.IncidentTimelineItem>(
      $incidentTimelineItem,
      columns: [_i7.IncidentTimelineItem.t.$_incidentTimelineIncidentId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Incident] and the given [PlaybookExecution]
  /// by setting the [PlaybookExecution]'s foreign key `_incidentExecutionsIncidentId` to refer to this [Incident].
  Future<void> executions(
    _i1.Session session,
    Incident incident,
    _i8.PlaybookExecution playbookExecution, {
    _i1.Transaction? transaction,
  }) async {
    if (playbookExecution.id == null) {
      throw ArgumentError.notNull('playbookExecution.id');
    }
    if (incident.id == null) {
      throw ArgumentError.notNull('incident.id');
    }

    var $playbookExecution = _i8.PlaybookExecutionImplicit(
      playbookExecution,
      $_incidentExecutionsIncidentId: incident.id,
    );
    await session.db.updateRow<_i8.PlaybookExecution>(
      $playbookExecution,
      columns: [_i8.PlaybookExecution.t.$_incidentExecutionsIncidentId],
      transaction: transaction,
    );
  }
}

class IncidentDetachRepository {
  const IncidentDetachRepository._();

  /// Detaches the relation between this [Incident] and the given [IncidentTimelineItem]
  /// by setting the [IncidentTimelineItem]'s foreign key `_incidentTimelineIncidentId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> timeline(
    _i1.Session session,
    List<_i7.IncidentTimelineItem> incidentTimelineItem, {
    _i1.Transaction? transaction,
  }) async {
    if (incidentTimelineItem.any((e) => e.id == null)) {
      throw ArgumentError.notNull('incidentTimelineItem.id');
    }

    var $incidentTimelineItem = incidentTimelineItem
        .map(
          (e) => _i7.IncidentTimelineItemImplicit(
            e,
            $_incidentTimelineIncidentId: null,
          ),
        )
        .toList();
    await session.db.update<_i7.IncidentTimelineItem>(
      $incidentTimelineItem,
      columns: [_i7.IncidentTimelineItem.t.$_incidentTimelineIncidentId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Incident] and the given [PlaybookExecution]
  /// by setting the [PlaybookExecution]'s foreign key `_incidentExecutionsIncidentId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> executions(
    _i1.Session session,
    List<_i8.PlaybookExecution> playbookExecution, {
    _i1.Transaction? transaction,
  }) async {
    if (playbookExecution.any((e) => e.id == null)) {
      throw ArgumentError.notNull('playbookExecution.id');
    }

    var $playbookExecution = playbookExecution
        .map(
          (e) => _i8.PlaybookExecutionImplicit(
            e,
            $_incidentExecutionsIncidentId: null,
          ),
        )
        .toList();
    await session.db.update<_i8.PlaybookExecution>(
      $playbookExecution,
      columns: [_i8.PlaybookExecution.t.$_incidentExecutionsIncidentId],
      transaction: transaction,
    );
  }
}

class IncidentDetachRowRepository {
  const IncidentDetachRowRepository._();

  /// Detaches the relation between this [Incident] and the given [IncidentTimelineItem]
  /// by setting the [IncidentTimelineItem]'s foreign key `_incidentTimelineIncidentId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> timeline(
    _i1.Session session,
    _i7.IncidentTimelineItem incidentTimelineItem, {
    _i1.Transaction? transaction,
  }) async {
    if (incidentTimelineItem.id == null) {
      throw ArgumentError.notNull('incidentTimelineItem.id');
    }

    var $incidentTimelineItem = _i7.IncidentTimelineItemImplicit(
      incidentTimelineItem,
      $_incidentTimelineIncidentId: null,
    );
    await session.db.updateRow<_i7.IncidentTimelineItem>(
      $incidentTimelineItem,
      columns: [_i7.IncidentTimelineItem.t.$_incidentTimelineIncidentId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Incident] and the given [PlaybookExecution]
  /// by setting the [PlaybookExecution]'s foreign key `_incidentExecutionsIncidentId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> executions(
    _i1.Session session,
    _i8.PlaybookExecution playbookExecution, {
    _i1.Transaction? transaction,
  }) async {
    if (playbookExecution.id == null) {
      throw ArgumentError.notNull('playbookExecution.id');
    }

    var $playbookExecution = _i8.PlaybookExecutionImplicit(
      playbookExecution,
      $_incidentExecutionsIncidentId: null,
    );
    await session.db.updateRow<_i8.PlaybookExecution>(
      $playbookExecution,
      columns: [_i8.PlaybookExecution.t.$_incidentExecutionsIncidentId],
      transaction: transaction,
    );
  }
}
