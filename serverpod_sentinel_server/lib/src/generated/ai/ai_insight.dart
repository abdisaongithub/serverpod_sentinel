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

abstract class AiInsight
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  AiInsight._({
    this.id,
    required this.type,
    required this.title,
    required this.content,
    this.severity,
    this.serviceId,
    this.incidentId,
    required this.confidence,
    this.metadata,
    this.expiresAt,
    required this.createdAt,
  });

  factory AiInsight({
    int? id,
    required String type,
    required String title,
    required String content,
    String? severity,
    int? serviceId,
    int? incidentId,
    required double confidence,
    String? metadata,
    DateTime? expiresAt,
    required DateTime createdAt,
  }) = _AiInsightImpl;

  factory AiInsight.fromJson(Map<String, dynamic> jsonSerialization) {
    return AiInsight(
      id: jsonSerialization['id'] as int?,
      type: jsonSerialization['type'] as String,
      title: jsonSerialization['title'] as String,
      content: jsonSerialization['content'] as String,
      severity: jsonSerialization['severity'] as String?,
      serviceId: jsonSerialization['serviceId'] as int?,
      incidentId: jsonSerialization['incidentId'] as int?,
      confidence: (jsonSerialization['confidence'] as num).toDouble(),
      metadata: jsonSerialization['metadata'] as String?,
      expiresAt: jsonSerialization['expiresAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expiresAt']),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = AiInsightTable();

  static const db = AiInsightRepository._();

  @override
  int? id;

  String type;

  String title;

  String content;

  String? severity;

  int? serviceId;

  int? incidentId;

  double confidence;

  String? metadata;

  DateTime? expiresAt;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [AiInsight]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AiInsight copyWith({
    int? id,
    String? type,
    String? title,
    String? content,
    String? severity,
    int? serviceId,
    int? incidentId,
    double? confidence,
    String? metadata,
    DateTime? expiresAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AiInsight',
      if (id != null) 'id': id,
      'type': type,
      'title': title,
      'content': content,
      if (severity != null) 'severity': severity,
      if (serviceId != null) 'serviceId': serviceId,
      if (incidentId != null) 'incidentId': incidentId,
      'confidence': confidence,
      if (metadata != null) 'metadata': metadata,
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AiInsight',
      if (id != null) 'id': id,
      'type': type,
      'title': title,
      'content': content,
      if (severity != null) 'severity': severity,
      if (serviceId != null) 'serviceId': serviceId,
      if (incidentId != null) 'incidentId': incidentId,
      'confidence': confidence,
      if (metadata != null) 'metadata': metadata,
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  static AiInsightInclude include() {
    return AiInsightInclude._();
  }

  static AiInsightIncludeList includeList({
    _i1.WhereExpressionBuilder<AiInsightTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AiInsightTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AiInsightTable>? orderByList,
    AiInsightInclude? include,
  }) {
    return AiInsightIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AiInsight.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(AiInsight.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AiInsightImpl extends AiInsight {
  _AiInsightImpl({
    int? id,
    required String type,
    required String title,
    required String content,
    String? severity,
    int? serviceId,
    int? incidentId,
    required double confidence,
    String? metadata,
    DateTime? expiresAt,
    required DateTime createdAt,
  }) : super._(
         id: id,
         type: type,
         title: title,
         content: content,
         severity: severity,
         serviceId: serviceId,
         incidentId: incidentId,
         confidence: confidence,
         metadata: metadata,
         expiresAt: expiresAt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [AiInsight]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AiInsight copyWith({
    Object? id = _Undefined,
    String? type,
    String? title,
    String? content,
    Object? severity = _Undefined,
    Object? serviceId = _Undefined,
    Object? incidentId = _Undefined,
    double? confidence,
    Object? metadata = _Undefined,
    Object? expiresAt = _Undefined,
    DateTime? createdAt,
  }) {
    return AiInsight(
      id: id is int? ? id : this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      content: content ?? this.content,
      severity: severity is String? ? severity : this.severity,
      serviceId: serviceId is int? ? serviceId : this.serviceId,
      incidentId: incidentId is int? ? incidentId : this.incidentId,
      confidence: confidence ?? this.confidence,
      metadata: metadata is String? ? metadata : this.metadata,
      expiresAt: expiresAt is DateTime? ? expiresAt : this.expiresAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class AiInsightUpdateTable extends _i1.UpdateTable<AiInsightTable> {
  AiInsightUpdateTable(super.table);

  _i1.ColumnValue<String, String> type(String value) => _i1.ColumnValue(
    table.type,
    value,
  );

  _i1.ColumnValue<String, String> title(String value) => _i1.ColumnValue(
    table.title,
    value,
  );

  _i1.ColumnValue<String, String> content(String value) => _i1.ColumnValue(
    table.content,
    value,
  );

  _i1.ColumnValue<String, String> severity(String? value) => _i1.ColumnValue(
    table.severity,
    value,
  );

  _i1.ColumnValue<int, int> serviceId(int? value) => _i1.ColumnValue(
    table.serviceId,
    value,
  );

  _i1.ColumnValue<int, int> incidentId(int? value) => _i1.ColumnValue(
    table.incidentId,
    value,
  );

  _i1.ColumnValue<double, double> confidence(double value) => _i1.ColumnValue(
    table.confidence,
    value,
  );

  _i1.ColumnValue<String, String> metadata(String? value) => _i1.ColumnValue(
    table.metadata,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> expiresAt(DateTime? value) =>
      _i1.ColumnValue(
        table.expiresAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class AiInsightTable extends _i1.Table<int?> {
  AiInsightTable({super.tableRelation}) : super(tableName: 'ai_insight') {
    updateTable = AiInsightUpdateTable(this);
    type = _i1.ColumnString(
      'type',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    content = _i1.ColumnString(
      'content',
      this,
    );
    severity = _i1.ColumnString(
      'severity',
      this,
    );
    serviceId = _i1.ColumnInt(
      'serviceId',
      this,
    );
    incidentId = _i1.ColumnInt(
      'incidentId',
      this,
    );
    confidence = _i1.ColumnDouble(
      'confidence',
      this,
    );
    metadata = _i1.ColumnString(
      'metadata',
      this,
    );
    expiresAt = _i1.ColumnDateTime(
      'expiresAt',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final AiInsightUpdateTable updateTable;

  late final _i1.ColumnString type;

  late final _i1.ColumnString title;

  late final _i1.ColumnString content;

  late final _i1.ColumnString severity;

  late final _i1.ColumnInt serviceId;

  late final _i1.ColumnInt incidentId;

  late final _i1.ColumnDouble confidence;

  late final _i1.ColumnString metadata;

  late final _i1.ColumnDateTime expiresAt;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    type,
    title,
    content,
    severity,
    serviceId,
    incidentId,
    confidence,
    metadata,
    expiresAt,
    createdAt,
  ];
}

class AiInsightInclude extends _i1.IncludeObject {
  AiInsightInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => AiInsight.t;
}

class AiInsightIncludeList extends _i1.IncludeList {
  AiInsightIncludeList._({
    _i1.WhereExpressionBuilder<AiInsightTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AiInsight.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => AiInsight.t;
}

class AiInsightRepository {
  const AiInsightRepository._();

  /// Returns a list of [AiInsight]s matching the given query parameters.
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
  Future<List<AiInsight>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AiInsightTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AiInsightTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AiInsightTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<AiInsight>(
      where: where?.call(AiInsight.t),
      orderBy: orderBy?.call(AiInsight.t),
      orderByList: orderByList?.call(AiInsight.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [AiInsight] matching the given query parameters.
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
  Future<AiInsight?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AiInsightTable>? where,
    int? offset,
    _i1.OrderByBuilder<AiInsightTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AiInsightTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<AiInsight>(
      where: where?.call(AiInsight.t),
      orderBy: orderBy?.call(AiInsight.t),
      orderByList: orderByList?.call(AiInsight.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [AiInsight] by its [id] or null if no such row exists.
  Future<AiInsight?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<AiInsight>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [AiInsight]s in the list and returns the inserted rows.
  ///
  /// The returned [AiInsight]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<AiInsight>> insert(
    _i1.Session session,
    List<AiInsight> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<AiInsight>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [AiInsight] and returns the inserted row.
  ///
  /// The returned [AiInsight] will have its `id` field set.
  Future<AiInsight> insertRow(
    _i1.Session session,
    AiInsight row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<AiInsight>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [AiInsight]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<AiInsight>> update(
    _i1.Session session,
    List<AiInsight> rows, {
    _i1.ColumnSelections<AiInsightTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<AiInsight>(
      rows,
      columns: columns?.call(AiInsight.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AiInsight]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<AiInsight> updateRow(
    _i1.Session session,
    AiInsight row, {
    _i1.ColumnSelections<AiInsightTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<AiInsight>(
      row,
      columns: columns?.call(AiInsight.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AiInsight] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<AiInsight?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<AiInsightUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<AiInsight>(
      id,
      columnValues: columnValues(AiInsight.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [AiInsight]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<AiInsight>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<AiInsightUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<AiInsightTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AiInsightTable>? orderBy,
    _i1.OrderByListBuilder<AiInsightTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<AiInsight>(
      columnValues: columnValues(AiInsight.t.updateTable),
      where: where(AiInsight.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AiInsight.t),
      orderByList: orderByList?.call(AiInsight.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [AiInsight]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<AiInsight>> delete(
    _i1.Session session,
    List<AiInsight> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<AiInsight>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [AiInsight].
  Future<AiInsight> deleteRow(
    _i1.Session session,
    AiInsight row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AiInsight>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<AiInsight>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AiInsightTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<AiInsight>(
      where: where(AiInsight.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AiInsightTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<AiInsight>(
      where: where?.call(AiInsight.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
