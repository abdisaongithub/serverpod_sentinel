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
import '../service/health_signal.dart' as _i3;
import '../enums/incident_severity.dart' as _i4;
import 'package:serverpod_sentinel_server/src/generated/protocol.dart' as _i5;

/// Logic definition for triggering incidents based on signal values.
abstract class Rule implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Rule._({
    this.id,
    required this.serviceId,
    required this.serviceId,
    this.service,
    required this.signalId,
    required this.signalId,
    this.signal,
    required this.name,
    required this.condition,
    required this.durationSeconds,
    required this.severity,
    required this.enabled,
    required this.createdAt,
    required this.updatedAt,
  }) : _serviceRulesServiceId = null;

  factory Rule({
    int? id,
    required int serviceId,
    required int serviceId,
    _i2.Service? service,
    required int signalId,
    required int signalId,
    _i3.HealthSignal? signal,
    required String name,
    required String condition,
    required int durationSeconds,
    required _i4.IncidentSeverity severity,
    required bool enabled,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _RuleImpl;

  factory Rule.fromJson(Map<String, dynamic> jsonSerialization) {
    return RuleImplicit._(
      id: jsonSerialization['id'] as int?,
      serviceId: jsonSerialization['serviceId'] as int,
      service: jsonSerialization['service'] == null
          ? null
          : _i5.Protocol().deserialize<_i2.Service>(
              jsonSerialization['service'],
            ),
      signalId: jsonSerialization['signalId'] as int,
      signal: jsonSerialization['signal'] == null
          ? null
          : _i5.Protocol().deserialize<_i3.HealthSignal>(
              jsonSerialization['signal'],
            ),
      name: jsonSerialization['name'] as String,
      condition: jsonSerialization['condition'] as String,
      durationSeconds: jsonSerialization['durationSeconds'] as int,
      severity: _i4.IncidentSeverity.fromJson(
        (jsonSerialization['severity'] as String),
      ),
      enabled: jsonSerialization['enabled'] as bool,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
      $_serviceRulesServiceId:
          jsonSerialization['_serviceRulesServiceId'] as int?,
    );
  }

  static final t = RuleTable();

  static const db = RuleRepository._();

  @override
  int? id;

  int serviceId;

  int serviceId;

  _i2.Service? service;

  int signalId;

  int signalId;

  _i3.HealthSignal? signal;

  String name;

  String condition;

  int durationSeconds;

  _i4.IncidentSeverity severity;

  bool enabled;

  DateTime createdAt;

  DateTime updatedAt;

  final int? _serviceRulesServiceId;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Rule]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Rule copyWith({
    int? id,
    int? serviceId,
    int? serviceId,
    _i2.Service? service,
    int? signalId,
    int? signalId,
    _i3.HealthSignal? signal,
    String? name,
    String? condition,
    int? durationSeconds,
    _i4.IncidentSeverity? severity,
    bool? enabled,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Rule',
      if (id != null) 'id': id,
      'serviceId': serviceId,
      'serviceId': serviceId,
      if (service != null) 'service': service?.toJson(),
      'signalId': signalId,
      'signalId': signalId,
      if (signal != null) 'signal': signal?.toJson(),
      'name': name,
      'condition': condition,
      'durationSeconds': durationSeconds,
      'severity': severity.toJson(),
      'enabled': enabled,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (_serviceRulesServiceId != null)
        '_serviceRulesServiceId': _serviceRulesServiceId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Rule',
      if (id != null) 'id': id,
      'serviceId': serviceId,
      'serviceId': serviceId,
      if (service != null) 'service': service?.toJsonForProtocol(),
      'signalId': signalId,
      'signalId': signalId,
      if (signal != null) 'signal': signal?.toJsonForProtocol(),
      'name': name,
      'condition': condition,
      'durationSeconds': durationSeconds,
      'severity': severity.toJson(),
      'enabled': enabled,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static RuleInclude include({
    _i2.ServiceInclude? service,
    _i3.HealthSignalInclude? signal,
  }) {
    return RuleInclude._(
      service: service,
      signal: signal,
    );
  }

  static RuleIncludeList includeList({
    _i1.WhereExpressionBuilder<RuleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RuleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RuleTable>? orderByList,
    RuleInclude? include,
  }) {
    return RuleIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Rule.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Rule.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RuleImpl extends Rule {
  _RuleImpl({
    int? id,
    required int serviceId,
    required int serviceId,
    _i2.Service? service,
    required int signalId,
    required int signalId,
    _i3.HealthSignal? signal,
    required String name,
    required String condition,
    required int durationSeconds,
    required _i4.IncidentSeverity severity,
    required bool enabled,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         serviceId: serviceId,
         service: service,
         signalId: signalId,
         signal: signal,
         name: name,
         condition: condition,
         durationSeconds: durationSeconds,
         severity: severity,
         enabled: enabled,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Rule]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Rule copyWith({
    Object? id = _Undefined,
    int? serviceId,
    int? serviceId,
    Object? service = _Undefined,
    int? signalId,
    int? signalId,
    Object? signal = _Undefined,
    String? name,
    String? condition,
    int? durationSeconds,
    _i4.IncidentSeverity? severity,
    bool? enabled,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return RuleImplicit._(
      id: id is int? ? id : this.id,
      serviceId: serviceId ?? this.serviceId,
      service: service is _i2.Service? ? service : this.service?.copyWith(),
      signalId: signalId ?? this.signalId,
      signal: signal is _i3.HealthSignal? ? signal : this.signal?.copyWith(),
      name: name ?? this.name,
      condition: condition ?? this.condition,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      severity: severity ?? this.severity,
      enabled: enabled ?? this.enabled,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      $_serviceRulesServiceId: this._serviceRulesServiceId,
    );
  }
}

class RuleImplicit extends _RuleImpl {
  RuleImplicit._({
    int? id,
    required int serviceId,
    required int serviceId,
    _i2.Service? service,
    required int signalId,
    required int signalId,
    _i3.HealthSignal? signal,
    required String name,
    required String condition,
    required int durationSeconds,
    required _i4.IncidentSeverity severity,
    required bool enabled,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? $_serviceRulesServiceId,
  }) : _serviceRulesServiceId = $_serviceRulesServiceId,
       super(
         id: id,
         serviceId: serviceId,
         service: service,
         signalId: signalId,
         signal: signal,
         name: name,
         condition: condition,
         durationSeconds: durationSeconds,
         severity: severity,
         enabled: enabled,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  factory RuleImplicit(
    Rule rule, {
    int? $_serviceRulesServiceId,
  }) {
    return RuleImplicit._(
      id: rule.id,
      serviceId: rule.serviceId,
      service: rule.service,
      signalId: rule.signalId,
      signal: rule.signal,
      name: rule.name,
      condition: rule.condition,
      durationSeconds: rule.durationSeconds,
      severity: rule.severity,
      enabled: rule.enabled,
      createdAt: rule.createdAt,
      updatedAt: rule.updatedAt,
      $_serviceRulesServiceId: $_serviceRulesServiceId,
    );
  }

  @override
  final int? _serviceRulesServiceId;
}

class RuleUpdateTable extends _i1.UpdateTable<RuleTable> {
  RuleUpdateTable(super.table);

  _i1.ColumnValue<int, int> serviceId(int value) => _i1.ColumnValue(
    table.serviceId,
    value,
  );

  _i1.ColumnValue<int, int> serviceId(int value) => _i1.ColumnValue(
    table.serviceId,
    value,
  );

  _i1.ColumnValue<int, int> signalId(int value) => _i1.ColumnValue(
    table.signalId,
    value,
  );

  _i1.ColumnValue<int, int> signalId(int value) => _i1.ColumnValue(
    table.signalId,
    value,
  );

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> condition(String value) => _i1.ColumnValue(
    table.condition,
    value,
  );

  _i1.ColumnValue<int, int> durationSeconds(int value) => _i1.ColumnValue(
    table.durationSeconds,
    value,
  );

  _i1.ColumnValue<_i4.IncidentSeverity, _i4.IncidentSeverity> severity(
    _i4.IncidentSeverity value,
  ) => _i1.ColumnValue(
    table.severity,
    value,
  );

  _i1.ColumnValue<bool, bool> enabled(bool value) => _i1.ColumnValue(
    table.enabled,
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

  _i1.ColumnValue<int, int> $_serviceRulesServiceId(int? value) =>
      _i1.ColumnValue(
        table.$_serviceRulesServiceId,
        value,
      );
}

class RuleTable extends _i1.Table<int?> {
  RuleTable({super.tableRelation}) : super(tableName: 'rule') {
    updateTable = RuleUpdateTable(this);
    serviceId = _i1.ColumnInt(
      'serviceId',
      this,
    );
    serviceId = _i1.ColumnInt(
      'serviceId',
      this,
    );
    signalId = _i1.ColumnInt(
      'signalId',
      this,
    );
    signalId = _i1.ColumnInt(
      'signalId',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    condition = _i1.ColumnString(
      'condition',
      this,
    );
    durationSeconds = _i1.ColumnInt(
      'durationSeconds',
      this,
    );
    severity = _i1.ColumnEnum(
      'severity',
      this,
      _i1.EnumSerialization.byName,
    );
    enabled = _i1.ColumnBool(
      'enabled',
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
    $_serviceRulesServiceId = _i1.ColumnInt(
      '_serviceRulesServiceId',
      this,
    );
  }

  late final RuleUpdateTable updateTable;

  late final _i1.ColumnInt serviceId;

  late final _i1.ColumnInt serviceId;

  _i2.ServiceTable? _service;

  late final _i1.ColumnInt signalId;

  late final _i1.ColumnInt signalId;

  _i3.HealthSignalTable? _signal;

  late final _i1.ColumnString name;

  late final _i1.ColumnString condition;

  late final _i1.ColumnInt durationSeconds;

  late final _i1.ColumnEnum<_i4.IncidentSeverity> severity;

  late final _i1.ColumnBool enabled;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnInt $_serviceRulesServiceId;

  _i2.ServiceTable get service {
    if (_service != null) return _service!;
    _service = _i1.createRelationTable(
      relationFieldName: 'service',
      field: Rule.t.serviceId,
      foreignField: _i2.Service.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ServiceTable(tableRelation: foreignTableRelation),
    );
    return _service!;
  }

  _i3.HealthSignalTable get signal {
    if (_signal != null) return _signal!;
    _signal = _i1.createRelationTable(
      relationFieldName: 'signal',
      field: Rule.t.signalId,
      foreignField: _i3.HealthSignal.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.HealthSignalTable(tableRelation: foreignTableRelation),
    );
    return _signal!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    serviceId,
    serviceId,
    signalId,
    signalId,
    name,
    condition,
    durationSeconds,
    severity,
    enabled,
    createdAt,
    updatedAt,
    $_serviceRulesServiceId,
  ];

  @override
  List<_i1.Column> get managedColumns => [
    id,
    serviceId,
    serviceId,
    signalId,
    signalId,
    name,
    condition,
    durationSeconds,
    severity,
    enabled,
    createdAt,
    updatedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'service') {
      return service;
    }
    if (relationField == 'signal') {
      return signal;
    }
    return null;
  }
}

class RuleInclude extends _i1.IncludeObject {
  RuleInclude._({
    _i2.ServiceInclude? service,
    _i3.HealthSignalInclude? signal,
  }) {
    _service = service;
    _signal = signal;
  }

  _i2.ServiceInclude? _service;

  _i3.HealthSignalInclude? _signal;

  @override
  Map<String, _i1.Include?> get includes => {
    'service': _service,
    'signal': _signal,
  };

  @override
  _i1.Table<int?> get table => Rule.t;
}

class RuleIncludeList extends _i1.IncludeList {
  RuleIncludeList._({
    _i1.WhereExpressionBuilder<RuleTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Rule.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Rule.t;
}

class RuleRepository {
  const RuleRepository._();

  final attachRow = const RuleAttachRowRepository._();

  /// Returns a list of [Rule]s matching the given query parameters.
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
  Future<List<Rule>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RuleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RuleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RuleTable>? orderByList,
    _i1.Transaction? transaction,
    RuleInclude? include,
  }) async {
    return session.db.find<Rule>(
      where: where?.call(Rule.t),
      orderBy: orderBy?.call(Rule.t),
      orderByList: orderByList?.call(Rule.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Rule] matching the given query parameters.
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
  Future<Rule?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RuleTable>? where,
    int? offset,
    _i1.OrderByBuilder<RuleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RuleTable>? orderByList,
    _i1.Transaction? transaction,
    RuleInclude? include,
  }) async {
    return session.db.findFirstRow<Rule>(
      where: where?.call(Rule.t),
      orderBy: orderBy?.call(Rule.t),
      orderByList: orderByList?.call(Rule.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Rule] by its [id] or null if no such row exists.
  Future<Rule?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    RuleInclude? include,
  }) async {
    return session.db.findById<Rule>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Rule]s in the list and returns the inserted rows.
  ///
  /// The returned [Rule]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Rule>> insert(
    _i1.Session session,
    List<Rule> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Rule>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Rule] and returns the inserted row.
  ///
  /// The returned [Rule] will have its `id` field set.
  Future<Rule> insertRow(
    _i1.Session session,
    Rule row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Rule>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Rule]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Rule>> update(
    _i1.Session session,
    List<Rule> rows, {
    _i1.ColumnSelections<RuleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Rule>(
      rows,
      columns: columns?.call(Rule.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Rule]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Rule> updateRow(
    _i1.Session session,
    Rule row, {
    _i1.ColumnSelections<RuleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Rule>(
      row,
      columns: columns?.call(Rule.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Rule] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Rule?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<RuleUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Rule>(
      id,
      columnValues: columnValues(Rule.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Rule]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Rule>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<RuleUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<RuleTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RuleTable>? orderBy,
    _i1.OrderByListBuilder<RuleTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Rule>(
      columnValues: columnValues(Rule.t.updateTable),
      where: where(Rule.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Rule.t),
      orderByList: orderByList?.call(Rule.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Rule]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Rule>> delete(
    _i1.Session session,
    List<Rule> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Rule>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Rule].
  Future<Rule> deleteRow(
    _i1.Session session,
    Rule row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Rule>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Rule>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RuleTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Rule>(
      where: where(Rule.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RuleTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Rule>(
      where: where?.call(Rule.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class RuleAttachRowRepository {
  const RuleAttachRowRepository._();

  /// Creates a relation between the given [Rule] and [Service]
  /// by setting the [Rule]'s foreign key `serviceId` to refer to the [Service].
  Future<void> service(
    _i1.Session session,
    Rule rule,
    _i2.Service service, {
    _i1.Transaction? transaction,
  }) async {
    if (rule.id == null) {
      throw ArgumentError.notNull('rule.id');
    }
    if (service.id == null) {
      throw ArgumentError.notNull('service.id');
    }

    var $rule = rule.copyWith(serviceId: service.id);
    await session.db.updateRow<Rule>(
      $rule,
      columns: [Rule.t.serviceId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Rule] and [HealthSignal]
  /// by setting the [Rule]'s foreign key `signalId` to refer to the [HealthSignal].
  Future<void> signal(
    _i1.Session session,
    Rule rule,
    _i3.HealthSignal signal, {
    _i1.Transaction? transaction,
  }) async {
    if (rule.id == null) {
      throw ArgumentError.notNull('rule.id');
    }
    if (signal.id == null) {
      throw ArgumentError.notNull('signal.id');
    }

    var $rule = rule.copyWith(signalId: signal.id);
    await session.db.updateRow<Rule>(
      $rule,
      columns: [Rule.t.signalId],
      transaction: transaction,
    );
  }
}
