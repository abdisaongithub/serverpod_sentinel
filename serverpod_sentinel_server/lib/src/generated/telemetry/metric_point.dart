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
import '../service/health_signal.dart' as _i2;
import 'package:serverpod_sentinel_server/src/generated/protocol.dart' as _i3;

abstract class MetricPoint
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  MetricPoint._({
    this.id,
    required this.signalId,
    this.signal,
    required this.timestamp,
    required this.value,
  });

  factory MetricPoint({
    int? id,
    required int signalId,
    _i2.HealthSignal? signal,
    required DateTime timestamp,
    required double value,
  }) = _MetricPointImpl;

  factory MetricPoint.fromJson(Map<String, dynamic> jsonSerialization) {
    return MetricPoint(
      id: jsonSerialization['id'] as int?,
      signalId: jsonSerialization['signalId'] as int,
      signal: jsonSerialization['signal'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.HealthSignal>(
              jsonSerialization['signal'],
            ),
      timestamp: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      value: (jsonSerialization['value'] as num).toDouble(),
    );
  }

  static final t = MetricPointTable();

  static const db = MetricPointRepository._();

  @override
  int? id;

  int signalId;

  _i2.HealthSignal? signal;

  DateTime timestamp;

  double value;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [MetricPoint]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MetricPoint copyWith({
    int? id,
    int? signalId,
    _i2.HealthSignal? signal,
    DateTime? timestamp,
    double? value,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MetricPoint',
      if (id != null) 'id': id,
      'signalId': signalId,
      if (signal != null) 'signal': signal?.toJson(),
      'timestamp': timestamp.toJson(),
      'value': value,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MetricPoint',
      if (id != null) 'id': id,
      'signalId': signalId,
      if (signal != null) 'signal': signal?.toJsonForProtocol(),
      'timestamp': timestamp.toJson(),
      'value': value,
    };
  }

  static MetricPointInclude include({_i2.HealthSignalInclude? signal}) {
    return MetricPointInclude._(signal: signal);
  }

  static MetricPointIncludeList includeList({
    _i1.WhereExpressionBuilder<MetricPointTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MetricPointTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MetricPointTable>? orderByList,
    MetricPointInclude? include,
  }) {
    return MetricPointIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MetricPoint.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(MetricPoint.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MetricPointImpl extends MetricPoint {
  _MetricPointImpl({
    int? id,
    required int signalId,
    _i2.HealthSignal? signal,
    required DateTime timestamp,
    required double value,
  }) : super._(
         id: id,
         signalId: signalId,
         signal: signal,
         timestamp: timestamp,
         value: value,
       );

  /// Returns a shallow copy of this [MetricPoint]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MetricPoint copyWith({
    Object? id = _Undefined,
    int? signalId,
    Object? signal = _Undefined,
    DateTime? timestamp,
    double? value,
  }) {
    return MetricPoint(
      id: id is int? ? id : this.id,
      signalId: signalId ?? this.signalId,
      signal: signal is _i2.HealthSignal? ? signal : this.signal?.copyWith(),
      timestamp: timestamp ?? this.timestamp,
      value: value ?? this.value,
    );
  }
}

class MetricPointUpdateTable extends _i1.UpdateTable<MetricPointTable> {
  MetricPointUpdateTable(super.table);

  _i1.ColumnValue<int, int> signalId(int value) => _i1.ColumnValue(
    table.signalId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> timestamp(DateTime value) =>
      _i1.ColumnValue(
        table.timestamp,
        value,
      );

  _i1.ColumnValue<double, double> value(double value) => _i1.ColumnValue(
    table.value,
    value,
  );
}

class MetricPointTable extends _i1.Table<int?> {
  MetricPointTable({super.tableRelation}) : super(tableName: 'metric_point') {
    updateTable = MetricPointUpdateTable(this);
    signalId = _i1.ColumnInt(
      'signalId',
      this,
    );
    timestamp = _i1.ColumnDateTime(
      'timestamp',
      this,
    );
    value = _i1.ColumnDouble(
      'value',
      this,
    );
  }

  late final MetricPointUpdateTable updateTable;

  late final _i1.ColumnInt signalId;

  _i2.HealthSignalTable? _signal;

  late final _i1.ColumnDateTime timestamp;

  late final _i1.ColumnDouble value;

  _i2.HealthSignalTable get signal {
    if (_signal != null) return _signal!;
    _signal = _i1.createRelationTable(
      relationFieldName: 'signal',
      field: MetricPoint.t.signalId,
      foreignField: _i2.HealthSignal.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.HealthSignalTable(tableRelation: foreignTableRelation),
    );
    return _signal!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    signalId,
    timestamp,
    value,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'signal') {
      return signal;
    }
    return null;
  }
}

class MetricPointInclude extends _i1.IncludeObject {
  MetricPointInclude._({_i2.HealthSignalInclude? signal}) {
    _signal = signal;
  }

  _i2.HealthSignalInclude? _signal;

  @override
  Map<String, _i1.Include?> get includes => {'signal': _signal};

  @override
  _i1.Table<int?> get table => MetricPoint.t;
}

class MetricPointIncludeList extends _i1.IncludeList {
  MetricPointIncludeList._({
    _i1.WhereExpressionBuilder<MetricPointTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MetricPoint.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => MetricPoint.t;
}

class MetricPointRepository {
  const MetricPointRepository._();

  final attachRow = const MetricPointAttachRowRepository._();

  /// Returns a list of [MetricPoint]s matching the given query parameters.
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
  Future<List<MetricPoint>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MetricPointTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MetricPointTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MetricPointTable>? orderByList,
    _i1.Transaction? transaction,
    MetricPointInclude? include,
  }) async {
    return session.db.find<MetricPoint>(
      where: where?.call(MetricPoint.t),
      orderBy: orderBy?.call(MetricPoint.t),
      orderByList: orderByList?.call(MetricPoint.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [MetricPoint] matching the given query parameters.
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
  Future<MetricPoint?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MetricPointTable>? where,
    int? offset,
    _i1.OrderByBuilder<MetricPointTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MetricPointTable>? orderByList,
    _i1.Transaction? transaction,
    MetricPointInclude? include,
  }) async {
    return session.db.findFirstRow<MetricPoint>(
      where: where?.call(MetricPoint.t),
      orderBy: orderBy?.call(MetricPoint.t),
      orderByList: orderByList?.call(MetricPoint.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [MetricPoint] by its [id] or null if no such row exists.
  Future<MetricPoint?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    MetricPointInclude? include,
  }) async {
    return session.db.findById<MetricPoint>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [MetricPoint]s in the list and returns the inserted rows.
  ///
  /// The returned [MetricPoint]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<MetricPoint>> insert(
    _i1.Session session,
    List<MetricPoint> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<MetricPoint>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [MetricPoint] and returns the inserted row.
  ///
  /// The returned [MetricPoint] will have its `id` field set.
  Future<MetricPoint> insertRow(
    _i1.Session session,
    MetricPoint row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<MetricPoint>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [MetricPoint]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<MetricPoint>> update(
    _i1.Session session,
    List<MetricPoint> rows, {
    _i1.ColumnSelections<MetricPointTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<MetricPoint>(
      rows,
      columns: columns?.call(MetricPoint.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MetricPoint]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<MetricPoint> updateRow(
    _i1.Session session,
    MetricPoint row, {
    _i1.ColumnSelections<MetricPointTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<MetricPoint>(
      row,
      columns: columns?.call(MetricPoint.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MetricPoint] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<MetricPoint?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<MetricPointUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<MetricPoint>(
      id,
      columnValues: columnValues(MetricPoint.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [MetricPoint]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<MetricPoint>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<MetricPointUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<MetricPointTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MetricPointTable>? orderBy,
    _i1.OrderByListBuilder<MetricPointTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<MetricPoint>(
      columnValues: columnValues(MetricPoint.t.updateTable),
      where: where(MetricPoint.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MetricPoint.t),
      orderByList: orderByList?.call(MetricPoint.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [MetricPoint]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<MetricPoint>> delete(
    _i1.Session session,
    List<MetricPoint> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MetricPoint>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [MetricPoint].
  Future<MetricPoint> deleteRow(
    _i1.Session session,
    MetricPoint row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MetricPoint>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<MetricPoint>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MetricPointTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<MetricPoint>(
      where: where(MetricPoint.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MetricPointTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MetricPoint>(
      where: where?.call(MetricPoint.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class MetricPointAttachRowRepository {
  const MetricPointAttachRowRepository._();

  /// Creates a relation between the given [MetricPoint] and [HealthSignal]
  /// by setting the [MetricPoint]'s foreign key `signalId` to refer to the [HealthSignal].
  Future<void> signal(
    _i1.Session session,
    MetricPoint metricPoint,
    _i2.HealthSignal signal, {
    _i1.Transaction? transaction,
  }) async {
    if (metricPoint.id == null) {
      throw ArgumentError.notNull('metricPoint.id');
    }
    if (signal.id == null) {
      throw ArgumentError.notNull('signal.id');
    }

    var $metricPoint = metricPoint.copyWith(signalId: signal.id);
    await session.db.updateRow<MetricPoint>(
      $metricPoint,
      columns: [MetricPoint.t.signalId],
      transaction: transaction,
    );
  }
}
