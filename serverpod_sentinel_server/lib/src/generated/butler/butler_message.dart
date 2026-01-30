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
import '../butler/butler_conversation.dart' as _i2;
import 'package:serverpod_sentinel_server/src/generated/protocol.dart' as _i3;

abstract class ButlerMessage
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ButlerMessage._({
    this.id,
    required this.conversationId,
    this.conversation,
    required this.role,
    required this.content,
    this.metadata,
    required this.createdAt,
  });

  factory ButlerMessage({
    int? id,
    required int conversationId,
    _i2.ButlerConversation? conversation,
    required String role,
    required String content,
    String? metadata,
    required DateTime createdAt,
  }) = _ButlerMessageImpl;

  factory ButlerMessage.fromJson(Map<String, dynamic> jsonSerialization) {
    return ButlerMessage(
      id: jsonSerialization['id'] as int?,
      conversationId: jsonSerialization['conversationId'] as int,
      conversation: jsonSerialization['conversation'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.ButlerConversation>(
              jsonSerialization['conversation'],
            ),
      role: jsonSerialization['role'] as String,
      content: jsonSerialization['content'] as String,
      metadata: jsonSerialization['metadata'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = ButlerMessageTable();

  static const db = ButlerMessageRepository._();

  @override
  int? id;

  int conversationId;

  _i2.ButlerConversation? conversation;

  String role;

  String content;

  String? metadata;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ButlerMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ButlerMessage copyWith({
    int? id,
    int? conversationId,
    _i2.ButlerConversation? conversation,
    String? role,
    String? content,
    String? metadata,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ButlerMessage',
      if (id != null) 'id': id,
      'conversationId': conversationId,
      if (conversation != null) 'conversation': conversation?.toJson(),
      'role': role,
      'content': content,
      if (metadata != null) 'metadata': metadata,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ButlerMessage',
      if (id != null) 'id': id,
      'conversationId': conversationId,
      if (conversation != null)
        'conversation': conversation?.toJsonForProtocol(),
      'role': role,
      'content': content,
      if (metadata != null) 'metadata': metadata,
      'createdAt': createdAt.toJson(),
    };
  }

  static ButlerMessageInclude include({
    _i2.ButlerConversationInclude? conversation,
  }) {
    return ButlerMessageInclude._(conversation: conversation);
  }

  static ButlerMessageIncludeList includeList({
    _i1.WhereExpressionBuilder<ButlerMessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ButlerMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ButlerMessageTable>? orderByList,
    ButlerMessageInclude? include,
  }) {
    return ButlerMessageIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ButlerMessage.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ButlerMessage.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ButlerMessageImpl extends ButlerMessage {
  _ButlerMessageImpl({
    int? id,
    required int conversationId,
    _i2.ButlerConversation? conversation,
    required String role,
    required String content,
    String? metadata,
    required DateTime createdAt,
  }) : super._(
         id: id,
         conversationId: conversationId,
         conversation: conversation,
         role: role,
         content: content,
         metadata: metadata,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [ButlerMessage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ButlerMessage copyWith({
    Object? id = _Undefined,
    int? conversationId,
    Object? conversation = _Undefined,
    String? role,
    String? content,
    Object? metadata = _Undefined,
    DateTime? createdAt,
  }) {
    return ButlerMessage(
      id: id is int? ? id : this.id,
      conversationId: conversationId ?? this.conversationId,
      conversation: conversation is _i2.ButlerConversation?
          ? conversation
          : this.conversation?.copyWith(),
      role: role ?? this.role,
      content: content ?? this.content,
      metadata: metadata is String? ? metadata : this.metadata,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class ButlerMessageUpdateTable extends _i1.UpdateTable<ButlerMessageTable> {
  ButlerMessageUpdateTable(super.table);

  _i1.ColumnValue<int, int> conversationId(int value) => _i1.ColumnValue(
    table.conversationId,
    value,
  );

  _i1.ColumnValue<String, String> role(String value) => _i1.ColumnValue(
    table.role,
    value,
  );

  _i1.ColumnValue<String, String> content(String value) => _i1.ColumnValue(
    table.content,
    value,
  );

  _i1.ColumnValue<String, String> metadata(String? value) => _i1.ColumnValue(
    table.metadata,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class ButlerMessageTable extends _i1.Table<int?> {
  ButlerMessageTable({super.tableRelation})
    : super(tableName: 'butler_messages') {
    updateTable = ButlerMessageUpdateTable(this);
    conversationId = _i1.ColumnInt(
      'conversationId',
      this,
    );
    role = _i1.ColumnString(
      'role',
      this,
    );
    content = _i1.ColumnString(
      'content',
      this,
    );
    metadata = _i1.ColumnString(
      'metadata',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final ButlerMessageUpdateTable updateTable;

  late final _i1.ColumnInt conversationId;

  _i2.ButlerConversationTable? _conversation;

  late final _i1.ColumnString role;

  late final _i1.ColumnString content;

  late final _i1.ColumnString metadata;

  late final _i1.ColumnDateTime createdAt;

  _i2.ButlerConversationTable get conversation {
    if (_conversation != null) return _conversation!;
    _conversation = _i1.createRelationTable(
      relationFieldName: 'conversation',
      field: ButlerMessage.t.conversationId,
      foreignField: _i2.ButlerConversation.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ButlerConversationTable(tableRelation: foreignTableRelation),
    );
    return _conversation!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    conversationId,
    role,
    content,
    metadata,
    createdAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'conversation') {
      return conversation;
    }
    return null;
  }
}

class ButlerMessageInclude extends _i1.IncludeObject {
  ButlerMessageInclude._({_i2.ButlerConversationInclude? conversation}) {
    _conversation = conversation;
  }

  _i2.ButlerConversationInclude? _conversation;

  @override
  Map<String, _i1.Include?> get includes => {'conversation': _conversation};

  @override
  _i1.Table<int?> get table => ButlerMessage.t;
}

class ButlerMessageIncludeList extends _i1.IncludeList {
  ButlerMessageIncludeList._({
    _i1.WhereExpressionBuilder<ButlerMessageTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ButlerMessage.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ButlerMessage.t;
}

class ButlerMessageRepository {
  const ButlerMessageRepository._();

  final attachRow = const ButlerMessageAttachRowRepository._();

  /// Returns a list of [ButlerMessage]s matching the given query parameters.
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
  Future<List<ButlerMessage>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ButlerMessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ButlerMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ButlerMessageTable>? orderByList,
    _i1.Transaction? transaction,
    ButlerMessageInclude? include,
  }) async {
    return session.db.find<ButlerMessage>(
      where: where?.call(ButlerMessage.t),
      orderBy: orderBy?.call(ButlerMessage.t),
      orderByList: orderByList?.call(ButlerMessage.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ButlerMessage] matching the given query parameters.
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
  Future<ButlerMessage?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ButlerMessageTable>? where,
    int? offset,
    _i1.OrderByBuilder<ButlerMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ButlerMessageTable>? orderByList,
    _i1.Transaction? transaction,
    ButlerMessageInclude? include,
  }) async {
    return session.db.findFirstRow<ButlerMessage>(
      where: where?.call(ButlerMessage.t),
      orderBy: orderBy?.call(ButlerMessage.t),
      orderByList: orderByList?.call(ButlerMessage.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ButlerMessage] by its [id] or null if no such row exists.
  Future<ButlerMessage?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ButlerMessageInclude? include,
  }) async {
    return session.db.findById<ButlerMessage>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ButlerMessage]s in the list and returns the inserted rows.
  ///
  /// The returned [ButlerMessage]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ButlerMessage>> insert(
    _i1.Session session,
    List<ButlerMessage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ButlerMessage>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ButlerMessage] and returns the inserted row.
  ///
  /// The returned [ButlerMessage] will have its `id` field set.
  Future<ButlerMessage> insertRow(
    _i1.Session session,
    ButlerMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ButlerMessage>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ButlerMessage]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ButlerMessage>> update(
    _i1.Session session,
    List<ButlerMessage> rows, {
    _i1.ColumnSelections<ButlerMessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ButlerMessage>(
      rows,
      columns: columns?.call(ButlerMessage.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ButlerMessage]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ButlerMessage> updateRow(
    _i1.Session session,
    ButlerMessage row, {
    _i1.ColumnSelections<ButlerMessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ButlerMessage>(
      row,
      columns: columns?.call(ButlerMessage.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ButlerMessage] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ButlerMessage?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<ButlerMessageUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ButlerMessage>(
      id,
      columnValues: columnValues(ButlerMessage.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ButlerMessage]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ButlerMessage>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ButlerMessageUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ButlerMessageTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ButlerMessageTable>? orderBy,
    _i1.OrderByListBuilder<ButlerMessageTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ButlerMessage>(
      columnValues: columnValues(ButlerMessage.t.updateTable),
      where: where(ButlerMessage.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ButlerMessage.t),
      orderByList: orderByList?.call(ButlerMessage.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ButlerMessage]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ButlerMessage>> delete(
    _i1.Session session,
    List<ButlerMessage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ButlerMessage>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ButlerMessage].
  Future<ButlerMessage> deleteRow(
    _i1.Session session,
    ButlerMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ButlerMessage>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ButlerMessage>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ButlerMessageTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ButlerMessage>(
      where: where(ButlerMessage.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ButlerMessageTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ButlerMessage>(
      where: where?.call(ButlerMessage.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ButlerMessageAttachRowRepository {
  const ButlerMessageAttachRowRepository._();

  /// Creates a relation between the given [ButlerMessage] and [ButlerConversation]
  /// by setting the [ButlerMessage]'s foreign key `conversationId` to refer to the [ButlerConversation].
  Future<void> conversation(
    _i1.Session session,
    ButlerMessage butlerMessage,
    _i2.ButlerConversation conversation, {
    _i1.Transaction? transaction,
  }) async {
    if (butlerMessage.id == null) {
      throw ArgumentError.notNull('butlerMessage.id');
    }
    if (conversation.id == null) {
      throw ArgumentError.notNull('conversation.id');
    }

    var $butlerMessage = butlerMessage.copyWith(
      conversationId: conversation.id,
    );
    await session.db.updateRow<ButlerMessage>(
      $butlerMessage,
      columns: [ButlerMessage.t.conversationId],
      transaction: transaction,
    );
  }
}
