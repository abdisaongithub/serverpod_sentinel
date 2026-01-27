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

/// Scheduled Chaos Engineering experiments.
abstract class ChaosExperiment
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ChaosExperiment._({
    this.id,
    required this.name,
    this.description,
    required this.serviceId,
    required this.type,
    required this.config,
    required this.status,
    this.scheduledAt,
    this.startedAt,
    this.finishedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ChaosExperiment({
    int? id,
    required String name,
    String? description,
    required int serviceId,
    required String type,
    required String config,
    required String status,
    DateTime? scheduledAt,
    DateTime? startedAt,
    DateTime? finishedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ChaosExperimentImpl;

  factory ChaosExperiment.fromJson(Map<String, dynamic> jsonSerialization) {
    return ChaosExperiment(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      serviceId: jsonSerialization['serviceId'] as int,
      type: jsonSerialization['type'] as String,
      config: jsonSerialization['config'] as String,
      status: jsonSerialization['status'] as String,
      scheduledAt: jsonSerialization['scheduledAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['scheduledAt'],
            ),
      startedAt: jsonSerialization['startedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['startedAt']),
      finishedAt: jsonSerialization['finishedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['finishedAt']),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  static final t = ChaosExperimentTable();

  static const db = ChaosExperimentRepository._();

  @override
  int? id;

  String name;

  String? description;

  int serviceId;

  String type;

  String config;

  String status;

  DateTime? scheduledAt;

  DateTime? startedAt;

  DateTime? finishedAt;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ChaosExperiment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ChaosExperiment copyWith({
    int? id,
    String? name,
    String? description,
    int? serviceId,
    String? type,
    String? config,
    String? status,
    DateTime? scheduledAt,
    DateTime? startedAt,
    DateTime? finishedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ChaosExperiment',
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'serviceId': serviceId,
      'type': type,
      'config': config,
      'status': status,
      if (scheduledAt != null) 'scheduledAt': scheduledAt?.toJson(),
      if (startedAt != null) 'startedAt': startedAt?.toJson(),
      if (finishedAt != null) 'finishedAt': finishedAt?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ChaosExperiment',
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'serviceId': serviceId,
      'type': type,
      'config': config,
      'status': status,
      if (scheduledAt != null) 'scheduledAt': scheduledAt?.toJson(),
      if (startedAt != null) 'startedAt': startedAt?.toJson(),
      if (finishedAt != null) 'finishedAt': finishedAt?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static ChaosExperimentInclude include() {
    return ChaosExperimentInclude._();
  }

  static ChaosExperimentIncludeList includeList({
    _i1.WhereExpressionBuilder<ChaosExperimentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ChaosExperimentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChaosExperimentTable>? orderByList,
    ChaosExperimentInclude? include,
  }) {
    return ChaosExperimentIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ChaosExperiment.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ChaosExperiment.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ChaosExperimentImpl extends ChaosExperiment {
  _ChaosExperimentImpl({
    int? id,
    required String name,
    String? description,
    required int serviceId,
    required String type,
    required String config,
    required String status,
    DateTime? scheduledAt,
    DateTime? startedAt,
    DateTime? finishedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         name: name,
         description: description,
         serviceId: serviceId,
         type: type,
         config: config,
         status: status,
         scheduledAt: scheduledAt,
         startedAt: startedAt,
         finishedAt: finishedAt,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [ChaosExperiment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ChaosExperiment copyWith({
    Object? id = _Undefined,
    String? name,
    Object? description = _Undefined,
    int? serviceId,
    String? type,
    String? config,
    String? status,
    Object? scheduledAt = _Undefined,
    Object? startedAt = _Undefined,
    Object? finishedAt = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ChaosExperiment(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      serviceId: serviceId ?? this.serviceId,
      type: type ?? this.type,
      config: config ?? this.config,
      status: status ?? this.status,
      scheduledAt: scheduledAt is DateTime? ? scheduledAt : this.scheduledAt,
      startedAt: startedAt is DateTime? ? startedAt : this.startedAt,
      finishedAt: finishedAt is DateTime? ? finishedAt : this.finishedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class ChaosExperimentUpdateTable extends _i1.UpdateTable<ChaosExperimentTable> {
  ChaosExperimentUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> description(String? value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<int, int> serviceId(int value) => _i1.ColumnValue(
    table.serviceId,
    value,
  );

  _i1.ColumnValue<String, String> type(String value) => _i1.ColumnValue(
    table.type,
    value,
  );

  _i1.ColumnValue<String, String> config(String value) => _i1.ColumnValue(
    table.config,
    value,
  );

  _i1.ColumnValue<String, String> status(String value) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> scheduledAt(DateTime? value) =>
      _i1.ColumnValue(
        table.scheduledAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> startedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.startedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> finishedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.finishedAt,
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

class ChaosExperimentTable extends _i1.Table<int?> {
  ChaosExperimentTable({super.tableRelation})
    : super(tableName: 'chaos_experiment') {
    updateTable = ChaosExperimentUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    serviceId = _i1.ColumnInt(
      'serviceId',
      this,
    );
    type = _i1.ColumnString(
      'type',
      this,
    );
    config = _i1.ColumnString(
      'config',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    scheduledAt = _i1.ColumnDateTime(
      'scheduledAt',
      this,
    );
    startedAt = _i1.ColumnDateTime(
      'startedAt',
      this,
    );
    finishedAt = _i1.ColumnDateTime(
      'finishedAt',
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

  late final ChaosExperimentUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnInt serviceId;

  late final _i1.ColumnString type;

  late final _i1.ColumnString config;

  late final _i1.ColumnString status;

  late final _i1.ColumnDateTime scheduledAt;

  late final _i1.ColumnDateTime startedAt;

  late final _i1.ColumnDateTime finishedAt;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    description,
    serviceId,
    type,
    config,
    status,
    scheduledAt,
    startedAt,
    finishedAt,
    createdAt,
    updatedAt,
  ];
}

class ChaosExperimentInclude extends _i1.IncludeObject {
  ChaosExperimentInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => ChaosExperiment.t;
}

class ChaosExperimentIncludeList extends _i1.IncludeList {
  ChaosExperimentIncludeList._({
    _i1.WhereExpressionBuilder<ChaosExperimentTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ChaosExperiment.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ChaosExperiment.t;
}

class ChaosExperimentRepository {
  const ChaosExperimentRepository._();

  /// Returns a list of [ChaosExperiment]s matching the given query parameters.
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
  Future<List<ChaosExperiment>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ChaosExperimentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ChaosExperimentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChaosExperimentTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ChaosExperiment>(
      where: where?.call(ChaosExperiment.t),
      orderBy: orderBy?.call(ChaosExperiment.t),
      orderByList: orderByList?.call(ChaosExperiment.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [ChaosExperiment] matching the given query parameters.
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
  Future<ChaosExperiment?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ChaosExperimentTable>? where,
    int? offset,
    _i1.OrderByBuilder<ChaosExperimentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChaosExperimentTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<ChaosExperiment>(
      where: where?.call(ChaosExperiment.t),
      orderBy: orderBy?.call(ChaosExperiment.t),
      orderByList: orderByList?.call(ChaosExperiment.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [ChaosExperiment] by its [id] or null if no such row exists.
  Future<ChaosExperiment?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<ChaosExperiment>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [ChaosExperiment]s in the list and returns the inserted rows.
  ///
  /// The returned [ChaosExperiment]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ChaosExperiment>> insert(
    _i1.Session session,
    List<ChaosExperiment> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ChaosExperiment>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ChaosExperiment] and returns the inserted row.
  ///
  /// The returned [ChaosExperiment] will have its `id` field set.
  Future<ChaosExperiment> insertRow(
    _i1.Session session,
    ChaosExperiment row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ChaosExperiment>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ChaosExperiment]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ChaosExperiment>> update(
    _i1.Session session,
    List<ChaosExperiment> rows, {
    _i1.ColumnSelections<ChaosExperimentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ChaosExperiment>(
      rows,
      columns: columns?.call(ChaosExperiment.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ChaosExperiment]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ChaosExperiment> updateRow(
    _i1.Session session,
    ChaosExperiment row, {
    _i1.ColumnSelections<ChaosExperimentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ChaosExperiment>(
      row,
      columns: columns?.call(ChaosExperiment.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ChaosExperiment] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ChaosExperiment?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<ChaosExperimentUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ChaosExperiment>(
      id,
      columnValues: columnValues(ChaosExperiment.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ChaosExperiment]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ChaosExperiment>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ChaosExperimentUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<ChaosExperimentTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ChaosExperimentTable>? orderBy,
    _i1.OrderByListBuilder<ChaosExperimentTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ChaosExperiment>(
      columnValues: columnValues(ChaosExperiment.t.updateTable),
      where: where(ChaosExperiment.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ChaosExperiment.t),
      orderByList: orderByList?.call(ChaosExperiment.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ChaosExperiment]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ChaosExperiment>> delete(
    _i1.Session session,
    List<ChaosExperiment> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ChaosExperiment>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ChaosExperiment].
  Future<ChaosExperiment> deleteRow(
    _i1.Session session,
    ChaosExperiment row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ChaosExperiment>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ChaosExperiment>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ChaosExperimentTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ChaosExperiment>(
      where: where(ChaosExperiment.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ChaosExperimentTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ChaosExperiment>(
      where: where?.call(ChaosExperiment.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
