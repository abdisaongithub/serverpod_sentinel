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

abstract class ButlerConversation
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ButlerConversation._({
    this.id,
    required this.userId,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ButlerConversation({
    int? id,
    required int userId,
    required String title,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ButlerConversationImpl;

  factory ButlerConversation.fromJson(Map<String, dynamic> jsonSerialization) {
    return ButlerConversation(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      title: jsonSerialization['title'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  static final t = ButlerConversationTable();

  static const db = ButlerConversationRepository._();

  @override
  int? id;

  int userId;

  String title;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ButlerConversation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ButlerConversation copyWith({
    int? id,
    int? userId,
    String? title,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ButlerConversation',
      if (id != null) 'id': id,
      'userId': userId,
      'title': title,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ButlerConversation',
      if (id != null) 'id': id,
      'userId': userId,
      'title': title,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static ButlerConversationInclude include() {
    return ButlerConversationInclude._();
  }

  static ButlerConversationIncludeList includeList({
    _i1.WhereExpressionBuilder<ButlerConversationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ButlerConversationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ButlerConversationTable>? orderByList,
    ButlerConversationInclude? include,
  }) {
    return ButlerConversationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ButlerConversation.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ButlerConversation.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ButlerConversationImpl extends ButlerConversation {
  _ButlerConversationImpl({
    int? id,
    required int userId,
    required String title,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         userId: userId,
         title: title,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [ButlerConversation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ButlerConversation copyWith({
    Object? id = _Undefined,
    int? userId,
    String? title,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ButlerConversation(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class ButlerConversationUpdateTable
    extends _i1.UpdateTable<ButlerConversationTable> {
  ButlerConversationUpdateTable(super.table);

  _i1.ColumnValue<int, int> userId(int value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<String, String> title(String value) => _i1.ColumnValue(
    table.title,
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

class ButlerConversationTable extends _i1.Table<int?> {
  ButlerConversationTable({super.tableRelation})
    : super(tableName: 'butler_conversations') {
    updateTable = ButlerConversationUpdateTable(this);
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    title = _i1.ColumnString(
      'title',
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

  late final ButlerConversationUpdateTable updateTable;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnString title;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    title,
    createdAt,
    updatedAt,
  ];
}

class ButlerConversationInclude extends _i1.IncludeObject {
  ButlerConversationInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => ButlerConversation.t;
}

class ButlerConversationIncludeList extends _i1.IncludeList {
  ButlerConversationIncludeList._({
    _i1.WhereExpressionBuilder<ButlerConversationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ButlerConversation.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ButlerConversation.t;
}

class ButlerConversationRepository {
  const ButlerConversationRepository._();

  /// Returns a list of [ButlerConversation]s matching the given query parameters.
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
  Future<List<ButlerConversation>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ButlerConversationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ButlerConversationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ButlerConversationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ButlerConversation>(
      where: where?.call(ButlerConversation.t),
      orderBy: orderBy?.call(ButlerConversation.t),
      orderByList: orderByList?.call(ButlerConversation.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [ButlerConversation] matching the given query parameters.
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
  Future<ButlerConversation?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ButlerConversationTable>? where,
    int? offset,
    _i1.OrderByBuilder<ButlerConversationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ButlerConversationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<ButlerConversation>(
      where: where?.call(ButlerConversation.t),
      orderBy: orderBy?.call(ButlerConversation.t),
      orderByList: orderByList?.call(ButlerConversation.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [ButlerConversation] by its [id] or null if no such row exists.
  Future<ButlerConversation?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<ButlerConversation>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [ButlerConversation]s in the list and returns the inserted rows.
  ///
  /// The returned [ButlerConversation]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ButlerConversation>> insert(
    _i1.Session session,
    List<ButlerConversation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ButlerConversation>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ButlerConversation] and returns the inserted row.
  ///
  /// The returned [ButlerConversation] will have its `id` field set.
  Future<ButlerConversation> insertRow(
    _i1.Session session,
    ButlerConversation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ButlerConversation>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ButlerConversation]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ButlerConversation>> update(
    _i1.Session session,
    List<ButlerConversation> rows, {
    _i1.ColumnSelections<ButlerConversationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ButlerConversation>(
      rows,
      columns: columns?.call(ButlerConversation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ButlerConversation]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ButlerConversation> updateRow(
    _i1.Session session,
    ButlerConversation row, {
    _i1.ColumnSelections<ButlerConversationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ButlerConversation>(
      row,
      columns: columns?.call(ButlerConversation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ButlerConversation] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ButlerConversation?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<ButlerConversationUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ButlerConversation>(
      id,
      columnValues: columnValues(ButlerConversation.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ButlerConversation]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ButlerConversation>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ButlerConversationUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<ButlerConversationTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ButlerConversationTable>? orderBy,
    _i1.OrderByListBuilder<ButlerConversationTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ButlerConversation>(
      columnValues: columnValues(ButlerConversation.t.updateTable),
      where: where(ButlerConversation.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ButlerConversation.t),
      orderByList: orderByList?.call(ButlerConversation.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ButlerConversation]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ButlerConversation>> delete(
    _i1.Session session,
    List<ButlerConversation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ButlerConversation>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ButlerConversation].
  Future<ButlerConversation> deleteRow(
    _i1.Session session,
    ButlerConversation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ButlerConversation>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ButlerConversation>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ButlerConversationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ButlerConversation>(
      where: where(ButlerConversation.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ButlerConversationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ButlerConversation>(
      where: where?.call(ButlerConversation.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
