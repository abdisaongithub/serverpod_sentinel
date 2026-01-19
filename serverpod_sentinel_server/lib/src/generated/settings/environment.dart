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

abstract class Environment
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Environment._({
    this.id,
    required this.name,
    required this.region,
    this.description,
    required this.isActive,
    this.config,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Environment({
    int? id,
    required String name,
    required String region,
    String? description,
    required bool isActive,
    String? config,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _EnvironmentImpl;

  factory Environment.fromJson(Map<String, dynamic> jsonSerialization) {
    return Environment(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      region: jsonSerialization['region'] as String,
      description: jsonSerialization['description'] as String?,
      isActive: jsonSerialization['isActive'] as bool,
      config: jsonSerialization['config'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  static final t = EnvironmentTable();

  static const db = EnvironmentRepository._();

  @override
  int? id;

  String name;

  String region;

  String? description;

  bool isActive;

  String? config;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Environment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Environment copyWith({
    int? id,
    String? name,
    String? region,
    String? description,
    bool? isActive,
    String? config,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Environment',
      if (id != null) 'id': id,
      'name': name,
      'region': region,
      if (description != null) 'description': description,
      'isActive': isActive,
      if (config != null) 'config': config,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Environment',
      if (id != null) 'id': id,
      'name': name,
      'region': region,
      if (description != null) 'description': description,
      'isActive': isActive,
      if (config != null) 'config': config,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static EnvironmentInclude include() {
    return EnvironmentInclude._();
  }

  static EnvironmentIncludeList includeList({
    _i1.WhereExpressionBuilder<EnvironmentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EnvironmentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EnvironmentTable>? orderByList,
    EnvironmentInclude? include,
  }) {
    return EnvironmentIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Environment.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Environment.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EnvironmentImpl extends Environment {
  _EnvironmentImpl({
    int? id,
    required String name,
    required String region,
    String? description,
    required bool isActive,
    String? config,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         name: name,
         region: region,
         description: description,
         isActive: isActive,
         config: config,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Environment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Environment copyWith({
    Object? id = _Undefined,
    String? name,
    String? region,
    Object? description = _Undefined,
    bool? isActive,
    Object? config = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Environment(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      region: region ?? this.region,
      description: description is String? ? description : this.description,
      isActive: isActive ?? this.isActive,
      config: config is String? ? config : this.config,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class EnvironmentUpdateTable extends _i1.UpdateTable<EnvironmentTable> {
  EnvironmentUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> region(String value) => _i1.ColumnValue(
    table.region,
    value,
  );

  _i1.ColumnValue<String, String> description(String? value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<bool, bool> isActive(bool value) => _i1.ColumnValue(
    table.isActive,
    value,
  );

  _i1.ColumnValue<String, String> config(String? value) => _i1.ColumnValue(
    table.config,
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

class EnvironmentTable extends _i1.Table<int?> {
  EnvironmentTable({super.tableRelation}) : super(tableName: 'environment') {
    updateTable = EnvironmentUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    region = _i1.ColumnString(
      'region',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
    );
    config = _i1.ColumnString(
      'config',
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

  late final EnvironmentUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnString region;

  late final _i1.ColumnString description;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnString config;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    region,
    description,
    isActive,
    config,
    createdAt,
    updatedAt,
  ];
}

class EnvironmentInclude extends _i1.IncludeObject {
  EnvironmentInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Environment.t;
}

class EnvironmentIncludeList extends _i1.IncludeList {
  EnvironmentIncludeList._({
    _i1.WhereExpressionBuilder<EnvironmentTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Environment.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Environment.t;
}

class EnvironmentRepository {
  const EnvironmentRepository._();

  /// Returns a list of [Environment]s matching the given query parameters.
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
  Future<List<Environment>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EnvironmentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EnvironmentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EnvironmentTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Environment>(
      where: where?.call(Environment.t),
      orderBy: orderBy?.call(Environment.t),
      orderByList: orderByList?.call(Environment.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Environment] matching the given query parameters.
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
  Future<Environment?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EnvironmentTable>? where,
    int? offset,
    _i1.OrderByBuilder<EnvironmentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EnvironmentTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Environment>(
      where: where?.call(Environment.t),
      orderBy: orderBy?.call(Environment.t),
      orderByList: orderByList?.call(Environment.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Environment] by its [id] or null if no such row exists.
  Future<Environment?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Environment>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Environment]s in the list and returns the inserted rows.
  ///
  /// The returned [Environment]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Environment>> insert(
    _i1.Session session,
    List<Environment> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Environment>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Environment] and returns the inserted row.
  ///
  /// The returned [Environment] will have its `id` field set.
  Future<Environment> insertRow(
    _i1.Session session,
    Environment row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Environment>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Environment]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Environment>> update(
    _i1.Session session,
    List<Environment> rows, {
    _i1.ColumnSelections<EnvironmentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Environment>(
      rows,
      columns: columns?.call(Environment.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Environment]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Environment> updateRow(
    _i1.Session session,
    Environment row, {
    _i1.ColumnSelections<EnvironmentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Environment>(
      row,
      columns: columns?.call(Environment.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Environment] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Environment?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<EnvironmentUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Environment>(
      id,
      columnValues: columnValues(Environment.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Environment]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Environment>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<EnvironmentUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<EnvironmentTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EnvironmentTable>? orderBy,
    _i1.OrderByListBuilder<EnvironmentTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Environment>(
      columnValues: columnValues(Environment.t.updateTable),
      where: where(Environment.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Environment.t),
      orderByList: orderByList?.call(Environment.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Environment]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Environment>> delete(
    _i1.Session session,
    List<Environment> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Environment>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Environment].
  Future<Environment> deleteRow(
    _i1.Session session,
    Environment row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Environment>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Environment>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<EnvironmentTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Environment>(
      where: where(Environment.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EnvironmentTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Environment>(
      where: where?.call(Environment.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
