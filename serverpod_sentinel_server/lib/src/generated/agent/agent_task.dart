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
import '../agent/agent_task_status.dart' as _i2;
import 'package:serverpod_sentinel_server/src/generated/protocol.dart' as _i3;

/// Model for agent-specific monitoring tasks and playbooks.
abstract class AgentTask
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  AgentTask._({
    this.id,
    required this.serviceId,
    required this.command,
    this.arguments,
    required this.timestamp,
    required this.timeoutSeconds,
    required this.status,
    this.output,
    this.exitCode,
  });

  factory AgentTask({
    int? id,
    required int serviceId,
    required String command,
    List<String>? arguments,
    required DateTime timestamp,
    required int timeoutSeconds,
    required _i2.AgentTaskStatus status,
    String? output,
    int? exitCode,
  }) = _AgentTaskImpl;

  factory AgentTask.fromJson(Map<String, dynamic> jsonSerialization) {
    return AgentTask(
      id: jsonSerialization['id'] as int?,
      serviceId: jsonSerialization['serviceId'] as int,
      command: jsonSerialization['command'] as String,
      arguments: jsonSerialization['arguments'] == null
          ? null
          : _i3.Protocol().deserialize<List<String>>(
              jsonSerialization['arguments'],
            ),
      timestamp: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      timeoutSeconds: jsonSerialization['timeoutSeconds'] as int,
      status: _i2.AgentTaskStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      output: jsonSerialization['output'] as String?,
      exitCode: jsonSerialization['exitCode'] as int?,
    );
  }

  static final t = AgentTaskTable();

  static const db = AgentTaskRepository._();

  @override
  int? id;

  int serviceId;

  String command;

  List<String>? arguments;

  DateTime timestamp;

  int timeoutSeconds;

  _i2.AgentTaskStatus status;

  String? output;

  int? exitCode;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [AgentTask]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AgentTask copyWith({
    int? id,
    int? serviceId,
    String? command,
    List<String>? arguments,
    DateTime? timestamp,
    int? timeoutSeconds,
    _i2.AgentTaskStatus? status,
    String? output,
    int? exitCode,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AgentTask',
      if (id != null) 'id': id,
      'serviceId': serviceId,
      'command': command,
      if (arguments != null) 'arguments': arguments?.toJson(),
      'timestamp': timestamp.toJson(),
      'timeoutSeconds': timeoutSeconds,
      'status': status.toJson(),
      if (output != null) 'output': output,
      if (exitCode != null) 'exitCode': exitCode,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AgentTask',
      if (id != null) 'id': id,
      'serviceId': serviceId,
      'command': command,
      if (arguments != null) 'arguments': arguments?.toJson(),
      'timestamp': timestamp.toJson(),
      'timeoutSeconds': timeoutSeconds,
      'status': status.toJson(),
      if (output != null) 'output': output,
      if (exitCode != null) 'exitCode': exitCode,
    };
  }

  static AgentTaskInclude include() {
    return AgentTaskInclude._();
  }

  static AgentTaskIncludeList includeList({
    _i1.WhereExpressionBuilder<AgentTaskTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AgentTaskTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AgentTaskTable>? orderByList,
    AgentTaskInclude? include,
  }) {
    return AgentTaskIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AgentTask.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(AgentTask.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AgentTaskImpl extends AgentTask {
  _AgentTaskImpl({
    int? id,
    required int serviceId,
    required String command,
    List<String>? arguments,
    required DateTime timestamp,
    required int timeoutSeconds,
    required _i2.AgentTaskStatus status,
    String? output,
    int? exitCode,
  }) : super._(
         id: id,
         serviceId: serviceId,
         command: command,
         arguments: arguments,
         timestamp: timestamp,
         timeoutSeconds: timeoutSeconds,
         status: status,
         output: output,
         exitCode: exitCode,
       );

  /// Returns a shallow copy of this [AgentTask]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AgentTask copyWith({
    Object? id = _Undefined,
    int? serviceId,
    String? command,
    Object? arguments = _Undefined,
    DateTime? timestamp,
    int? timeoutSeconds,
    _i2.AgentTaskStatus? status,
    Object? output = _Undefined,
    Object? exitCode = _Undefined,
  }) {
    return AgentTask(
      id: id is int? ? id : this.id,
      serviceId: serviceId ?? this.serviceId,
      command: command ?? this.command,
      arguments: arguments is List<String>?
          ? arguments
          : this.arguments?.map((e0) => e0).toList(),
      timestamp: timestamp ?? this.timestamp,
      timeoutSeconds: timeoutSeconds ?? this.timeoutSeconds,
      status: status ?? this.status,
      output: output is String? ? output : this.output,
      exitCode: exitCode is int? ? exitCode : this.exitCode,
    );
  }
}

class AgentTaskUpdateTable extends _i1.UpdateTable<AgentTaskTable> {
  AgentTaskUpdateTable(super.table);

  _i1.ColumnValue<int, int> serviceId(int value) => _i1.ColumnValue(
    table.serviceId,
    value,
  );

  _i1.ColumnValue<String, String> command(String value) => _i1.ColumnValue(
    table.command,
    value,
  );

  _i1.ColumnValue<List<String>, List<String>> arguments(List<String>? value) =>
      _i1.ColumnValue(
        table.arguments,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> timestamp(DateTime value) =>
      _i1.ColumnValue(
        table.timestamp,
        value,
      );

  _i1.ColumnValue<int, int> timeoutSeconds(int value) => _i1.ColumnValue(
    table.timeoutSeconds,
    value,
  );

  _i1.ColumnValue<_i2.AgentTaskStatus, _i2.AgentTaskStatus> status(
    _i2.AgentTaskStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<String, String> output(String? value) => _i1.ColumnValue(
    table.output,
    value,
  );

  _i1.ColumnValue<int, int> exitCode(int? value) => _i1.ColumnValue(
    table.exitCode,
    value,
  );
}

class AgentTaskTable extends _i1.Table<int?> {
  AgentTaskTable({super.tableRelation}) : super(tableName: 'agent_task') {
    updateTable = AgentTaskUpdateTable(this);
    serviceId = _i1.ColumnInt(
      'serviceId',
      this,
    );
    command = _i1.ColumnString(
      'command',
      this,
    );
    arguments = _i1.ColumnSerializable<List<String>>(
      'arguments',
      this,
    );
    timestamp = _i1.ColumnDateTime(
      'timestamp',
      this,
    );
    timeoutSeconds = _i1.ColumnInt(
      'timeoutSeconds',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
    );
    output = _i1.ColumnString(
      'output',
      this,
    );
    exitCode = _i1.ColumnInt(
      'exitCode',
      this,
    );
  }

  late final AgentTaskUpdateTable updateTable;

  late final _i1.ColumnInt serviceId;

  late final _i1.ColumnString command;

  late final _i1.ColumnSerializable<List<String>> arguments;

  late final _i1.ColumnDateTime timestamp;

  late final _i1.ColumnInt timeoutSeconds;

  late final _i1.ColumnEnum<_i2.AgentTaskStatus> status;

  late final _i1.ColumnString output;

  late final _i1.ColumnInt exitCode;

  @override
  List<_i1.Column> get columns => [
    id,
    serviceId,
    command,
    arguments,
    timestamp,
    timeoutSeconds,
    status,
    output,
    exitCode,
  ];
}

class AgentTaskInclude extends _i1.IncludeObject {
  AgentTaskInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => AgentTask.t;
}

class AgentTaskIncludeList extends _i1.IncludeList {
  AgentTaskIncludeList._({
    _i1.WhereExpressionBuilder<AgentTaskTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AgentTask.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => AgentTask.t;
}

class AgentTaskRepository {
  const AgentTaskRepository._();

  /// Returns a list of [AgentTask]s matching the given query parameters.
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
  Future<List<AgentTask>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AgentTaskTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AgentTaskTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AgentTaskTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<AgentTask>(
      where: where?.call(AgentTask.t),
      orderBy: orderBy?.call(AgentTask.t),
      orderByList: orderByList?.call(AgentTask.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [AgentTask] matching the given query parameters.
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
  Future<AgentTask?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AgentTaskTable>? where,
    int? offset,
    _i1.OrderByBuilder<AgentTaskTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AgentTaskTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<AgentTask>(
      where: where?.call(AgentTask.t),
      orderBy: orderBy?.call(AgentTask.t),
      orderByList: orderByList?.call(AgentTask.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [AgentTask] by its [id] or null if no such row exists.
  Future<AgentTask?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<AgentTask>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [AgentTask]s in the list and returns the inserted rows.
  ///
  /// The returned [AgentTask]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<AgentTask>> insert(
    _i1.Session session,
    List<AgentTask> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<AgentTask>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [AgentTask] and returns the inserted row.
  ///
  /// The returned [AgentTask] will have its `id` field set.
  Future<AgentTask> insertRow(
    _i1.Session session,
    AgentTask row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<AgentTask>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [AgentTask]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<AgentTask>> update(
    _i1.Session session,
    List<AgentTask> rows, {
    _i1.ColumnSelections<AgentTaskTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<AgentTask>(
      rows,
      columns: columns?.call(AgentTask.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AgentTask]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<AgentTask> updateRow(
    _i1.Session session,
    AgentTask row, {
    _i1.ColumnSelections<AgentTaskTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<AgentTask>(
      row,
      columns: columns?.call(AgentTask.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AgentTask] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<AgentTask?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<AgentTaskUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<AgentTask>(
      id,
      columnValues: columnValues(AgentTask.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [AgentTask]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<AgentTask>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<AgentTaskUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<AgentTaskTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AgentTaskTable>? orderBy,
    _i1.OrderByListBuilder<AgentTaskTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<AgentTask>(
      columnValues: columnValues(AgentTask.t.updateTable),
      where: where(AgentTask.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AgentTask.t),
      orderByList: orderByList?.call(AgentTask.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [AgentTask]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<AgentTask>> delete(
    _i1.Session session,
    List<AgentTask> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<AgentTask>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [AgentTask].
  Future<AgentTask> deleteRow(
    _i1.Session session,
    AgentTask row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AgentTask>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<AgentTask>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AgentTaskTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<AgentTask>(
      where: where(AgentTask.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AgentTaskTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<AgentTask>(
      where: where?.call(AgentTask.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
