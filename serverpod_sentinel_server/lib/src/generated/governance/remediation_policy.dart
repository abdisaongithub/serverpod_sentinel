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

/// Autonomous remediation policy for automated incident response.
abstract class RemediationPolicy
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = RemediationPolicyTable();

  static const db = RemediationPolicyRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static RemediationPolicyInclude include() {
    return RemediationPolicyInclude._();
  }

  static RemediationPolicyIncludeList includeList({
    _i1.WhereExpressionBuilder<RemediationPolicyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RemediationPolicyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RemediationPolicyTable>? orderByList,
    RemediationPolicyInclude? include,
  }) {
    return RemediationPolicyIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RemediationPolicy.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(RemediationPolicy.t),
      include: include,
    );
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

class RemediationPolicyUpdateTable
    extends _i1.UpdateTable<RemediationPolicyTable> {
  RemediationPolicyUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> event(String value) => _i1.ColumnValue(
    table.event,
    value,
  );

  _i1.ColumnValue<int, int> serviceId(int? value) => _i1.ColumnValue(
    table.serviceId,
    value,
  );

  _i1.ColumnValue<int, int> playbookId(int value) => _i1.ColumnValue(
    table.playbookId,
    value,
  );

  _i1.ColumnValue<bool, bool> autoExecute(bool value) => _i1.ColumnValue(
    table.autoExecute,
    value,
  );

  _i1.ColumnValue<bool, bool> requireApproval(bool value) => _i1.ColumnValue(
    table.requireApproval,
    value,
  );

  _i1.ColumnValue<bool, bool> isEnabled(bool value) => _i1.ColumnValue(
    table.isEnabled,
    value,
  );

  _i1.ColumnValue<int, int> maxRetries(int value) => _i1.ColumnValue(
    table.maxRetries,
    value,
  );

  _i1.ColumnValue<int, int> cooldownPeriod(int value) => _i1.ColumnValue(
    table.cooldownPeriod,
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

class RemediationPolicyTable extends _i1.Table<int?> {
  RemediationPolicyTable({super.tableRelation})
    : super(tableName: 'remediation_policy') {
    updateTable = RemediationPolicyUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    event = _i1.ColumnString(
      'event',
      this,
    );
    serviceId = _i1.ColumnInt(
      'serviceId',
      this,
    );
    playbookId = _i1.ColumnInt(
      'playbookId',
      this,
    );
    autoExecute = _i1.ColumnBool(
      'autoExecute',
      this,
      hasDefault: true,
    );
    requireApproval = _i1.ColumnBool(
      'requireApproval',
      this,
      hasDefault: true,
    );
    isEnabled = _i1.ColumnBool(
      'isEnabled',
      this,
      hasDefault: true,
    );
    maxRetries = _i1.ColumnInt(
      'maxRetries',
      this,
      hasDefault: true,
    );
    cooldownPeriod = _i1.ColumnInt(
      'cooldownPeriod',
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

  late final RemediationPolicyUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnString event;

  late final _i1.ColumnInt serviceId;

  late final _i1.ColumnInt playbookId;

  late final _i1.ColumnBool autoExecute;

  late final _i1.ColumnBool requireApproval;

  late final _i1.ColumnBool isEnabled;

  late final _i1.ColumnInt maxRetries;

  late final _i1.ColumnInt cooldownPeriod;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    event,
    serviceId,
    playbookId,
    autoExecute,
    requireApproval,
    isEnabled,
    maxRetries,
    cooldownPeriod,
    createdAt,
    updatedAt,
  ];
}

class RemediationPolicyInclude extends _i1.IncludeObject {
  RemediationPolicyInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => RemediationPolicy.t;
}

class RemediationPolicyIncludeList extends _i1.IncludeList {
  RemediationPolicyIncludeList._({
    _i1.WhereExpressionBuilder<RemediationPolicyTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RemediationPolicy.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => RemediationPolicy.t;
}

class RemediationPolicyRepository {
  const RemediationPolicyRepository._();

  /// Returns a list of [RemediationPolicy]s matching the given query parameters.
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
  Future<List<RemediationPolicy>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RemediationPolicyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RemediationPolicyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RemediationPolicyTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<RemediationPolicy>(
      where: where?.call(RemediationPolicy.t),
      orderBy: orderBy?.call(RemediationPolicy.t),
      orderByList: orderByList?.call(RemediationPolicy.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [RemediationPolicy] matching the given query parameters.
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
  Future<RemediationPolicy?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RemediationPolicyTable>? where,
    int? offset,
    _i1.OrderByBuilder<RemediationPolicyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RemediationPolicyTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<RemediationPolicy>(
      where: where?.call(RemediationPolicy.t),
      orderBy: orderBy?.call(RemediationPolicy.t),
      orderByList: orderByList?.call(RemediationPolicy.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [RemediationPolicy] by its [id] or null if no such row exists.
  Future<RemediationPolicy?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<RemediationPolicy>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [RemediationPolicy]s in the list and returns the inserted rows.
  ///
  /// The returned [RemediationPolicy]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<RemediationPolicy>> insert(
    _i1.Session session,
    List<RemediationPolicy> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<RemediationPolicy>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [RemediationPolicy] and returns the inserted row.
  ///
  /// The returned [RemediationPolicy] will have its `id` field set.
  Future<RemediationPolicy> insertRow(
    _i1.Session session,
    RemediationPolicy row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<RemediationPolicy>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [RemediationPolicy]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<RemediationPolicy>> update(
    _i1.Session session,
    List<RemediationPolicy> rows, {
    _i1.ColumnSelections<RemediationPolicyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<RemediationPolicy>(
      rows,
      columns: columns?.call(RemediationPolicy.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RemediationPolicy]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RemediationPolicy> updateRow(
    _i1.Session session,
    RemediationPolicy row, {
    _i1.ColumnSelections<RemediationPolicyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<RemediationPolicy>(
      row,
      columns: columns?.call(RemediationPolicy.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RemediationPolicy] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<RemediationPolicy?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<RemediationPolicyUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<RemediationPolicy>(
      id,
      columnValues: columnValues(RemediationPolicy.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [RemediationPolicy]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<RemediationPolicy>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<RemediationPolicyUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<RemediationPolicyTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RemediationPolicyTable>? orderBy,
    _i1.OrderByListBuilder<RemediationPolicyTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<RemediationPolicy>(
      columnValues: columnValues(RemediationPolicy.t.updateTable),
      where: where(RemediationPolicy.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RemediationPolicy.t),
      orderByList: orderByList?.call(RemediationPolicy.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [RemediationPolicy]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<RemediationPolicy>> delete(
    _i1.Session session,
    List<RemediationPolicy> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<RemediationPolicy>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [RemediationPolicy].
  Future<RemediationPolicy> deleteRow(
    _i1.Session session,
    RemediationPolicy row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RemediationPolicy>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<RemediationPolicy>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RemediationPolicyTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<RemediationPolicy>(
      where: where(RemediationPolicy.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RemediationPolicyTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<RemediationPolicy>(
      where: where?.call(RemediationPolicy.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
