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
import '../incident/incident.dart' as _i2;
import '../security/ops_user.dart' as _i3;
import 'package:serverpod_sentinel_server/src/generated/protocol.dart' as _i4;

/// Stores a generated post-mortem report for historical access.
abstract class ReportSnapshot
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ReportSnapshot._({
    this.id,
    required this.incidentId,
    required this.incidentId,
    this.incident,
    required this.generatedAt,
    this.generatedById,
    required this.generatedById,
    this.generatedBy,
    required this.content,
  });

  factory ReportSnapshot({
    int? id,
    required int incidentId,
    required int incidentId,
    _i2.Incident? incident,
    required DateTime generatedAt,
    int? generatedById,
    required int generatedById,
    _i3.OpsUser? generatedBy,
    required String content,
  }) = _ReportSnapshotImpl;

  factory ReportSnapshot.fromJson(Map<String, dynamic> jsonSerialization) {
    return ReportSnapshot(
      id: jsonSerialization['id'] as int?,
      incidentId: jsonSerialization['incidentId'] as int,
      incident: jsonSerialization['incident'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.Incident>(
              jsonSerialization['incident'],
            ),
      generatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['generatedAt'],
      ),
      generatedById: jsonSerialization['generatedById'] as int,
      generatedBy: jsonSerialization['generatedBy'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.OpsUser>(
              jsonSerialization['generatedBy'],
            ),
      content: jsonSerialization['content'] as String,
    );
  }

  static final t = ReportSnapshotTable();

  static const db = ReportSnapshotRepository._();

  @override
  int? id;

  int incidentId;

  int incidentId;

  _i2.Incident? incident;

  DateTime generatedAt;

  int? generatedById;

  int generatedById;

  _i3.OpsUser? generatedBy;

  String content;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ReportSnapshot]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ReportSnapshot copyWith({
    int? id,
    int? incidentId,
    int? incidentId,
    _i2.Incident? incident,
    DateTime? generatedAt,
    int? generatedById,
    int? generatedById,
    _i3.OpsUser? generatedBy,
    String? content,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ReportSnapshot',
      if (id != null) 'id': id,
      'incidentId': incidentId,
      'incidentId': incidentId,
      if (incident != null) 'incident': incident?.toJson(),
      'generatedAt': generatedAt.toJson(),
      if (generatedById != null) 'generatedById': generatedById,
      'generatedById': generatedById,
      if (generatedBy != null) 'generatedBy': generatedBy?.toJson(),
      'content': content,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ReportSnapshot',
      if (id != null) 'id': id,
      'incidentId': incidentId,
      'incidentId': incidentId,
      if (incident != null) 'incident': incident?.toJsonForProtocol(),
      'generatedAt': generatedAt.toJson(),
      if (generatedById != null) 'generatedById': generatedById,
      'generatedById': generatedById,
      if (generatedBy != null) 'generatedBy': generatedBy?.toJsonForProtocol(),
      'content': content,
    };
  }

  static ReportSnapshotInclude include({
    _i2.IncidentInclude? incident,
    _i3.OpsUserInclude? generatedBy,
  }) {
    return ReportSnapshotInclude._(
      incident: incident,
      generatedBy: generatedBy,
    );
  }

  static ReportSnapshotIncludeList includeList({
    _i1.WhereExpressionBuilder<ReportSnapshotTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ReportSnapshotTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ReportSnapshotTable>? orderByList,
    ReportSnapshotInclude? include,
  }) {
    return ReportSnapshotIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ReportSnapshot.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ReportSnapshot.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ReportSnapshotImpl extends ReportSnapshot {
  _ReportSnapshotImpl({
    int? id,
    required int incidentId,
    required int incidentId,
    _i2.Incident? incident,
    required DateTime generatedAt,
    int? generatedById,
    required int generatedById,
    _i3.OpsUser? generatedBy,
    required String content,
  }) : super._(
         id: id,
         incidentId: incidentId,
         incident: incident,
         generatedAt: generatedAt,
         generatedById: generatedById,
         generatedBy: generatedBy,
         content: content,
       );

  /// Returns a shallow copy of this [ReportSnapshot]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ReportSnapshot copyWith({
    Object? id = _Undefined,
    int? incidentId,
    int? incidentId,
    Object? incident = _Undefined,
    DateTime? generatedAt,
    Object? generatedById = _Undefined,
    int? generatedById,
    Object? generatedBy = _Undefined,
    String? content,
  }) {
    return ReportSnapshot(
      id: id is int? ? id : this.id,
      incidentId: incidentId ?? this.incidentId,
      incident: incident is _i2.Incident?
          ? incident
          : this.incident?.copyWith(),
      generatedAt: generatedAt ?? this.generatedAt,
      generatedById: generatedById ?? this.generatedById,
      generatedBy: generatedBy is _i3.OpsUser?
          ? generatedBy
          : this.generatedBy?.copyWith(),
      content: content ?? this.content,
    );
  }
}

class ReportSnapshotUpdateTable extends _i1.UpdateTable<ReportSnapshotTable> {
  ReportSnapshotUpdateTable(super.table);

  _i1.ColumnValue<int, int> incidentId(int value) => _i1.ColumnValue(
    table.incidentId,
    value,
  );

  _i1.ColumnValue<int, int> incidentId(int value) => _i1.ColumnValue(
    table.incidentId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> generatedAt(DateTime value) =>
      _i1.ColumnValue(
        table.generatedAt,
        value,
      );

  _i1.ColumnValue<int, int> generatedById(int? value) => _i1.ColumnValue(
    table.generatedById,
    value,
  );

  _i1.ColumnValue<int, int> generatedById(int value) => _i1.ColumnValue(
    table.generatedById,
    value,
  );

  _i1.ColumnValue<String, String> content(String value) => _i1.ColumnValue(
    table.content,
    value,
  );
}

class ReportSnapshotTable extends _i1.Table<int?> {
  ReportSnapshotTable({super.tableRelation})
    : super(tableName: 'report_snapshot') {
    updateTable = ReportSnapshotUpdateTable(this);
    incidentId = _i1.ColumnInt(
      'incidentId',
      this,
    );
    incidentId = _i1.ColumnInt(
      'incidentId',
      this,
    );
    generatedAt = _i1.ColumnDateTime(
      'generatedAt',
      this,
    );
    generatedById = _i1.ColumnInt(
      'generatedById',
      this,
    );
    generatedById = _i1.ColumnInt(
      'generatedById',
      this,
    );
    content = _i1.ColumnString(
      'content',
      this,
    );
  }

  late final ReportSnapshotUpdateTable updateTable;

  late final _i1.ColumnInt incidentId;

  late final _i1.ColumnInt incidentId;

  _i2.IncidentTable? _incident;

  late final _i1.ColumnDateTime generatedAt;

  late final _i1.ColumnInt generatedById;

  late final _i1.ColumnInt generatedById;

  _i3.OpsUserTable? _generatedBy;

  late final _i1.ColumnString content;

  _i2.IncidentTable get incident {
    if (_incident != null) return _incident!;
    _incident = _i1.createRelationTable(
      relationFieldName: 'incident',
      field: ReportSnapshot.t.incidentId,
      foreignField: _i2.Incident.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.IncidentTable(tableRelation: foreignTableRelation),
    );
    return _incident!;
  }

  _i3.OpsUserTable get generatedBy {
    if (_generatedBy != null) return _generatedBy!;
    _generatedBy = _i1.createRelationTable(
      relationFieldName: 'generatedBy',
      field: ReportSnapshot.t.generatedById,
      foreignField: _i3.OpsUser.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.OpsUserTable(tableRelation: foreignTableRelation),
    );
    return _generatedBy!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    incidentId,
    incidentId,
    generatedAt,
    generatedById,
    generatedById,
    content,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'incident') {
      return incident;
    }
    if (relationField == 'generatedBy') {
      return generatedBy;
    }
    return null;
  }
}

class ReportSnapshotInclude extends _i1.IncludeObject {
  ReportSnapshotInclude._({
    _i2.IncidentInclude? incident,
    _i3.OpsUserInclude? generatedBy,
  }) {
    _incident = incident;
    _generatedBy = generatedBy;
  }

  _i2.IncidentInclude? _incident;

  _i3.OpsUserInclude? _generatedBy;

  @override
  Map<String, _i1.Include?> get includes => {
    'incident': _incident,
    'generatedBy': _generatedBy,
  };

  @override
  _i1.Table<int?> get table => ReportSnapshot.t;
}

class ReportSnapshotIncludeList extends _i1.IncludeList {
  ReportSnapshotIncludeList._({
    _i1.WhereExpressionBuilder<ReportSnapshotTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ReportSnapshot.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ReportSnapshot.t;
}

class ReportSnapshotRepository {
  const ReportSnapshotRepository._();

  final attachRow = const ReportSnapshotAttachRowRepository._();

  /// Returns a list of [ReportSnapshot]s matching the given query parameters.
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
  Future<List<ReportSnapshot>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ReportSnapshotTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ReportSnapshotTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ReportSnapshotTable>? orderByList,
    _i1.Transaction? transaction,
    ReportSnapshotInclude? include,
  }) async {
    return session.db.find<ReportSnapshot>(
      where: where?.call(ReportSnapshot.t),
      orderBy: orderBy?.call(ReportSnapshot.t),
      orderByList: orderByList?.call(ReportSnapshot.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ReportSnapshot] matching the given query parameters.
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
  Future<ReportSnapshot?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ReportSnapshotTable>? where,
    int? offset,
    _i1.OrderByBuilder<ReportSnapshotTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ReportSnapshotTable>? orderByList,
    _i1.Transaction? transaction,
    ReportSnapshotInclude? include,
  }) async {
    return session.db.findFirstRow<ReportSnapshot>(
      where: where?.call(ReportSnapshot.t),
      orderBy: orderBy?.call(ReportSnapshot.t),
      orderByList: orderByList?.call(ReportSnapshot.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ReportSnapshot] by its [id] or null if no such row exists.
  Future<ReportSnapshot?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ReportSnapshotInclude? include,
  }) async {
    return session.db.findById<ReportSnapshot>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ReportSnapshot]s in the list and returns the inserted rows.
  ///
  /// The returned [ReportSnapshot]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ReportSnapshot>> insert(
    _i1.Session session,
    List<ReportSnapshot> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ReportSnapshot>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ReportSnapshot] and returns the inserted row.
  ///
  /// The returned [ReportSnapshot] will have its `id` field set.
  Future<ReportSnapshot> insertRow(
    _i1.Session session,
    ReportSnapshot row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ReportSnapshot>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ReportSnapshot]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ReportSnapshot>> update(
    _i1.Session session,
    List<ReportSnapshot> rows, {
    _i1.ColumnSelections<ReportSnapshotTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ReportSnapshot>(
      rows,
      columns: columns?.call(ReportSnapshot.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ReportSnapshot]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ReportSnapshot> updateRow(
    _i1.Session session,
    ReportSnapshot row, {
    _i1.ColumnSelections<ReportSnapshotTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ReportSnapshot>(
      row,
      columns: columns?.call(ReportSnapshot.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ReportSnapshot] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ReportSnapshot?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<ReportSnapshotUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ReportSnapshot>(
      id,
      columnValues: columnValues(ReportSnapshot.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ReportSnapshot]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ReportSnapshot>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ReportSnapshotUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ReportSnapshotTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ReportSnapshotTable>? orderBy,
    _i1.OrderByListBuilder<ReportSnapshotTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ReportSnapshot>(
      columnValues: columnValues(ReportSnapshot.t.updateTable),
      where: where(ReportSnapshot.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ReportSnapshot.t),
      orderByList: orderByList?.call(ReportSnapshot.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ReportSnapshot]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ReportSnapshot>> delete(
    _i1.Session session,
    List<ReportSnapshot> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ReportSnapshot>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ReportSnapshot].
  Future<ReportSnapshot> deleteRow(
    _i1.Session session,
    ReportSnapshot row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ReportSnapshot>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ReportSnapshot>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ReportSnapshotTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ReportSnapshot>(
      where: where(ReportSnapshot.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ReportSnapshotTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ReportSnapshot>(
      where: where?.call(ReportSnapshot.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ReportSnapshotAttachRowRepository {
  const ReportSnapshotAttachRowRepository._();

  /// Creates a relation between the given [ReportSnapshot] and [Incident]
  /// by setting the [ReportSnapshot]'s foreign key `incidentId` to refer to the [Incident].
  Future<void> incident(
    _i1.Session session,
    ReportSnapshot reportSnapshot,
    _i2.Incident incident, {
    _i1.Transaction? transaction,
  }) async {
    if (reportSnapshot.id == null) {
      throw ArgumentError.notNull('reportSnapshot.id');
    }
    if (incident.id == null) {
      throw ArgumentError.notNull('incident.id');
    }

    var $reportSnapshot = reportSnapshot.copyWith(incidentId: incident.id);
    await session.db.updateRow<ReportSnapshot>(
      $reportSnapshot,
      columns: [ReportSnapshot.t.incidentId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ReportSnapshot] and [OpsUser]
  /// by setting the [ReportSnapshot]'s foreign key `generatedById` to refer to the [OpsUser].
  Future<void> generatedBy(
    _i1.Session session,
    ReportSnapshot reportSnapshot,
    _i3.OpsUser generatedBy, {
    _i1.Transaction? transaction,
  }) async {
    if (reportSnapshot.id == null) {
      throw ArgumentError.notNull('reportSnapshot.id');
    }
    if (generatedBy.id == null) {
      throw ArgumentError.notNull('generatedBy.id');
    }

    var $reportSnapshot = reportSnapshot.copyWith(
      generatedById: generatedBy.id,
    );
    await session.db.updateRow<ReportSnapshot>(
      $reportSnapshot,
      columns: [ReportSnapshot.t.generatedById],
      transaction: transaction,
    );
  }
}
