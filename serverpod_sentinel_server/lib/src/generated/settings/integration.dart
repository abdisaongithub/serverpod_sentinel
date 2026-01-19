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

abstract class Integration
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Integration._({
    this.id,
    required this.name,
    required this.type,
    required this.provider,
    this.config,
    required this.isEnabled,
    this.lastSyncAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Integration({
    int? id,
    required String name,
    required String type,
    required String provider,
    String? config,
    required bool isEnabled,
    DateTime? lastSyncAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _IntegrationImpl;

  factory Integration.fromJson(Map<String, dynamic> jsonSerialization) {
    return Integration(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      type: jsonSerialization['type'] as String,
      provider: jsonSerialization['provider'] as String,
      config: jsonSerialization['config'] as String?,
      isEnabled: jsonSerialization['isEnabled'] as bool,
      lastSyncAt: jsonSerialization['lastSyncAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['lastSyncAt']),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  static final t = IntegrationTable();

  static const db = IntegrationRepository._();

  @override
  int? id;

  String name;

  String type;

  String provider;

  String? config;

  bool isEnabled;

  DateTime? lastSyncAt;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Integration]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Integration copyWith({
    int? id,
    String? name,
    String? type,
    String? provider,
    String? config,
    bool? isEnabled,
    DateTime? lastSyncAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Integration',
      if (id != null) 'id': id,
      'name': name,
      'type': type,
      'provider': provider,
      if (config != null) 'config': config,
      'isEnabled': isEnabled,
      if (lastSyncAt != null) 'lastSyncAt': lastSyncAt?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Integration',
      if (id != null) 'id': id,
      'name': name,
      'type': type,
      'provider': provider,
      if (config != null) 'config': config,
      'isEnabled': isEnabled,
      if (lastSyncAt != null) 'lastSyncAt': lastSyncAt?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static IntegrationInclude include() {
    return IntegrationInclude._();
  }

  static IntegrationIncludeList includeList({
    _i1.WhereExpressionBuilder<IntegrationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<IntegrationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<IntegrationTable>? orderByList,
    IntegrationInclude? include,
  }) {
    return IntegrationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Integration.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Integration.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _IntegrationImpl extends Integration {
  _IntegrationImpl({
    int? id,
    required String name,
    required String type,
    required String provider,
    String? config,
    required bool isEnabled,
    DateTime? lastSyncAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         name: name,
         type: type,
         provider: provider,
         config: config,
         isEnabled: isEnabled,
         lastSyncAt: lastSyncAt,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Integration]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Integration copyWith({
    Object? id = _Undefined,
    String? name,
    String? type,
    String? provider,
    Object? config = _Undefined,
    bool? isEnabled,
    Object? lastSyncAt = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Integration(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      provider: provider ?? this.provider,
      config: config is String? ? config : this.config,
      isEnabled: isEnabled ?? this.isEnabled,
      lastSyncAt: lastSyncAt is DateTime? ? lastSyncAt : this.lastSyncAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class IntegrationUpdateTable extends _i1.UpdateTable<IntegrationTable> {
  IntegrationUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> type(String value) => _i1.ColumnValue(
    table.type,
    value,
  );

  _i1.ColumnValue<String, String> provider(String value) => _i1.ColumnValue(
    table.provider,
    value,
  );

  _i1.ColumnValue<String, String> config(String? value) => _i1.ColumnValue(
    table.config,
    value,
  );

  _i1.ColumnValue<bool, bool> isEnabled(bool value) => _i1.ColumnValue(
    table.isEnabled,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> lastSyncAt(DateTime? value) =>
      _i1.ColumnValue(
        table.lastSyncAt,
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

class IntegrationTable extends _i1.Table<int?> {
  IntegrationTable({super.tableRelation}) : super(tableName: 'integration') {
    updateTable = IntegrationUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    type = _i1.ColumnString(
      'type',
      this,
    );
    provider = _i1.ColumnString(
      'provider',
      this,
    );
    config = _i1.ColumnString(
      'config',
      this,
    );
    isEnabled = _i1.ColumnBool(
      'isEnabled',
      this,
    );
    lastSyncAt = _i1.ColumnDateTime(
      'lastSyncAt',
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

  late final IntegrationUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnString type;

  late final _i1.ColumnString provider;

  late final _i1.ColumnString config;

  late final _i1.ColumnBool isEnabled;

  late final _i1.ColumnDateTime lastSyncAt;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    type,
    provider,
    config,
    isEnabled,
    lastSyncAt,
    createdAt,
    updatedAt,
  ];
}

class IntegrationInclude extends _i1.IncludeObject {
  IntegrationInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Integration.t;
}

class IntegrationIncludeList extends _i1.IncludeList {
  IntegrationIncludeList._({
    _i1.WhereExpressionBuilder<IntegrationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Integration.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Integration.t;
}

class IntegrationRepository {
  const IntegrationRepository._();

  /// Returns a list of [Integration]s matching the given query parameters.
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
  Future<List<Integration>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<IntegrationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<IntegrationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<IntegrationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Integration>(
      where: where?.call(Integration.t),
      orderBy: orderBy?.call(Integration.t),
      orderByList: orderByList?.call(Integration.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Integration] matching the given query parameters.
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
  Future<Integration?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<IntegrationTable>? where,
    int? offset,
    _i1.OrderByBuilder<IntegrationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<IntegrationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Integration>(
      where: where?.call(Integration.t),
      orderBy: orderBy?.call(Integration.t),
      orderByList: orderByList?.call(Integration.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Integration] by its [id] or null if no such row exists.
  Future<Integration?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Integration>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Integration]s in the list and returns the inserted rows.
  ///
  /// The returned [Integration]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Integration>> insert(
    _i1.Session session,
    List<Integration> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Integration>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Integration] and returns the inserted row.
  ///
  /// The returned [Integration] will have its `id` field set.
  Future<Integration> insertRow(
    _i1.Session session,
    Integration row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Integration>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Integration]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Integration>> update(
    _i1.Session session,
    List<Integration> rows, {
    _i1.ColumnSelections<IntegrationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Integration>(
      rows,
      columns: columns?.call(Integration.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Integration]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Integration> updateRow(
    _i1.Session session,
    Integration row, {
    _i1.ColumnSelections<IntegrationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Integration>(
      row,
      columns: columns?.call(Integration.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Integration] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Integration?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<IntegrationUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Integration>(
      id,
      columnValues: columnValues(Integration.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Integration]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Integration>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<IntegrationUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<IntegrationTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<IntegrationTable>? orderBy,
    _i1.OrderByListBuilder<IntegrationTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Integration>(
      columnValues: columnValues(Integration.t.updateTable),
      where: where(Integration.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Integration.t),
      orderByList: orderByList?.call(Integration.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Integration]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Integration>> delete(
    _i1.Session session,
    List<Integration> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Integration>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Integration].
  Future<Integration> deleteRow(
    _i1.Session session,
    Integration row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Integration>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Integration>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<IntegrationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Integration>(
      where: where(Integration.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<IntegrationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Integration>(
      where: where?.call(Integration.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
