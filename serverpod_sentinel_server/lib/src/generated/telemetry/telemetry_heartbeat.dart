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
import '../enums/service_status.dart' as _i3;
import '../telemetry/telemetry_resources.dart' as _i4;
import 'package:serverpod_sentinel_server/src/generated/protocol.dart' as _i5;

/// Payload for agent heartbeat.
abstract class TelemetryHeartbeat
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  TelemetryHeartbeat._({
    this.id,
    required this.serviceId,
    this.service,
    required this.timestamp,
    required this.uptimeSeconds,
    required this.version,
    required this.status,
    this.resources,
  });

  factory TelemetryHeartbeat({
    int? id,
    required int serviceId,
    _i2.Service? service,
    required DateTime timestamp,
    required int uptimeSeconds,
    required String version,
    required _i3.ServiceStatus status,
    _i4.TelemetryResources? resources,
  }) = _TelemetryHeartbeatImpl;

  factory TelemetryHeartbeat.fromJson(Map<String, dynamic> jsonSerialization) {
    return TelemetryHeartbeat(
      id: jsonSerialization['id'] as int?,
      serviceId: jsonSerialization['serviceId'] as int,
      service: jsonSerialization['service'] == null
          ? null
          : _i5.Protocol().deserialize<_i2.Service>(
              jsonSerialization['service'],
            ),
      timestamp: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      uptimeSeconds: jsonSerialization['uptimeSeconds'] as int,
      version: jsonSerialization['version'] as String,
      status: _i3.ServiceStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      resources: jsonSerialization['resources'] == null
          ? null
          : _i5.Protocol().deserialize<_i4.TelemetryResources>(
              jsonSerialization['resources'],
            ),
    );
  }

  static final t = TelemetryHeartbeatTable();

  static const db = TelemetryHeartbeatRepository._();

  @override
  int? id;

  int serviceId;

  _i2.Service? service;

  DateTime timestamp;

  int uptimeSeconds;

  String version;

  _i3.ServiceStatus status;

  _i4.TelemetryResources? resources;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [TelemetryHeartbeat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TelemetryHeartbeat copyWith({
    int? id,
    int? serviceId,
    _i2.Service? service,
    DateTime? timestamp,
    int? uptimeSeconds,
    String? version,
    _i3.ServiceStatus? status,
    _i4.TelemetryResources? resources,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TelemetryHeartbeat',
      if (id != null) 'id': id,
      'serviceId': serviceId,
      if (service != null) 'service': service?.toJson(),
      'timestamp': timestamp.toJson(),
      'uptimeSeconds': uptimeSeconds,
      'version': version,
      'status': status.toJson(),
      if (resources != null) 'resources': resources?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TelemetryHeartbeat',
      if (id != null) 'id': id,
      'serviceId': serviceId,
      if (service != null) 'service': service?.toJsonForProtocol(),
      'timestamp': timestamp.toJson(),
      'uptimeSeconds': uptimeSeconds,
      'version': version,
      'status': status.toJson(),
      if (resources != null) 'resources': resources?.toJsonForProtocol(),
    };
  }

  static TelemetryHeartbeatInclude include({_i2.ServiceInclude? service}) {
    return TelemetryHeartbeatInclude._(service: service);
  }

  static TelemetryHeartbeatIncludeList includeList({
    _i1.WhereExpressionBuilder<TelemetryHeartbeatTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TelemetryHeartbeatTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TelemetryHeartbeatTable>? orderByList,
    TelemetryHeartbeatInclude? include,
  }) {
    return TelemetryHeartbeatIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TelemetryHeartbeat.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TelemetryHeartbeat.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TelemetryHeartbeatImpl extends TelemetryHeartbeat {
  _TelemetryHeartbeatImpl({
    int? id,
    required int serviceId,
    _i2.Service? service,
    required DateTime timestamp,
    required int uptimeSeconds,
    required String version,
    required _i3.ServiceStatus status,
    _i4.TelemetryResources? resources,
  }) : super._(
         id: id,
         serviceId: serviceId,
         service: service,
         timestamp: timestamp,
         uptimeSeconds: uptimeSeconds,
         version: version,
         status: status,
         resources: resources,
       );

  /// Returns a shallow copy of this [TelemetryHeartbeat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TelemetryHeartbeat copyWith({
    Object? id = _Undefined,
    int? serviceId,
    Object? service = _Undefined,
    DateTime? timestamp,
    int? uptimeSeconds,
    String? version,
    _i3.ServiceStatus? status,
    Object? resources = _Undefined,
  }) {
    return TelemetryHeartbeat(
      id: id is int? ? id : this.id,
      serviceId: serviceId ?? this.serviceId,
      service: service is _i2.Service? ? service : this.service?.copyWith(),
      timestamp: timestamp ?? this.timestamp,
      uptimeSeconds: uptimeSeconds ?? this.uptimeSeconds,
      version: version ?? this.version,
      status: status ?? this.status,
      resources: resources is _i4.TelemetryResources?
          ? resources
          : this.resources?.copyWith(),
    );
  }
}

class TelemetryHeartbeatUpdateTable
    extends _i1.UpdateTable<TelemetryHeartbeatTable> {
  TelemetryHeartbeatUpdateTable(super.table);

  _i1.ColumnValue<int, int> serviceId(int value) => _i1.ColumnValue(
    table.serviceId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> timestamp(DateTime value) =>
      _i1.ColumnValue(
        table.timestamp,
        value,
      );

  _i1.ColumnValue<int, int> uptimeSeconds(int value) => _i1.ColumnValue(
    table.uptimeSeconds,
    value,
  );

  _i1.ColumnValue<String, String> version(String value) => _i1.ColumnValue(
    table.version,
    value,
  );

  _i1.ColumnValue<_i3.ServiceStatus, _i3.ServiceStatus> status(
    _i3.ServiceStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<_i4.TelemetryResources, _i4.TelemetryResources> resources(
    _i4.TelemetryResources? value,
  ) => _i1.ColumnValue(
    table.resources,
    value,
  );
}

class TelemetryHeartbeatTable extends _i1.Table<int?> {
  TelemetryHeartbeatTable({super.tableRelation})
    : super(tableName: 'telemetry_heartbeat') {
    updateTable = TelemetryHeartbeatUpdateTable(this);
    serviceId = _i1.ColumnInt(
      'serviceId',
      this,
    );
    timestamp = _i1.ColumnDateTime(
      'timestamp',
      this,
    );
    uptimeSeconds = _i1.ColumnInt(
      'uptimeSeconds',
      this,
    );
    version = _i1.ColumnString(
      'version',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
    );
    resources = _i1.ColumnSerializable<_i4.TelemetryResources>(
      'resources',
      this,
    );
  }

  late final TelemetryHeartbeatUpdateTable updateTable;

  late final _i1.ColumnInt serviceId;

  _i2.ServiceTable? _service;

  late final _i1.ColumnDateTime timestamp;

  late final _i1.ColumnInt uptimeSeconds;

  late final _i1.ColumnString version;

  late final _i1.ColumnEnum<_i3.ServiceStatus> status;

  late final _i1.ColumnSerializable<_i4.TelemetryResources> resources;

  _i2.ServiceTable get service {
    if (_service != null) return _service!;
    _service = _i1.createRelationTable(
      relationFieldName: 'service',
      field: TelemetryHeartbeat.t.serviceId,
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
    serviceId,
    timestamp,
    uptimeSeconds,
    version,
    status,
    resources,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'service') {
      return service;
    }
    return null;
  }
}

class TelemetryHeartbeatInclude extends _i1.IncludeObject {
  TelemetryHeartbeatInclude._({_i2.ServiceInclude? service}) {
    _service = service;
  }

  _i2.ServiceInclude? _service;

  @override
  Map<String, _i1.Include?> get includes => {'service': _service};

  @override
  _i1.Table<int?> get table => TelemetryHeartbeat.t;
}

class TelemetryHeartbeatIncludeList extends _i1.IncludeList {
  TelemetryHeartbeatIncludeList._({
    _i1.WhereExpressionBuilder<TelemetryHeartbeatTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TelemetryHeartbeat.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => TelemetryHeartbeat.t;
}

class TelemetryHeartbeatRepository {
  const TelemetryHeartbeatRepository._();

  final attachRow = const TelemetryHeartbeatAttachRowRepository._();

  /// Returns a list of [TelemetryHeartbeat]s matching the given query parameters.
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
  Future<List<TelemetryHeartbeat>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TelemetryHeartbeatTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TelemetryHeartbeatTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TelemetryHeartbeatTable>? orderByList,
    _i1.Transaction? transaction,
    TelemetryHeartbeatInclude? include,
  }) async {
    return session.db.find<TelemetryHeartbeat>(
      where: where?.call(TelemetryHeartbeat.t),
      orderBy: orderBy?.call(TelemetryHeartbeat.t),
      orderByList: orderByList?.call(TelemetryHeartbeat.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [TelemetryHeartbeat] matching the given query parameters.
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
  Future<TelemetryHeartbeat?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TelemetryHeartbeatTable>? where,
    int? offset,
    _i1.OrderByBuilder<TelemetryHeartbeatTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TelemetryHeartbeatTable>? orderByList,
    _i1.Transaction? transaction,
    TelemetryHeartbeatInclude? include,
  }) async {
    return session.db.findFirstRow<TelemetryHeartbeat>(
      where: where?.call(TelemetryHeartbeat.t),
      orderBy: orderBy?.call(TelemetryHeartbeat.t),
      orderByList: orderByList?.call(TelemetryHeartbeat.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [TelemetryHeartbeat] by its [id] or null if no such row exists.
  Future<TelemetryHeartbeat?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    TelemetryHeartbeatInclude? include,
  }) async {
    return session.db.findById<TelemetryHeartbeat>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [TelemetryHeartbeat]s in the list and returns the inserted rows.
  ///
  /// The returned [TelemetryHeartbeat]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<TelemetryHeartbeat>> insert(
    _i1.Session session,
    List<TelemetryHeartbeat> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<TelemetryHeartbeat>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [TelemetryHeartbeat] and returns the inserted row.
  ///
  /// The returned [TelemetryHeartbeat] will have its `id` field set.
  Future<TelemetryHeartbeat> insertRow(
    _i1.Session session,
    TelemetryHeartbeat row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<TelemetryHeartbeat>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [TelemetryHeartbeat]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<TelemetryHeartbeat>> update(
    _i1.Session session,
    List<TelemetryHeartbeat> rows, {
    _i1.ColumnSelections<TelemetryHeartbeatTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<TelemetryHeartbeat>(
      rows,
      columns: columns?.call(TelemetryHeartbeat.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TelemetryHeartbeat]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<TelemetryHeartbeat> updateRow(
    _i1.Session session,
    TelemetryHeartbeat row, {
    _i1.ColumnSelections<TelemetryHeartbeatTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<TelemetryHeartbeat>(
      row,
      columns: columns?.call(TelemetryHeartbeat.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TelemetryHeartbeat] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<TelemetryHeartbeat?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<TelemetryHeartbeatUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<TelemetryHeartbeat>(
      id,
      columnValues: columnValues(TelemetryHeartbeat.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [TelemetryHeartbeat]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<TelemetryHeartbeat>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<TelemetryHeartbeatUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<TelemetryHeartbeatTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TelemetryHeartbeatTable>? orderBy,
    _i1.OrderByListBuilder<TelemetryHeartbeatTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<TelemetryHeartbeat>(
      columnValues: columnValues(TelemetryHeartbeat.t.updateTable),
      where: where(TelemetryHeartbeat.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TelemetryHeartbeat.t),
      orderByList: orderByList?.call(TelemetryHeartbeat.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [TelemetryHeartbeat]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<TelemetryHeartbeat>> delete(
    _i1.Session session,
    List<TelemetryHeartbeat> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TelemetryHeartbeat>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [TelemetryHeartbeat].
  Future<TelemetryHeartbeat> deleteRow(
    _i1.Session session,
    TelemetryHeartbeat row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TelemetryHeartbeat>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<TelemetryHeartbeat>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TelemetryHeartbeatTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<TelemetryHeartbeat>(
      where: where(TelemetryHeartbeat.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TelemetryHeartbeatTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TelemetryHeartbeat>(
      where: where?.call(TelemetryHeartbeat.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class TelemetryHeartbeatAttachRowRepository {
  const TelemetryHeartbeatAttachRowRepository._();

  /// Creates a relation between the given [TelemetryHeartbeat] and [Service]
  /// by setting the [TelemetryHeartbeat]'s foreign key `serviceId` to refer to the [Service].
  Future<void> service(
    _i1.Session session,
    TelemetryHeartbeat telemetryHeartbeat,
    _i2.Service service, {
    _i1.Transaction? transaction,
  }) async {
    if (telemetryHeartbeat.id == null) {
      throw ArgumentError.notNull('telemetryHeartbeat.id');
    }
    if (service.id == null) {
      throw ArgumentError.notNull('service.id');
    }

    var $telemetryHeartbeat = telemetryHeartbeat.copyWith(
      serviceId: service.id,
    );
    await session.db.updateRow<TelemetryHeartbeat>(
      $telemetryHeartbeat,
      columns: [TelemetryHeartbeat.t.serviceId],
      transaction: transaction,
    );
  }
}
