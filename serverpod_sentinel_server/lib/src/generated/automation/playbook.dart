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
import '../enums/playbook_type.dart' as _i2;
import '../automation/playbook_execution.dart' as _i3;
import 'package:serverpod_sentinel_server/src/generated/protocol.dart' as _i4;

/// A template for response procedures (manual checklists or automated scripts).
abstract class Playbook
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Playbook._({
    this.id,
    required this.name,
    this.description,
    required this.type,
    required this.content,
    this.executions,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Playbook({
    int? id,
    required String name,
    String? description,
    required _i2.PlaybookType type,
    required String content,
    List<_i3.PlaybookExecution>? executions,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PlaybookImpl;

  factory Playbook.fromJson(Map<String, dynamic> jsonSerialization) {
    return Playbook(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      type: _i2.PlaybookType.fromJson((jsonSerialization['type'] as String)),
      content: jsonSerialization['content'] as String,
      executions: jsonSerialization['executions'] == null
          ? null
          : _i4.Protocol().deserialize<List<_i3.PlaybookExecution>>(
              jsonSerialization['executions'],
            ),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  static final t = PlaybookTable();

  static const db = PlaybookRepository._();

  @override
  int? id;

  String name;

  String? description;

  _i2.PlaybookType type;

  String content;

  List<_i3.PlaybookExecution>? executions;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Playbook]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Playbook copyWith({
    int? id,
    String? name,
    String? description,
    _i2.PlaybookType? type,
    String? content,
    List<_i3.PlaybookExecution>? executions,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Playbook',
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'type': type.toJson(),
      'content': content,
      if (executions != null)
        'executions': executions?.toJson(valueToJson: (v) => v.toJson()),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Playbook',
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'type': type.toJson(),
      'content': content,
      if (executions != null)
        'executions': executions?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static PlaybookInclude include({
    _i3.PlaybookExecutionIncludeList? executions,
  }) {
    return PlaybookInclude._(executions: executions);
  }

  static PlaybookIncludeList includeList({
    _i1.WhereExpressionBuilder<PlaybookTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlaybookTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlaybookTable>? orderByList,
    PlaybookInclude? include,
  }) {
    return PlaybookIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Playbook.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Playbook.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PlaybookImpl extends Playbook {
  _PlaybookImpl({
    int? id,
    required String name,
    String? description,
    required _i2.PlaybookType type,
    required String content,
    List<_i3.PlaybookExecution>? executions,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         name: name,
         description: description,
         type: type,
         content: content,
         executions: executions,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Playbook]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Playbook copyWith({
    Object? id = _Undefined,
    String? name,
    Object? description = _Undefined,
    _i2.PlaybookType? type,
    String? content,
    Object? executions = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Playbook(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      type: type ?? this.type,
      content: content ?? this.content,
      executions: executions is List<_i3.PlaybookExecution>?
          ? executions
          : this.executions?.map((e0) => e0.copyWith()).toList(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class PlaybookUpdateTable extends _i1.UpdateTable<PlaybookTable> {
  PlaybookUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> description(String? value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<_i2.PlaybookType, _i2.PlaybookType> type(
    _i2.PlaybookType value,
  ) => _i1.ColumnValue(
    table.type,
    value,
  );

  _i1.ColumnValue<String, String> content(String value) => _i1.ColumnValue(
    table.content,
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

class PlaybookTable extends _i1.Table<int?> {
  PlaybookTable({super.tableRelation}) : super(tableName: 'playbook') {
    updateTable = PlaybookUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
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
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final PlaybookUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnEnum<_i2.PlaybookType> type;

  late final _i1.ColumnString content;

  _i3.PlaybookExecutionTable? ___executions;

  _i1.ManyRelation<_i3.PlaybookExecutionTable>? _executions;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i3.PlaybookExecutionTable get __executions {
    if (___executions != null) return ___executions!;
    ___executions = _i1.createRelationTable(
      relationFieldName: '__executions',
      field: Playbook.t.id,
      foreignField: _i3.PlaybookExecution.t.$_playbookExecutionsPlaybookId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.PlaybookExecutionTable(tableRelation: foreignTableRelation),
    );
    return ___executions!;
  }

  _i1.ManyRelation<_i3.PlaybookExecutionTable> get executions {
    if (_executions != null) return _executions!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'executions',
      field: Playbook.t.id,
      foreignField: _i3.PlaybookExecution.t.$_playbookExecutionsPlaybookId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.PlaybookExecutionTable(tableRelation: foreignTableRelation),
    );
    _executions = _i1.ManyRelation<_i3.PlaybookExecutionTable>(
      tableWithRelations: relationTable,
      table: _i3.PlaybookExecutionTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _executions!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    description,
    type,
    content,
    createdAt,
    updatedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'executions') {
      return __executions;
    }
    return null;
  }
}

class PlaybookInclude extends _i1.IncludeObject {
  PlaybookInclude._({_i3.PlaybookExecutionIncludeList? executions}) {
    _executions = executions;
  }

  _i3.PlaybookExecutionIncludeList? _executions;

  @override
  Map<String, _i1.Include?> get includes => {'executions': _executions};

  @override
  _i1.Table<int?> get table => Playbook.t;
}

class PlaybookIncludeList extends _i1.IncludeList {
  PlaybookIncludeList._({
    _i1.WhereExpressionBuilder<PlaybookTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Playbook.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Playbook.t;
}

class PlaybookRepository {
  const PlaybookRepository._();

  final attach = const PlaybookAttachRepository._();

  final attachRow = const PlaybookAttachRowRepository._();

  final detach = const PlaybookDetachRepository._();

  final detachRow = const PlaybookDetachRowRepository._();

  /// Returns a list of [Playbook]s matching the given query parameters.
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
  Future<List<Playbook>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlaybookTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlaybookTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlaybookTable>? orderByList,
    _i1.Transaction? transaction,
    PlaybookInclude? include,
  }) async {
    return session.db.find<Playbook>(
      where: where?.call(Playbook.t),
      orderBy: orderBy?.call(Playbook.t),
      orderByList: orderByList?.call(Playbook.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Playbook] matching the given query parameters.
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
  Future<Playbook?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlaybookTable>? where,
    int? offset,
    _i1.OrderByBuilder<PlaybookTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlaybookTable>? orderByList,
    _i1.Transaction? transaction,
    PlaybookInclude? include,
  }) async {
    return session.db.findFirstRow<Playbook>(
      where: where?.call(Playbook.t),
      orderBy: orderBy?.call(Playbook.t),
      orderByList: orderByList?.call(Playbook.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Playbook] by its [id] or null if no such row exists.
  Future<Playbook?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PlaybookInclude? include,
  }) async {
    return session.db.findById<Playbook>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Playbook]s in the list and returns the inserted rows.
  ///
  /// The returned [Playbook]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Playbook>> insert(
    _i1.Session session,
    List<Playbook> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Playbook>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Playbook] and returns the inserted row.
  ///
  /// The returned [Playbook] will have its `id` field set.
  Future<Playbook> insertRow(
    _i1.Session session,
    Playbook row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Playbook>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Playbook]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Playbook>> update(
    _i1.Session session,
    List<Playbook> rows, {
    _i1.ColumnSelections<PlaybookTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Playbook>(
      rows,
      columns: columns?.call(Playbook.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Playbook]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Playbook> updateRow(
    _i1.Session session,
    Playbook row, {
    _i1.ColumnSelections<PlaybookTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Playbook>(
      row,
      columns: columns?.call(Playbook.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Playbook] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Playbook?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<PlaybookUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Playbook>(
      id,
      columnValues: columnValues(Playbook.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Playbook]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Playbook>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<PlaybookUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<PlaybookTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlaybookTable>? orderBy,
    _i1.OrderByListBuilder<PlaybookTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Playbook>(
      columnValues: columnValues(Playbook.t.updateTable),
      where: where(Playbook.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Playbook.t),
      orderByList: orderByList?.call(Playbook.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Playbook]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Playbook>> delete(
    _i1.Session session,
    List<Playbook> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Playbook>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Playbook].
  Future<Playbook> deleteRow(
    _i1.Session session,
    Playbook row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Playbook>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Playbook>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PlaybookTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Playbook>(
      where: where(Playbook.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlaybookTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Playbook>(
      where: where?.call(Playbook.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PlaybookAttachRepository {
  const PlaybookAttachRepository._();

  /// Creates a relation between this [Playbook] and the given [PlaybookExecution]s
  /// by setting each [PlaybookExecution]'s foreign key `_playbookExecutionsPlaybookId` to refer to this [Playbook].
  Future<void> executions(
    _i1.Session session,
    Playbook playbook,
    List<_i3.PlaybookExecution> playbookExecution, {
    _i1.Transaction? transaction,
  }) async {
    if (playbookExecution.any((e) => e.id == null)) {
      throw ArgumentError.notNull('playbookExecution.id');
    }
    if (playbook.id == null) {
      throw ArgumentError.notNull('playbook.id');
    }

    var $playbookExecution = playbookExecution
        .map(
          (e) => _i3.PlaybookExecutionImplicit(
            e,
            $_playbookExecutionsPlaybookId: playbook.id,
          ),
        )
        .toList();
    await session.db.update<_i3.PlaybookExecution>(
      $playbookExecution,
      columns: [_i3.PlaybookExecution.t.$_playbookExecutionsPlaybookId],
      transaction: transaction,
    );
  }
}

class PlaybookAttachRowRepository {
  const PlaybookAttachRowRepository._();

  /// Creates a relation between this [Playbook] and the given [PlaybookExecution]
  /// by setting the [PlaybookExecution]'s foreign key `_playbookExecutionsPlaybookId` to refer to this [Playbook].
  Future<void> executions(
    _i1.Session session,
    Playbook playbook,
    _i3.PlaybookExecution playbookExecution, {
    _i1.Transaction? transaction,
  }) async {
    if (playbookExecution.id == null) {
      throw ArgumentError.notNull('playbookExecution.id');
    }
    if (playbook.id == null) {
      throw ArgumentError.notNull('playbook.id');
    }

    var $playbookExecution = _i3.PlaybookExecutionImplicit(
      playbookExecution,
      $_playbookExecutionsPlaybookId: playbook.id,
    );
    await session.db.updateRow<_i3.PlaybookExecution>(
      $playbookExecution,
      columns: [_i3.PlaybookExecution.t.$_playbookExecutionsPlaybookId],
      transaction: transaction,
    );
  }
}

class PlaybookDetachRepository {
  const PlaybookDetachRepository._();

  /// Detaches the relation between this [Playbook] and the given [PlaybookExecution]
  /// by setting the [PlaybookExecution]'s foreign key `_playbookExecutionsPlaybookId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> executions(
    _i1.Session session,
    List<_i3.PlaybookExecution> playbookExecution, {
    _i1.Transaction? transaction,
  }) async {
    if (playbookExecution.any((e) => e.id == null)) {
      throw ArgumentError.notNull('playbookExecution.id');
    }

    var $playbookExecution = playbookExecution
        .map(
          (e) => _i3.PlaybookExecutionImplicit(
            e,
            $_playbookExecutionsPlaybookId: null,
          ),
        )
        .toList();
    await session.db.update<_i3.PlaybookExecution>(
      $playbookExecution,
      columns: [_i3.PlaybookExecution.t.$_playbookExecutionsPlaybookId],
      transaction: transaction,
    );
  }
}

class PlaybookDetachRowRepository {
  const PlaybookDetachRowRepository._();

  /// Detaches the relation between this [Playbook] and the given [PlaybookExecution]
  /// by setting the [PlaybookExecution]'s foreign key `_playbookExecutionsPlaybookId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> executions(
    _i1.Session session,
    _i3.PlaybookExecution playbookExecution, {
    _i1.Transaction? transaction,
  }) async {
    if (playbookExecution.id == null) {
      throw ArgumentError.notNull('playbookExecution.id');
    }

    var $playbookExecution = _i3.PlaybookExecutionImplicit(
      playbookExecution,
      $_playbookExecutionsPlaybookId: null,
    );
    await session.db.updateRow<_i3.PlaybookExecution>(
      $playbookExecution,
      columns: [_i3.PlaybookExecution.t.$_playbookExecutionsPlaybookId],
      transaction: transaction,
    );
  }
}
