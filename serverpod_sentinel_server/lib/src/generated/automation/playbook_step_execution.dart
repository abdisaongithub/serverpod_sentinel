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
import '../automation/playbook_execution.dart' as _i2;
import '../enums/execution_status.dart' as _i3;
import 'package:serverpod_sentinel_server/src/generated/protocol.dart' as _i4;

/// Tracks the execution status of a single step within a PlaybookExecution.
abstract class PlaybookStepExecution
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PlaybookStepExecution._({
    this.id,
    required this.executionId,
    required this.executionId,
    this.execution,
    required this.stepId,
    required this.status,
    required this.startedAt,
    this.completedAt,
    this.logs,
    this.output,
  });

  factory PlaybookStepExecution({
    int? id,
    required int executionId,
    required int executionId,
    _i2.PlaybookExecution? execution,
    required String stepId,
    required _i3.ExecutionStatus status,
    required DateTime startedAt,
    DateTime? completedAt,
    String? logs,
    String? output,
  }) = _PlaybookStepExecutionImpl;

  factory PlaybookStepExecution.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return PlaybookStepExecution(
      id: jsonSerialization['id'] as int?,
      executionId: jsonSerialization['executionId'] as int,
      execution: jsonSerialization['execution'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.PlaybookExecution>(
              jsonSerialization['execution'],
            ),
      stepId: jsonSerialization['stepId'] as String,
      status: _i3.ExecutionStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      startedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['startedAt'],
      ),
      completedAt: jsonSerialization['completedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['completedAt'],
            ),
      logs: jsonSerialization['logs'] as String?,
      output: jsonSerialization['output'] as String?,
    );
  }

  static final t = PlaybookStepExecutionTable();

  static const db = PlaybookStepExecutionRepository._();

  @override
  int? id;

  int executionId;

  int executionId;

  _i2.PlaybookExecution? execution;

  String stepId;

  _i3.ExecutionStatus status;

  DateTime startedAt;

  DateTime? completedAt;

  String? logs;

  String? output;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PlaybookStepExecution]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PlaybookStepExecution copyWith({
    int? id,
    int? executionId,
    int? executionId,
    _i2.PlaybookExecution? execution,
    String? stepId,
    _i3.ExecutionStatus? status,
    DateTime? startedAt,
    DateTime? completedAt,
    String? logs,
    String? output,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PlaybookStepExecution',
      if (id != null) 'id': id,
      'executionId': executionId,
      'executionId': executionId,
      if (execution != null) 'execution': execution?.toJson(),
      'stepId': stepId,
      'status': status.toJson(),
      'startedAt': startedAt.toJson(),
      if (completedAt != null) 'completedAt': completedAt?.toJson(),
      if (logs != null) 'logs': logs,
      if (output != null) 'output': output,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PlaybookStepExecution',
      if (id != null) 'id': id,
      'executionId': executionId,
      'executionId': executionId,
      if (execution != null) 'execution': execution?.toJsonForProtocol(),
      'stepId': stepId,
      'status': status.toJson(),
      'startedAt': startedAt.toJson(),
      if (completedAt != null) 'completedAt': completedAt?.toJson(),
      if (logs != null) 'logs': logs,
      if (output != null) 'output': output,
    };
  }

  static PlaybookStepExecutionInclude include({
    _i2.PlaybookExecutionInclude? execution,
  }) {
    return PlaybookStepExecutionInclude._(execution: execution);
  }

  static PlaybookStepExecutionIncludeList includeList({
    _i1.WhereExpressionBuilder<PlaybookStepExecutionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlaybookStepExecutionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlaybookStepExecutionTable>? orderByList,
    PlaybookStepExecutionInclude? include,
  }) {
    return PlaybookStepExecutionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PlaybookStepExecution.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PlaybookStepExecution.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PlaybookStepExecutionImpl extends PlaybookStepExecution {
  _PlaybookStepExecutionImpl({
    int? id,
    required int executionId,
    required int executionId,
    _i2.PlaybookExecution? execution,
    required String stepId,
    required _i3.ExecutionStatus status,
    required DateTime startedAt,
    DateTime? completedAt,
    String? logs,
    String? output,
  }) : super._(
         id: id,
         executionId: executionId,
         execution: execution,
         stepId: stepId,
         status: status,
         startedAt: startedAt,
         completedAt: completedAt,
         logs: logs,
         output: output,
       );

  /// Returns a shallow copy of this [PlaybookStepExecution]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PlaybookStepExecution copyWith({
    Object? id = _Undefined,
    int? executionId,
    int? executionId,
    Object? execution = _Undefined,
    String? stepId,
    _i3.ExecutionStatus? status,
    DateTime? startedAt,
    Object? completedAt = _Undefined,
    Object? logs = _Undefined,
    Object? output = _Undefined,
  }) {
    return PlaybookStepExecution(
      id: id is int? ? id : this.id,
      executionId: executionId ?? this.executionId,
      execution: execution is _i2.PlaybookExecution?
          ? execution
          : this.execution?.copyWith(),
      stepId: stepId ?? this.stepId,
      status: status ?? this.status,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt is DateTime? ? completedAt : this.completedAt,
      logs: logs is String? ? logs : this.logs,
      output: output is String? ? output : this.output,
    );
  }
}

class PlaybookStepExecutionUpdateTable
    extends _i1.UpdateTable<PlaybookStepExecutionTable> {
  PlaybookStepExecutionUpdateTable(super.table);

  _i1.ColumnValue<int, int> executionId(int value) => _i1.ColumnValue(
    table.executionId,
    value,
  );

  _i1.ColumnValue<int, int> executionId(int value) => _i1.ColumnValue(
    table.executionId,
    value,
  );

  _i1.ColumnValue<String, String> stepId(String value) => _i1.ColumnValue(
    table.stepId,
    value,
  );

  _i1.ColumnValue<_i3.ExecutionStatus, _i3.ExecutionStatus> status(
    _i3.ExecutionStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> startedAt(DateTime value) =>
      _i1.ColumnValue(
        table.startedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> completedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.completedAt,
        value,
      );

  _i1.ColumnValue<String, String> logs(String? value) => _i1.ColumnValue(
    table.logs,
    value,
  );

  _i1.ColumnValue<String, String> output(String? value) => _i1.ColumnValue(
    table.output,
    value,
  );
}

class PlaybookStepExecutionTable extends _i1.Table<int?> {
  PlaybookStepExecutionTable({super.tableRelation})
    : super(tableName: 'playbook_step_execution') {
    updateTable = PlaybookStepExecutionUpdateTable(this);
    executionId = _i1.ColumnInt(
      'executionId',
      this,
    );
    executionId = _i1.ColumnInt(
      'executionId',
      this,
    );
    stepId = _i1.ColumnString(
      'stepId',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
    );
    startedAt = _i1.ColumnDateTime(
      'startedAt',
      this,
    );
    completedAt = _i1.ColumnDateTime(
      'completedAt',
      this,
    );
    logs = _i1.ColumnString(
      'logs',
      this,
    );
    output = _i1.ColumnString(
      'output',
      this,
    );
  }

  late final PlaybookStepExecutionUpdateTable updateTable;

  late final _i1.ColumnInt executionId;

  late final _i1.ColumnInt executionId;

  _i2.PlaybookExecutionTable? _execution;

  late final _i1.ColumnString stepId;

  late final _i1.ColumnEnum<_i3.ExecutionStatus> status;

  late final _i1.ColumnDateTime startedAt;

  late final _i1.ColumnDateTime completedAt;

  late final _i1.ColumnString logs;

  late final _i1.ColumnString output;

  _i2.PlaybookExecutionTable get execution {
    if (_execution != null) return _execution!;
    _execution = _i1.createRelationTable(
      relationFieldName: 'execution',
      field: PlaybookStepExecution.t.executionId,
      foreignField: _i2.PlaybookExecution.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PlaybookExecutionTable(tableRelation: foreignTableRelation),
    );
    return _execution!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    executionId,
    executionId,
    stepId,
    status,
    startedAt,
    completedAt,
    logs,
    output,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'execution') {
      return execution;
    }
    return null;
  }
}

class PlaybookStepExecutionInclude extends _i1.IncludeObject {
  PlaybookStepExecutionInclude._({_i2.PlaybookExecutionInclude? execution}) {
    _execution = execution;
  }

  _i2.PlaybookExecutionInclude? _execution;

  @override
  Map<String, _i1.Include?> get includes => {'execution': _execution};

  @override
  _i1.Table<int?> get table => PlaybookStepExecution.t;
}

class PlaybookStepExecutionIncludeList extends _i1.IncludeList {
  PlaybookStepExecutionIncludeList._({
    _i1.WhereExpressionBuilder<PlaybookStepExecutionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PlaybookStepExecution.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PlaybookStepExecution.t;
}

class PlaybookStepExecutionRepository {
  const PlaybookStepExecutionRepository._();

  final attachRow = const PlaybookStepExecutionAttachRowRepository._();

  /// Returns a list of [PlaybookStepExecution]s matching the given query parameters.
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
  Future<List<PlaybookStepExecution>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlaybookStepExecutionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlaybookStepExecutionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlaybookStepExecutionTable>? orderByList,
    _i1.Transaction? transaction,
    PlaybookStepExecutionInclude? include,
  }) async {
    return session.db.find<PlaybookStepExecution>(
      where: where?.call(PlaybookStepExecution.t),
      orderBy: orderBy?.call(PlaybookStepExecution.t),
      orderByList: orderByList?.call(PlaybookStepExecution.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PlaybookStepExecution] matching the given query parameters.
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
  Future<PlaybookStepExecution?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlaybookStepExecutionTable>? where,
    int? offset,
    _i1.OrderByBuilder<PlaybookStepExecutionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlaybookStepExecutionTable>? orderByList,
    _i1.Transaction? transaction,
    PlaybookStepExecutionInclude? include,
  }) async {
    return session.db.findFirstRow<PlaybookStepExecution>(
      where: where?.call(PlaybookStepExecution.t),
      orderBy: orderBy?.call(PlaybookStepExecution.t),
      orderByList: orderByList?.call(PlaybookStepExecution.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PlaybookStepExecution] by its [id] or null if no such row exists.
  Future<PlaybookStepExecution?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PlaybookStepExecutionInclude? include,
  }) async {
    return session.db.findById<PlaybookStepExecution>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PlaybookStepExecution]s in the list and returns the inserted rows.
  ///
  /// The returned [PlaybookStepExecution]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PlaybookStepExecution>> insert(
    _i1.Session session,
    List<PlaybookStepExecution> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PlaybookStepExecution>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PlaybookStepExecution] and returns the inserted row.
  ///
  /// The returned [PlaybookStepExecution] will have its `id` field set.
  Future<PlaybookStepExecution> insertRow(
    _i1.Session session,
    PlaybookStepExecution row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PlaybookStepExecution>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PlaybookStepExecution]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PlaybookStepExecution>> update(
    _i1.Session session,
    List<PlaybookStepExecution> rows, {
    _i1.ColumnSelections<PlaybookStepExecutionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PlaybookStepExecution>(
      rows,
      columns: columns?.call(PlaybookStepExecution.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PlaybookStepExecution]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PlaybookStepExecution> updateRow(
    _i1.Session session,
    PlaybookStepExecution row, {
    _i1.ColumnSelections<PlaybookStepExecutionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PlaybookStepExecution>(
      row,
      columns: columns?.call(PlaybookStepExecution.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PlaybookStepExecution] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<PlaybookStepExecution?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<PlaybookStepExecutionUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<PlaybookStepExecution>(
      id,
      columnValues: columnValues(PlaybookStepExecution.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [PlaybookStepExecution]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<PlaybookStepExecution>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<PlaybookStepExecutionUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<PlaybookStepExecutionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlaybookStepExecutionTable>? orderBy,
    _i1.OrderByListBuilder<PlaybookStepExecutionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<PlaybookStepExecution>(
      columnValues: columnValues(PlaybookStepExecution.t.updateTable),
      where: where(PlaybookStepExecution.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PlaybookStepExecution.t),
      orderByList: orderByList?.call(PlaybookStepExecution.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [PlaybookStepExecution]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PlaybookStepExecution>> delete(
    _i1.Session session,
    List<PlaybookStepExecution> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PlaybookStepExecution>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PlaybookStepExecution].
  Future<PlaybookStepExecution> deleteRow(
    _i1.Session session,
    PlaybookStepExecution row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PlaybookStepExecution>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PlaybookStepExecution>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PlaybookStepExecutionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PlaybookStepExecution>(
      where: where(PlaybookStepExecution.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlaybookStepExecutionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PlaybookStepExecution>(
      where: where?.call(PlaybookStepExecution.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PlaybookStepExecutionAttachRowRepository {
  const PlaybookStepExecutionAttachRowRepository._();

  /// Creates a relation between the given [PlaybookStepExecution] and [PlaybookExecution]
  /// by setting the [PlaybookStepExecution]'s foreign key `executionId` to refer to the [PlaybookExecution].
  Future<void> execution(
    _i1.Session session,
    PlaybookStepExecution playbookStepExecution,
    _i2.PlaybookExecution execution, {
    _i1.Transaction? transaction,
  }) async {
    if (playbookStepExecution.id == null) {
      throw ArgumentError.notNull('playbookStepExecution.id');
    }
    if (execution.id == null) {
      throw ArgumentError.notNull('execution.id');
    }

    var $playbookStepExecution = playbookStepExecution.copyWith(
      executionId: execution.id,
    );
    await session.db.updateRow<PlaybookStepExecution>(
      $playbookStepExecution,
      columns: [PlaybookStepExecution.t.executionId],
      transaction: transaction,
    );
  }
}
