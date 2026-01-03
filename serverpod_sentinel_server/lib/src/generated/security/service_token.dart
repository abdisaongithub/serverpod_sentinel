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
import '../service/service.dart' as _i2;
import 'package:serverpod_sentinel_server/src/generated/protocol.dart' as _i3;

/// API credentials for Services (Agents).
abstract class ServiceToken
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ServiceToken._({
    this.id,
    required this.name,
    required this.token,
    required this.serviceId,
    required this.serviceId,
    this.service,
    this.lastUsedAt,
    this.expiresAt,
    required this.createdAt,
  });

  factory ServiceToken({
    int? id,
    required String name,
    required String token,
    required int serviceId,
    required int serviceId,
    _i2.Service? service,
    DateTime? lastUsedAt,
    DateTime? expiresAt,
    required DateTime createdAt,
  }) = _ServiceTokenImpl;

  factory ServiceToken.fromJson(Map<String, dynamic> jsonSerialization) {
    return ServiceToken(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      token: jsonSerialization['token'] as String,
      serviceId: jsonSerialization['serviceId'] as int,
      service: jsonSerialization['service'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.Service>(
              jsonSerialization['service'],
            ),
      lastUsedAt: jsonSerialization['lastUsedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['lastUsedAt']),
      expiresAt: jsonSerialization['expiresAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expiresAt']),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = ServiceTokenTable();

  static const db = ServiceTokenRepository._();

  @override
  int? id;

  String name;

  String token;

  int serviceId;

  int serviceId;

  _i2.Service? service;

  DateTime? lastUsedAt;

  DateTime? expiresAt;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ServiceToken]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ServiceToken copyWith({
    int? id,
    String? name,
    String? token,
    int? serviceId,
    int? serviceId,
    _i2.Service? service,
    DateTime? lastUsedAt,
    DateTime? expiresAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ServiceToken',
      if (id != null) 'id': id,
      'name': name,
      'token': token,
      'serviceId': serviceId,
      'serviceId': serviceId,
      if (service != null) 'service': service?.toJson(),
      if (lastUsedAt != null) 'lastUsedAt': lastUsedAt?.toJson(),
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ServiceToken',
      if (id != null) 'id': id,
      'name': name,
      'token': token,
      'serviceId': serviceId,
      'serviceId': serviceId,
      if (service != null) 'service': service?.toJsonForProtocol(),
      if (lastUsedAt != null) 'lastUsedAt': lastUsedAt?.toJson(),
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  static ServiceTokenInclude include({_i2.ServiceInclude? service}) {
    return ServiceTokenInclude._(service: service);
  }

  static ServiceTokenIncludeList includeList({
    _i1.WhereExpressionBuilder<ServiceTokenTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ServiceTokenTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ServiceTokenTable>? orderByList,
    ServiceTokenInclude? include,
  }) {
    return ServiceTokenIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ServiceToken.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ServiceToken.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ServiceTokenImpl extends ServiceToken {
  _ServiceTokenImpl({
    int? id,
    required String name,
    required String token,
    required int serviceId,
    required int serviceId,
    _i2.Service? service,
    DateTime? lastUsedAt,
    DateTime? expiresAt,
    required DateTime createdAt,
  }) : super._(
         id: id,
         name: name,
         token: token,
         serviceId: serviceId,
         service: service,
         lastUsedAt: lastUsedAt,
         expiresAt: expiresAt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [ServiceToken]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ServiceToken copyWith({
    Object? id = _Undefined,
    String? name,
    String? token,
    int? serviceId,
    int? serviceId,
    Object? service = _Undefined,
    Object? lastUsedAt = _Undefined,
    Object? expiresAt = _Undefined,
    DateTime? createdAt,
  }) {
    return ServiceToken(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      token: token ?? this.token,
      serviceId: serviceId ?? this.serviceId,
      service: service is _i2.Service? ? service : this.service?.copyWith(),
      lastUsedAt: lastUsedAt is DateTime? ? lastUsedAt : this.lastUsedAt,
      expiresAt: expiresAt is DateTime? ? expiresAt : this.expiresAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class ServiceTokenUpdateTable extends _i1.UpdateTable<ServiceTokenTable> {
  ServiceTokenUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> token(String value) => _i1.ColumnValue(
    table.token,
    value,
  );

  _i1.ColumnValue<int, int> serviceId(int value) => _i1.ColumnValue(
    table.serviceId,
    value,
  );

  _i1.ColumnValue<int, int> serviceId(int value) => _i1.ColumnValue(
    table.serviceId,
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
}

class ServiceTokenTable extends _i1.Table<int?> {
  ServiceTokenTable({super.tableRelation}) : super(tableName: 'service_token') {
    updateTable = ServiceTokenUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    token = _i1.ColumnString(
      'token',
      this,
    );
    serviceId = _i1.ColumnInt(
      'serviceId',
      this,
    );
    serviceId = _i1.ColumnInt(
      'serviceId',
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
  }

  late final ServiceTokenUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnString token;

  late final _i1.ColumnInt serviceId;

  late final _i1.ColumnInt serviceId;

  _i2.ServiceTable? _service;

  late final _i1.ColumnDateTime lastUsedAt;

  late final _i1.ColumnDateTime expiresAt;

  late final _i1.ColumnDateTime createdAt;

  _i2.ServiceTable get service {
    if (_service != null) return _service!;
    _service = _i1.createRelationTable(
      relationFieldName: 'service',
      field: ServiceToken.t.serviceId,
      foreignField: _i2.Service.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ServiceTable(tableRelation: foreignTableRelation),
    );
    return _service!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    token,
    serviceId,
    serviceId,
    lastUsedAt,
    expiresAt,
    createdAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'service') {
      return service;
    }
    return null;
  }
}

class ServiceTokenInclude extends _i1.IncludeObject {
  ServiceTokenInclude._({_i2.ServiceInclude? service}) {
    _service = service;
  }

  _i2.ServiceInclude? _service;

  @override
  Map<String, _i1.Include?> get includes => {'service': _service};

  @override
  _i1.Table<int?> get table => ServiceToken.t;
}

class ServiceTokenIncludeList extends _i1.IncludeList {
  ServiceTokenIncludeList._({
    _i1.WhereExpressionBuilder<ServiceTokenTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ServiceToken.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ServiceToken.t;
}

class ServiceTokenRepository {
  const ServiceTokenRepository._();

  final attachRow = const ServiceTokenAttachRowRepository._();

  /// Returns a list of [ServiceToken]s matching the given query parameters.
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
  Future<List<ServiceToken>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ServiceTokenTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ServiceTokenTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ServiceTokenTable>? orderByList,
    _i1.Transaction? transaction,
    ServiceTokenInclude? include,
  }) async {
    return session.db.find<ServiceToken>(
      where: where?.call(ServiceToken.t),
      orderBy: orderBy?.call(ServiceToken.t),
      orderByList: orderByList?.call(ServiceToken.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ServiceToken] matching the given query parameters.
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
  Future<ServiceToken?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ServiceTokenTable>? where,
    int? offset,
    _i1.OrderByBuilder<ServiceTokenTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ServiceTokenTable>? orderByList,
    _i1.Transaction? transaction,
    ServiceTokenInclude? include,
  }) async {
    return session.db.findFirstRow<ServiceToken>(
      where: where?.call(ServiceToken.t),
      orderBy: orderBy?.call(ServiceToken.t),
      orderByList: orderByList?.call(ServiceToken.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ServiceToken] by its [id] or null if no such row exists.
  Future<ServiceToken?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ServiceTokenInclude? include,
  }) async {
    return session.db.findById<ServiceToken>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ServiceToken]s in the list and returns the inserted rows.
  ///
  /// The returned [ServiceToken]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ServiceToken>> insert(
    _i1.Session session,
    List<ServiceToken> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ServiceToken>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ServiceToken] and returns the inserted row.
  ///
  /// The returned [ServiceToken] will have its `id` field set.
  Future<ServiceToken> insertRow(
    _i1.Session session,
    ServiceToken row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ServiceToken>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ServiceToken]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ServiceToken>> update(
    _i1.Session session,
    List<ServiceToken> rows, {
    _i1.ColumnSelections<ServiceTokenTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ServiceToken>(
      rows,
      columns: columns?.call(ServiceToken.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ServiceToken]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ServiceToken> updateRow(
    _i1.Session session,
    ServiceToken row, {
    _i1.ColumnSelections<ServiceTokenTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ServiceToken>(
      row,
      columns: columns?.call(ServiceToken.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ServiceToken] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ServiceToken?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<ServiceTokenUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ServiceToken>(
      id,
      columnValues: columnValues(ServiceToken.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ServiceToken]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ServiceToken>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ServiceTokenUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ServiceTokenTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ServiceTokenTable>? orderBy,
    _i1.OrderByListBuilder<ServiceTokenTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ServiceToken>(
      columnValues: columnValues(ServiceToken.t.updateTable),
      where: where(ServiceToken.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ServiceToken.t),
      orderByList: orderByList?.call(ServiceToken.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ServiceToken]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ServiceToken>> delete(
    _i1.Session session,
    List<ServiceToken> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ServiceToken>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ServiceToken].
  Future<ServiceToken> deleteRow(
    _i1.Session session,
    ServiceToken row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ServiceToken>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ServiceToken>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ServiceTokenTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ServiceToken>(
      where: where(ServiceToken.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ServiceTokenTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ServiceToken>(
      where: where?.call(ServiceToken.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ServiceTokenAttachRowRepository {
  const ServiceTokenAttachRowRepository._();

  /// Creates a relation between the given [ServiceToken] and [Service]
  /// by setting the [ServiceToken]'s foreign key `serviceId` to refer to the [Service].
  Future<void> service(
    _i1.Session session,
    ServiceToken serviceToken,
    _i2.Service service, {
    _i1.Transaction? transaction,
  }) async {
    if (serviceToken.id == null) {
      throw ArgumentError.notNull('serviceToken.id');
    }
    if (service.id == null) {
      throw ArgumentError.notNull('service.id');
    }

    var $serviceToken = serviceToken.copyWith(serviceId: service.id);
    await session.db.updateRow<ServiceToken>(
      $serviceToken,
      columns: [ServiceToken.t.serviceId],
      transaction: transaction,
    );
  }
}
