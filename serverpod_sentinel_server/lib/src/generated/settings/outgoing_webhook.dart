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

/// Outgoing webhooks to notify external systems of platform events.
abstract class OutgoingWebhook
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  OutgoingWebhook._({
    this.id,
    required this.name,
    required this.url,
    required this.events,
    this.secret,
    required this.isEnabled,
    this.lastTriggeredAt,
    this.lastResponseCode,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OutgoingWebhook({
    int? id,
    required String name,
    required String url,
    required List<String> events,
    String? secret,
    required bool isEnabled,
    DateTime? lastTriggeredAt,
    int? lastResponseCode,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _OutgoingWebhookImpl;

  factory OutgoingWebhook.fromJson(Map<String, dynamic> jsonSerialization) {
    return OutgoingWebhook(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      url: jsonSerialization['url'] as String,
      events: _i2.Protocol().deserialize<List<String>>(
        jsonSerialization['events'],
      ),
      secret: jsonSerialization['secret'] as String?,
      isEnabled: jsonSerialization['isEnabled'] as bool,
      lastTriggeredAt: jsonSerialization['lastTriggeredAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastTriggeredAt'],
            ),
      lastResponseCode: jsonSerialization['lastResponseCode'] as int?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  static final t = OutgoingWebhookTable();

  static const db = OutgoingWebhookRepository._();

  @override
  int? id;

  String name;

  String url;

  List<String> events;

  String? secret;

  bool isEnabled;

  DateTime? lastTriggeredAt;

  int? lastResponseCode;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [OutgoingWebhook]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  OutgoingWebhook copyWith({
    int? id,
    String? name,
    String? url,
    List<String>? events,
    String? secret,
    bool? isEnabled,
    DateTime? lastTriggeredAt,
    int? lastResponseCode,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'OutgoingWebhook',
      if (id != null) 'id': id,
      'name': name,
      'url': url,
      'events': events.toJson(),
      if (secret != null) 'secret': secret,
      'isEnabled': isEnabled,
      if (lastTriggeredAt != null) 'lastTriggeredAt': lastTriggeredAt?.toJson(),
      if (lastResponseCode != null) 'lastResponseCode': lastResponseCode,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'OutgoingWebhook',
      if (id != null) 'id': id,
      'name': name,
      'url': url,
      'events': events.toJson(),
      if (secret != null) 'secret': secret,
      'isEnabled': isEnabled,
      if (lastTriggeredAt != null) 'lastTriggeredAt': lastTriggeredAt?.toJson(),
      if (lastResponseCode != null) 'lastResponseCode': lastResponseCode,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static OutgoingWebhookInclude include() {
    return OutgoingWebhookInclude._();
  }

  static OutgoingWebhookIncludeList includeList({
    _i1.WhereExpressionBuilder<OutgoingWebhookTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OutgoingWebhookTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OutgoingWebhookTable>? orderByList,
    OutgoingWebhookInclude? include,
  }) {
    return OutgoingWebhookIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(OutgoingWebhook.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(OutgoingWebhook.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _OutgoingWebhookImpl extends OutgoingWebhook {
  _OutgoingWebhookImpl({
    int? id,
    required String name,
    required String url,
    required List<String> events,
    String? secret,
    required bool isEnabled,
    DateTime? lastTriggeredAt,
    int? lastResponseCode,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         name: name,
         url: url,
         events: events,
         secret: secret,
         isEnabled: isEnabled,
         lastTriggeredAt: lastTriggeredAt,
         lastResponseCode: lastResponseCode,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [OutgoingWebhook]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  OutgoingWebhook copyWith({
    Object? id = _Undefined,
    String? name,
    String? url,
    List<String>? events,
    Object? secret = _Undefined,
    bool? isEnabled,
    Object? lastTriggeredAt = _Undefined,
    Object? lastResponseCode = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return OutgoingWebhook(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      url: url ?? this.url,
      events: events ?? this.events.map((e0) => e0).toList(),
      secret: secret is String? ? secret : this.secret,
      isEnabled: isEnabled ?? this.isEnabled,
      lastTriggeredAt: lastTriggeredAt is DateTime?
          ? lastTriggeredAt
          : this.lastTriggeredAt,
      lastResponseCode: lastResponseCode is int?
          ? lastResponseCode
          : this.lastResponseCode,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class OutgoingWebhookUpdateTable extends _i1.UpdateTable<OutgoingWebhookTable> {
  OutgoingWebhookUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> url(String value) => _i1.ColumnValue(
    table.url,
    value,
  );

  _i1.ColumnValue<List<String>, List<String>> events(List<String> value) =>
      _i1.ColumnValue(
        table.events,
        value,
      );

  _i1.ColumnValue<String, String> secret(String? value) => _i1.ColumnValue(
    table.secret,
    value,
  );

  _i1.ColumnValue<bool, bool> isEnabled(bool value) => _i1.ColumnValue(
    table.isEnabled,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> lastTriggeredAt(DateTime? value) =>
      _i1.ColumnValue(
        table.lastTriggeredAt,
        value,
      );

  _i1.ColumnValue<int, int> lastResponseCode(int? value) => _i1.ColumnValue(
    table.lastResponseCode,
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

class OutgoingWebhookTable extends _i1.Table<int?> {
  OutgoingWebhookTable({super.tableRelation})
    : super(tableName: 'outgoing_webhook') {
    updateTable = OutgoingWebhookUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    url = _i1.ColumnString(
      'url',
      this,
    );
    events = _i1.ColumnSerializable<List<String>>(
      'events',
      this,
    );
    secret = _i1.ColumnString(
      'secret',
      this,
    );
    isEnabled = _i1.ColumnBool(
      'isEnabled',
      this,
    );
    lastTriggeredAt = _i1.ColumnDateTime(
      'lastTriggeredAt',
      this,
    );
    lastResponseCode = _i1.ColumnInt(
      'lastResponseCode',
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

  late final OutgoingWebhookUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnString url;

  late final _i1.ColumnSerializable<List<String>> events;

  late final _i1.ColumnString secret;

  late final _i1.ColumnBool isEnabled;

  late final _i1.ColumnDateTime lastTriggeredAt;

  late final _i1.ColumnInt lastResponseCode;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    url,
    events,
    secret,
    isEnabled,
    lastTriggeredAt,
    lastResponseCode,
    createdAt,
    updatedAt,
  ];
}

class OutgoingWebhookInclude extends _i1.IncludeObject {
  OutgoingWebhookInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => OutgoingWebhook.t;
}

class OutgoingWebhookIncludeList extends _i1.IncludeList {
  OutgoingWebhookIncludeList._({
    _i1.WhereExpressionBuilder<OutgoingWebhookTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(OutgoingWebhook.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => OutgoingWebhook.t;
}

class OutgoingWebhookRepository {
  const OutgoingWebhookRepository._();

  /// Returns a list of [OutgoingWebhook]s matching the given query parameters.
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
  Future<List<OutgoingWebhook>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OutgoingWebhookTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OutgoingWebhookTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OutgoingWebhookTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<OutgoingWebhook>(
      where: where?.call(OutgoingWebhook.t),
      orderBy: orderBy?.call(OutgoingWebhook.t),
      orderByList: orderByList?.call(OutgoingWebhook.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [OutgoingWebhook] matching the given query parameters.
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
  Future<OutgoingWebhook?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OutgoingWebhookTable>? where,
    int? offset,
    _i1.OrderByBuilder<OutgoingWebhookTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OutgoingWebhookTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<OutgoingWebhook>(
      where: where?.call(OutgoingWebhook.t),
      orderBy: orderBy?.call(OutgoingWebhook.t),
      orderByList: orderByList?.call(OutgoingWebhook.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [OutgoingWebhook] by its [id] or null if no such row exists.
  Future<OutgoingWebhook?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<OutgoingWebhook>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [OutgoingWebhook]s in the list and returns the inserted rows.
  ///
  /// The returned [OutgoingWebhook]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<OutgoingWebhook>> insert(
    _i1.Session session,
    List<OutgoingWebhook> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<OutgoingWebhook>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [OutgoingWebhook] and returns the inserted row.
  ///
  /// The returned [OutgoingWebhook] will have its `id` field set.
  Future<OutgoingWebhook> insertRow(
    _i1.Session session,
    OutgoingWebhook row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<OutgoingWebhook>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [OutgoingWebhook]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<OutgoingWebhook>> update(
    _i1.Session session,
    List<OutgoingWebhook> rows, {
    _i1.ColumnSelections<OutgoingWebhookTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<OutgoingWebhook>(
      rows,
      columns: columns?.call(OutgoingWebhook.t),
      transaction: transaction,
    );
  }

  /// Updates a single [OutgoingWebhook]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<OutgoingWebhook> updateRow(
    _i1.Session session,
    OutgoingWebhook row, {
    _i1.ColumnSelections<OutgoingWebhookTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<OutgoingWebhook>(
      row,
      columns: columns?.call(OutgoingWebhook.t),
      transaction: transaction,
    );
  }

  /// Updates a single [OutgoingWebhook] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<OutgoingWebhook?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<OutgoingWebhookUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<OutgoingWebhook>(
      id,
      columnValues: columnValues(OutgoingWebhook.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [OutgoingWebhook]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<OutgoingWebhook>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<OutgoingWebhookUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<OutgoingWebhookTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OutgoingWebhookTable>? orderBy,
    _i1.OrderByListBuilder<OutgoingWebhookTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<OutgoingWebhook>(
      columnValues: columnValues(OutgoingWebhook.t.updateTable),
      where: where(OutgoingWebhook.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(OutgoingWebhook.t),
      orderByList: orderByList?.call(OutgoingWebhook.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [OutgoingWebhook]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<OutgoingWebhook>> delete(
    _i1.Session session,
    List<OutgoingWebhook> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<OutgoingWebhook>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [OutgoingWebhook].
  Future<OutgoingWebhook> deleteRow(
    _i1.Session session,
    OutgoingWebhook row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<OutgoingWebhook>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<OutgoingWebhook>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<OutgoingWebhookTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<OutgoingWebhook>(
      where: where(OutgoingWebhook.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OutgoingWebhookTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<OutgoingWebhook>(
      where: where?.call(OutgoingWebhook.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
