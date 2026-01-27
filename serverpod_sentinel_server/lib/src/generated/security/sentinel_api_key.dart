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
import 'package:serverpod_sentinel_server/src/generated/protocol.dart' as _i2;

/// Scoped API keys for platform-level access.
abstract class SentinelApiKey
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  SentinelApiKey._({
    this.id,
    required this.name,
    required this.key,
    required this.keyHash,
    required this.scopes,
    this.userId,
    this.lastUsedAt,
    this.expiresAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SentinelApiKey({
    int? id,
    required String name,
    required String key,
    required String keyHash,
    required List<String> scopes,
    int? userId,
    DateTime? lastUsedAt,
    DateTime? expiresAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SentinelApiKeyImpl;

  factory SentinelApiKey.fromJson(Map<String, dynamic> jsonSerialization) {
    return SentinelApiKey(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      key: jsonSerialization['key'] as String,
      keyHash: jsonSerialization['keyHash'] as String,
      scopes: _i2.Protocol().deserialize<List<String>>(
        jsonSerialization['scopes'],
      ),
      userId: jsonSerialization['userId'] as int?,
      lastUsedAt: jsonSerialization['lastUsedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['lastUsedAt']),
      expiresAt: jsonSerialization['expiresAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expiresAt']),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  static final t = SentinelApiKeyTable();

  static const db = SentinelApiKeyRepository._();

  @override
  int? id;

  String name;

  String key;

  String keyHash;

  List<String> scopes;

  int? userId;

  DateTime? lastUsedAt;

  DateTime? expiresAt;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [SentinelApiKey]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SentinelApiKey copyWith({
    int? id,
    String? name,
    String? key,
    String? keyHash,
    List<String>? scopes,
    int? userId,
    DateTime? lastUsedAt,
    DateTime? expiresAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SentinelApiKey',
      if (id != null) 'id': id,
      'name': name,
      'key': key,
      'keyHash': keyHash,
      'scopes': scopes.toJson(),
      if (userId != null) 'userId': userId,
      if (lastUsedAt != null) 'lastUsedAt': lastUsedAt?.toJson(),
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SentinelApiKey',
      if (id != null) 'id': id,
      'name': name,
      'key': key,
      'keyHash': keyHash,
      'scopes': scopes.toJson(),
      if (userId != null) 'userId': userId,
      if (lastUsedAt != null) 'lastUsedAt': lastUsedAt?.toJson(),
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static SentinelApiKeyInclude include() {
    return SentinelApiKeyInclude._();
  }

  static SentinelApiKeyIncludeList includeList({
    _i1.WhereExpressionBuilder<SentinelApiKeyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SentinelApiKeyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SentinelApiKeyTable>? orderByList,
    SentinelApiKeyInclude? include,
  }) {
    return SentinelApiKeyIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SentinelApiKey.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SentinelApiKey.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SentinelApiKeyImpl extends SentinelApiKey {
  _SentinelApiKeyImpl({
    int? id,
    required String name,
    required String key,
    required String keyHash,
    required List<String> scopes,
    int? userId,
    DateTime? lastUsedAt,
    DateTime? expiresAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         name: name,
         key: key,
         keyHash: keyHash,
         scopes: scopes,
         userId: userId,
         lastUsedAt: lastUsedAt,
         expiresAt: expiresAt,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [SentinelApiKey]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SentinelApiKey copyWith({
    Object? id = _Undefined,
    String? name,
    String? key,
    String? keyHash,
    List<String>? scopes,
    Object? userId = _Undefined,
    Object? lastUsedAt = _Undefined,
    Object? expiresAt = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SentinelApiKey(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      key: key ?? this.key,
      keyHash: keyHash ?? this.keyHash,
      scopes: scopes ?? this.scopes.map((e0) => e0).toList(),
      userId: userId is int? ? userId : this.userId,
      lastUsedAt: lastUsedAt is DateTime? ? lastUsedAt : this.lastUsedAt,
      expiresAt: expiresAt is DateTime? ? expiresAt : this.expiresAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class SentinelApiKeyUpdateTable extends _i1.UpdateTable<SentinelApiKeyTable> {
  SentinelApiKeyUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> key(String value) => _i1.ColumnValue(
    table.key,
    value,
  );

  _i1.ColumnValue<String, String> keyHash(String value) => _i1.ColumnValue(
    table.keyHash,
    value,
  );

  _i1.ColumnValue<List<String>, List<String>> scopes(List<String> value) =>
      _i1.ColumnValue(
        table.scopes,
        value,
      );

  _i1.ColumnValue<int, int> userId(int? value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> lastUsedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.lastUsedAt,
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

  _i1.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _i1.ColumnValue(
        table.updatedAt,
        value,
      );
}

class SentinelApiKeyTable extends _i1.Table<int?> {
  SentinelApiKeyTable({super.tableRelation})
    : super(tableName: 'sentinel_api_key') {
    updateTable = SentinelApiKeyUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    key = _i1.ColumnString(
      'key',
      this,
    );
    keyHash = _i1.ColumnString(
      'keyHash',
      this,
    );
    scopes = _i1.ColumnSerializable<List<String>>(
      'scopes',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    lastUsedAt = _i1.ColumnDateTime(
      'lastUsedAt',
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
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final SentinelApiKeyUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnString key;

  late final _i1.ColumnString keyHash;

  late final _i1.ColumnSerializable<List<String>> scopes;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnDateTime lastUsedAt;

  late final _i1.ColumnDateTime expiresAt;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    key,
    keyHash,
    scopes,
    userId,
    lastUsedAt,
    expiresAt,
    createdAt,
    updatedAt,
  ];
}

class SentinelApiKeyInclude extends _i1.IncludeObject {
  SentinelApiKeyInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => SentinelApiKey.t;
}

class SentinelApiKeyIncludeList extends _i1.IncludeList {
  SentinelApiKeyIncludeList._({
    _i1.WhereExpressionBuilder<SentinelApiKeyTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SentinelApiKey.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => SentinelApiKey.t;
}

class SentinelApiKeyRepository {
  const SentinelApiKeyRepository._();

  /// Returns a list of [SentinelApiKey]s matching the given query parameters.
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
  Future<List<SentinelApiKey>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SentinelApiKeyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SentinelApiKeyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SentinelApiKeyTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<SentinelApiKey>(
      where: where?.call(SentinelApiKey.t),
      orderBy: orderBy?.call(SentinelApiKey.t),
      orderByList: orderByList?.call(SentinelApiKey.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [SentinelApiKey] matching the given query parameters.
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
  Future<SentinelApiKey?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SentinelApiKeyTable>? where,
    int? offset,
    _i1.OrderByBuilder<SentinelApiKeyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SentinelApiKeyTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<SentinelApiKey>(
      where: where?.call(SentinelApiKey.t),
      orderBy: orderBy?.call(SentinelApiKey.t),
      orderByList: orderByList?.call(SentinelApiKey.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [SentinelApiKey] by its [id] or null if no such row exists.
  Future<SentinelApiKey?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<SentinelApiKey>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [SentinelApiKey]s in the list and returns the inserted rows.
  ///
  /// The returned [SentinelApiKey]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<SentinelApiKey>> insert(
    _i1.Session session,
    List<SentinelApiKey> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<SentinelApiKey>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [SentinelApiKey] and returns the inserted row.
  ///
  /// The returned [SentinelApiKey] will have its `id` field set.
  Future<SentinelApiKey> insertRow(
    _i1.Session session,
    SentinelApiKey row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SentinelApiKey>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [SentinelApiKey]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<SentinelApiKey>> update(
    _i1.Session session,
    List<SentinelApiKey> rows, {
    _i1.ColumnSelections<SentinelApiKeyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SentinelApiKey>(
      rows,
      columns: columns?.call(SentinelApiKey.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SentinelApiKey]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SentinelApiKey> updateRow(
    _i1.Session session,
    SentinelApiKey row, {
    _i1.ColumnSelections<SentinelApiKeyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<SentinelApiKey>(
      row,
      columns: columns?.call(SentinelApiKey.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SentinelApiKey] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<SentinelApiKey?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<SentinelApiKeyUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<SentinelApiKey>(
      id,
      columnValues: columnValues(SentinelApiKey.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [SentinelApiKey]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<SentinelApiKey>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<SentinelApiKeyUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<SentinelApiKeyTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SentinelApiKeyTable>? orderBy,
    _i1.OrderByListBuilder<SentinelApiKeyTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<SentinelApiKey>(
      columnValues: columnValues(SentinelApiKey.t.updateTable),
      where: where(SentinelApiKey.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SentinelApiKey.t),
      orderByList: orderByList?.call(SentinelApiKey.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [SentinelApiKey]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<SentinelApiKey>> delete(
    _i1.Session session,
    List<SentinelApiKey> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SentinelApiKey>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [SentinelApiKey].
  Future<SentinelApiKey> deleteRow(
    _i1.Session session,
    SentinelApiKey row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SentinelApiKey>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<SentinelApiKey>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SentinelApiKeyTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SentinelApiKey>(
      where: where(SentinelApiKey.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SentinelApiKeyTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SentinelApiKey>(
      where: where?.call(SentinelApiKey.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
