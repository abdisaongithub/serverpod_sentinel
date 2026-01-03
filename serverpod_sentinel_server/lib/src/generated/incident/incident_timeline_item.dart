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
import '../enums/timeline_item_type.dart' as _i4;
import 'package:serverpod_sentinel_server/src/generated/protocol.dart' as _i5;

/// Represents an item in the timeline of an incident.
abstract class IncidentTimelineItem
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  IncidentTimelineItem._({
    this.id,
    required this.incidentId,
    required this.incidentId,
    this.incident,
    this.authorId,
    required this.authorId,
    this.author,
    required this.type,
    required this.content,
    this.metaData,
    required this.createdAt,
  }) : _incidentTimelineIncidentId = null,
       _opsUserTimelineitemsOpsUserId = null;

  factory IncidentTimelineItem({
    int? id,
    required int incidentId,
    required int incidentId,
    _i2.Incident? incident,
    int? authorId,
    required int authorId,
    _i3.OpsUser? author,
    required _i4.TimelineItemType type,
    required String content,
    String? metaData,
    required DateTime createdAt,
  }) = _IncidentTimelineItemImpl;

  factory IncidentTimelineItem.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return IncidentTimelineItemImplicit._(
      id: jsonSerialization['id'] as int?,
      incidentId: jsonSerialization['incidentId'] as int,
      incident: jsonSerialization['incident'] == null
          ? null
          : _i5.Protocol().deserialize<_i2.Incident>(
              jsonSerialization['incident'],
            ),
      authorId: jsonSerialization['authorId'] as int,
      author: jsonSerialization['author'] == null
          ? null
          : _i5.Protocol().deserialize<_i3.OpsUser>(
              jsonSerialization['author'],
            ),
      type: _i4.TimelineItemType.fromJson(
        (jsonSerialization['type'] as String),
      ),
      content: jsonSerialization['content'] as String,
      metaData: jsonSerialization['metaData'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      $_incidentTimelineIncidentId:
          jsonSerialization['_incidentTimelineIncidentId'] as int?,
      $_opsUserTimelineitemsOpsUserId:
          jsonSerialization['_opsUserTimelineitemsOpsUserId'] as int?,
    );
  }

  static final t = IncidentTimelineItemTable();

  static const db = IncidentTimelineItemRepository._();

  @override
  int? id;

  int incidentId;

  int incidentId;

  _i2.Incident? incident;

  int? authorId;

  int authorId;

  _i3.OpsUser? author;

  _i4.TimelineItemType type;

  String content;

  String? metaData;

  DateTime createdAt;

  final int? _incidentTimelineIncidentId;

  final int? _opsUserTimelineitemsOpsUserId;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [IncidentTimelineItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  IncidentTimelineItem copyWith({
    int? id,
    int? incidentId,
    int? incidentId,
    _i2.Incident? incident,
    int? authorId,
    int? authorId,
    _i3.OpsUser? author,
    _i4.TimelineItemType? type,
    String? content,
    String? metaData,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'IncidentTimelineItem',
      if (id != null) 'id': id,
      'incidentId': incidentId,
      'incidentId': incidentId,
      if (incident != null) 'incident': incident?.toJson(),
      if (authorId != null) 'authorId': authorId,
      'authorId': authorId,
      if (author != null) 'author': author?.toJson(),
      'type': type.toJson(),
      'content': content,
      if (metaData != null) 'metaData': metaData,
      'createdAt': createdAt.toJson(),
      if (_incidentTimelineIncidentId != null)
        '_incidentTimelineIncidentId': _incidentTimelineIncidentId,
      if (_opsUserTimelineitemsOpsUserId != null)
        '_opsUserTimelineitemsOpsUserId': _opsUserTimelineitemsOpsUserId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'IncidentTimelineItem',
      if (id != null) 'id': id,
      'incidentId': incidentId,
      'incidentId': incidentId,
      if (incident != null) 'incident': incident?.toJsonForProtocol(),
      if (authorId != null) 'authorId': authorId,
      'authorId': authorId,
      if (author != null) 'author': author?.toJsonForProtocol(),
      'type': type.toJson(),
      'content': content,
      if (metaData != null) 'metaData': metaData,
      'createdAt': createdAt.toJson(),
    };
  }

  static IncidentTimelineItemInclude include({
    _i2.IncidentInclude? incident,
    _i3.OpsUserInclude? author,
  }) {
    return IncidentTimelineItemInclude._(
      incident: incident,
      author: author,
    );
  }

  static IncidentTimelineItemIncludeList includeList({
    _i1.WhereExpressionBuilder<IncidentTimelineItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<IncidentTimelineItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<IncidentTimelineItemTable>? orderByList,
    IncidentTimelineItemInclude? include,
  }) {
    return IncidentTimelineItemIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(IncidentTimelineItem.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(IncidentTimelineItem.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _IncidentTimelineItemImpl extends IncidentTimelineItem {
  _IncidentTimelineItemImpl({
    int? id,
    required int incidentId,
    required int incidentId,
    _i2.Incident? incident,
    int? authorId,
    required int authorId,
    _i3.OpsUser? author,
    required _i4.TimelineItemType type,
    required String content,
    String? metaData,
    required DateTime createdAt,
  }) : super._(
         id: id,
         incidentId: incidentId,
         incident: incident,
         authorId: authorId,
         author: author,
         type: type,
         content: content,
         metaData: metaData,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [IncidentTimelineItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  IncidentTimelineItem copyWith({
    Object? id = _Undefined,
    int? incidentId,
    int? incidentId,
    Object? incident = _Undefined,
    Object? authorId = _Undefined,
    int? authorId,
    Object? author = _Undefined,
    _i4.TimelineItemType? type,
    String? content,
    Object? metaData = _Undefined,
    DateTime? createdAt,
  }) {
    return IncidentTimelineItemImplicit._(
      id: id is int? ? id : this.id,
      incidentId: incidentId ?? this.incidentId,
      incident: incident is _i2.Incident?
          ? incident
          : this.incident?.copyWith(),
      authorId: authorId ?? this.authorId,
      author: author is _i3.OpsUser? ? author : this.author?.copyWith(),
      type: type ?? this.type,
      content: content ?? this.content,
      metaData: metaData is String? ? metaData : this.metaData,
      createdAt: createdAt ?? this.createdAt,
      $_incidentTimelineIncidentId: this._incidentTimelineIncidentId,
      $_opsUserTimelineitemsOpsUserId: this._opsUserTimelineitemsOpsUserId,
    );
  }
}

class IncidentTimelineItemImplicit extends _IncidentTimelineItemImpl {
  IncidentTimelineItemImplicit._({
    int? id,
    required int incidentId,
    required int incidentId,
    _i2.Incident? incident,
    int? authorId,
    required int authorId,
    _i3.OpsUser? author,
    required _i4.TimelineItemType type,
    required String content,
    String? metaData,
    required DateTime createdAt,
    int? $_incidentTimelineIncidentId,
    int? $_opsUserTimelineitemsOpsUserId,
  }) : _incidentTimelineIncidentId = $_incidentTimelineIncidentId,
       _opsUserTimelineitemsOpsUserId = $_opsUserTimelineitemsOpsUserId,
       super(
         id: id,
         incidentId: incidentId,
         incident: incident,
         authorId: authorId,
         author: author,
         type: type,
         content: content,
         metaData: metaData,
         createdAt: createdAt,
       );

  factory IncidentTimelineItemImplicit(
    IncidentTimelineItem incidentTimelineItem, {
    int? $_incidentTimelineIncidentId,
    int? $_opsUserTimelineitemsOpsUserId,
  }) {
    return IncidentTimelineItemImplicit._(
      id: incidentTimelineItem.id,
      incidentId: incidentTimelineItem.incidentId,
      incident: incidentTimelineItem.incident,
      authorId: incidentTimelineItem.authorId,
      author: incidentTimelineItem.author,
      type: incidentTimelineItem.type,
      content: incidentTimelineItem.content,
      metaData: incidentTimelineItem.metaData,
      createdAt: incidentTimelineItem.createdAt,
      $_incidentTimelineIncidentId: $_incidentTimelineIncidentId,
      $_opsUserTimelineitemsOpsUserId: $_opsUserTimelineitemsOpsUserId,
    );
  }

  @override
  final int? _incidentTimelineIncidentId;

  @override
  final int? _opsUserTimelineitemsOpsUserId;
}

class IncidentTimelineItemUpdateTable
    extends _i1.UpdateTable<IncidentTimelineItemTable> {
  IncidentTimelineItemUpdateTable(super.table);

  _i1.ColumnValue<int, int> incidentId(int value) => _i1.ColumnValue(
    table.incidentId,
    value,
  );

  _i1.ColumnValue<int, int> incidentId(int value) => _i1.ColumnValue(
    table.incidentId,
    value,
  );

  _i1.ColumnValue<int, int> authorId(int? value) => _i1.ColumnValue(
    table.authorId,
    value,
  );

  _i1.ColumnValue<int, int> authorId(int value) => _i1.ColumnValue(
    table.authorId,
    value,
  );

  _i1.ColumnValue<_i4.TimelineItemType, _i4.TimelineItemType> type(
    _i4.TimelineItemType value,
  ) => _i1.ColumnValue(
    table.type,
    value,
  );

  _i1.ColumnValue<String, String> content(String value) => _i1.ColumnValue(
    table.content,
    value,
  );

  _i1.ColumnValue<String, String> metaData(String? value) => _i1.ColumnValue(
    table.metaData,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<int, int> $_incidentTimelineIncidentId(int? value) =>
      _i1.ColumnValue(
        table.$_incidentTimelineIncidentId,
        value,
      );

  _i1.ColumnValue<int, int> $_opsUserTimelineitemsOpsUserId(int? value) =>
      _i1.ColumnValue(
        table.$_opsUserTimelineitemsOpsUserId,
        value,
      );
}

class IncidentTimelineItemTable extends _i1.Table<int?> {
  IncidentTimelineItemTable({super.tableRelation})
    : super(tableName: 'incident_timeline_item') {
    updateTable = IncidentTimelineItemUpdateTable(this);
    incidentId = _i1.ColumnInt(
      'incidentId',
      this,
    );
    incidentId = _i1.ColumnInt(
      'incidentId',
      this,
    );
    authorId = _i1.ColumnInt(
      'authorId',
      this,
    );
    authorId = _i1.ColumnInt(
      'authorId',
      this,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
    );
    content = _i1.ColumnString(
      'content',
      this,
    );
    metaData = _i1.ColumnString(
      'metaData',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    $_incidentTimelineIncidentId = _i1.ColumnInt(
      '_incidentTimelineIncidentId',
      this,
    );
    $_opsUserTimelineitemsOpsUserId = _i1.ColumnInt(
      '_opsUserTimelineitemsOpsUserId',
      this,
    );
  }

  late final IncidentTimelineItemUpdateTable updateTable;

  late final _i1.ColumnInt incidentId;

  late final _i1.ColumnInt incidentId;

  _i2.IncidentTable? _incident;

  late final _i1.ColumnInt authorId;

  late final _i1.ColumnInt authorId;

  _i3.OpsUserTable? _author;

  late final _i1.ColumnEnum<_i4.TimelineItemType> type;

  late final _i1.ColumnString content;

  late final _i1.ColumnString metaData;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnInt $_incidentTimelineIncidentId;

  late final _i1.ColumnInt $_opsUserTimelineitemsOpsUserId;

  _i2.IncidentTable get incident {
    if (_incident != null) return _incident!;
    _incident = _i1.createRelationTable(
      relationFieldName: 'incident',
      field: IncidentTimelineItem.t.incidentId,
      foreignField: _i2.Incident.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.IncidentTable(tableRelation: foreignTableRelation),
    );
    return _incident!;
  }

  _i3.OpsUserTable get author {
    if (_author != null) return _author!;
    _author = _i1.createRelationTable(
      relationFieldName: 'author',
      field: IncidentTimelineItem.t.authorId,
      foreignField: _i3.OpsUser.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.OpsUserTable(tableRelation: foreignTableRelation),
    );
    return _author!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    incidentId,
    incidentId,
    authorId,
    authorId,
    type,
    content,
    metaData,
    createdAt,
    $_incidentTimelineIncidentId,
    $_opsUserTimelineitemsOpsUserId,
  ];

  @override
  List<_i1.Column> get managedColumns => [
    id,
    incidentId,
    incidentId,
    authorId,
    authorId,
    type,
    content,
    metaData,
    createdAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'incident') {
      return incident;
    }
    if (relationField == 'author') {
      return author;
    }
    return null;
  }
}

class IncidentTimelineItemInclude extends _i1.IncludeObject {
  IncidentTimelineItemInclude._({
    _i2.IncidentInclude? incident,
    _i3.OpsUserInclude? author,
  }) {
    _incident = incident;
    _author = author;
  }

  _i2.IncidentInclude? _incident;

  _i3.OpsUserInclude? _author;

  @override
  Map<String, _i1.Include?> get includes => {
    'incident': _incident,
    'author': _author,
  };

  @override
  _i1.Table<int?> get table => IncidentTimelineItem.t;
}

class IncidentTimelineItemIncludeList extends _i1.IncludeList {
  IncidentTimelineItemIncludeList._({
    _i1.WhereExpressionBuilder<IncidentTimelineItemTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(IncidentTimelineItem.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => IncidentTimelineItem.t;
}

class IncidentTimelineItemRepository {
  const IncidentTimelineItemRepository._();

  final attachRow = const IncidentTimelineItemAttachRowRepository._();

  /// Returns a list of [IncidentTimelineItem]s matching the given query parameters.
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
  Future<List<IncidentTimelineItem>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<IncidentTimelineItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<IncidentTimelineItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<IncidentTimelineItemTable>? orderByList,
    _i1.Transaction? transaction,
    IncidentTimelineItemInclude? include,
  }) async {
    return session.db.find<IncidentTimelineItem>(
      where: where?.call(IncidentTimelineItem.t),
      orderBy: orderBy?.call(IncidentTimelineItem.t),
      orderByList: orderByList?.call(IncidentTimelineItem.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [IncidentTimelineItem] matching the given query parameters.
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
  Future<IncidentTimelineItem?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<IncidentTimelineItemTable>? where,
    int? offset,
    _i1.OrderByBuilder<IncidentTimelineItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<IncidentTimelineItemTable>? orderByList,
    _i1.Transaction? transaction,
    IncidentTimelineItemInclude? include,
  }) async {
    return session.db.findFirstRow<IncidentTimelineItem>(
      where: where?.call(IncidentTimelineItem.t),
      orderBy: orderBy?.call(IncidentTimelineItem.t),
      orderByList: orderByList?.call(IncidentTimelineItem.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [IncidentTimelineItem] by its [id] or null if no such row exists.
  Future<IncidentTimelineItem?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    IncidentTimelineItemInclude? include,
  }) async {
    return session.db.findById<IncidentTimelineItem>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [IncidentTimelineItem]s in the list and returns the inserted rows.
  ///
  /// The returned [IncidentTimelineItem]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<IncidentTimelineItem>> insert(
    _i1.Session session,
    List<IncidentTimelineItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<IncidentTimelineItem>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [IncidentTimelineItem] and returns the inserted row.
  ///
  /// The returned [IncidentTimelineItem] will have its `id` field set.
  Future<IncidentTimelineItem> insertRow(
    _i1.Session session,
    IncidentTimelineItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<IncidentTimelineItem>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [IncidentTimelineItem]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<IncidentTimelineItem>> update(
    _i1.Session session,
    List<IncidentTimelineItem> rows, {
    _i1.ColumnSelections<IncidentTimelineItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<IncidentTimelineItem>(
      rows,
      columns: columns?.call(IncidentTimelineItem.t),
      transaction: transaction,
    );
  }

  /// Updates a single [IncidentTimelineItem]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<IncidentTimelineItem> updateRow(
    _i1.Session session,
    IncidentTimelineItem row, {
    _i1.ColumnSelections<IncidentTimelineItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<IncidentTimelineItem>(
      row,
      columns: columns?.call(IncidentTimelineItem.t),
      transaction: transaction,
    );
  }

  /// Updates a single [IncidentTimelineItem] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<IncidentTimelineItem?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<IncidentTimelineItemUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<IncidentTimelineItem>(
      id,
      columnValues: columnValues(IncidentTimelineItem.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [IncidentTimelineItem]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<IncidentTimelineItem>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<IncidentTimelineItemUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<IncidentTimelineItemTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<IncidentTimelineItemTable>? orderBy,
    _i1.OrderByListBuilder<IncidentTimelineItemTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<IncidentTimelineItem>(
      columnValues: columnValues(IncidentTimelineItem.t.updateTable),
      where: where(IncidentTimelineItem.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(IncidentTimelineItem.t),
      orderByList: orderByList?.call(IncidentTimelineItem.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [IncidentTimelineItem]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<IncidentTimelineItem>> delete(
    _i1.Session session,
    List<IncidentTimelineItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<IncidentTimelineItem>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [IncidentTimelineItem].
  Future<IncidentTimelineItem> deleteRow(
    _i1.Session session,
    IncidentTimelineItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<IncidentTimelineItem>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<IncidentTimelineItem>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<IncidentTimelineItemTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<IncidentTimelineItem>(
      where: where(IncidentTimelineItem.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<IncidentTimelineItemTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<IncidentTimelineItem>(
      where: where?.call(IncidentTimelineItem.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class IncidentTimelineItemAttachRowRepository {
  const IncidentTimelineItemAttachRowRepository._();

  /// Creates a relation between the given [IncidentTimelineItem] and [Incident]
  /// by setting the [IncidentTimelineItem]'s foreign key `incidentId` to refer to the [Incident].
  Future<void> incident(
    _i1.Session session,
    IncidentTimelineItem incidentTimelineItem,
    _i2.Incident incident, {
    _i1.Transaction? transaction,
  }) async {
    if (incidentTimelineItem.id == null) {
      throw ArgumentError.notNull('incidentTimelineItem.id');
    }
    if (incident.id == null) {
      throw ArgumentError.notNull('incident.id');
    }

    var $incidentTimelineItem = incidentTimelineItem.copyWith(
      incidentId: incident.id,
    );
    await session.db.updateRow<IncidentTimelineItem>(
      $incidentTimelineItem,
      columns: [IncidentTimelineItem.t.incidentId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [IncidentTimelineItem] and [OpsUser]
  /// by setting the [IncidentTimelineItem]'s foreign key `authorId` to refer to the [OpsUser].
  Future<void> author(
    _i1.Session session,
    IncidentTimelineItem incidentTimelineItem,
    _i3.OpsUser author, {
    _i1.Transaction? transaction,
  }) async {
    if (incidentTimelineItem.id == null) {
      throw ArgumentError.notNull('incidentTimelineItem.id');
    }
    if (author.id == null) {
      throw ArgumentError.notNull('author.id');
    }

    var $incidentTimelineItem = incidentTimelineItem.copyWith(
      authorId: author.id,
    );
    await session.db.updateRow<IncidentTimelineItem>(
      $incidentTimelineItem,
      columns: [IncidentTimelineItem.t.authorId],
      transaction: transaction,
    );
  }
}
