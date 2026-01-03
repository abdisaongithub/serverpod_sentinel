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
import '../enums/signal_type.dart' as _i3;
import 'package:serverpod_sentinel_server/src/generated/protocol.dart' as _i4;

/// Defines a specific metric or health check for a service.
abstract class HealthSignal
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  HealthSignal._({
    this.id,
    required this.serviceId,
    required this.serviceId,
    this.service,
    required this.name,
    required this.identifier,
    required this.type,
    this.lastCheckedAt,
    required this.isHealthy,
    this.currentValue,
    this.unit,
    this.endpoint,
    this.metadata,
    required this.createdAt,
    required this.updatedAt,
  }) : _serviceSignalsServiceId = null;

  factory HealthSignal({
    int? id,
    required int serviceId,
    required int serviceId,
    _i2.Service? service,
    required String name,
    required String identifier,
    required _i3.SignalType type,
    DateTime? lastCheckedAt,
    required bool isHealthy,
    double? currentValue,
    String? unit,
    String? endpoint,
    String? metadata,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _HealthSignalImpl;

  factory HealthSignal.fromJson(Map<String, dynamic> jsonSerialization) {
    return HealthSignalImplicit._(
      id: jsonSerialization['id'] as int?,
      serviceId: jsonSerialization['serviceId'] as int,
      service: jsonSerialization['service'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.Service>(
              jsonSerialization['service'],
            ),
      name: jsonSerialization['name'] as String,
      identifier: jsonSerialization['identifier'] as String,
      type: _i3.SignalType.fromJson((jsonSerialization['type'] as String)),
      lastCheckedAt: jsonSerialization['lastCheckedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastCheckedAt'],
            ),
      isHealthy: jsonSerialization['isHealthy'] as bool,
      currentValue: (jsonSerialization['currentValue'] as num?)?.toDouble(),
      unit: jsonSerialization['unit'] as String?,
      endpoint: jsonSerialization['endpoint'] as String?,
      metadata: jsonSerialization['metadata'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
      $_serviceSignalsServiceId:
          jsonSerialization['_serviceSignalsServiceId'] as int?,
    );
  }

  static final t = HealthSignalTable();

  static const db = HealthSignalRepository._();

  @override
  int? id;

  int serviceId;

  int serviceId;

  _i2.Service? service;

  String name;

  String identifier;

  _i3.SignalType type;

  DateTime? lastCheckedAt;

  bool isHealthy;

  double? currentValue;

  String? unit;

  String? endpoint;

  String? metadata;

  DateTime createdAt;

  DateTime updatedAt;

  final int? _serviceSignalsServiceId;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [HealthSignal]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  HealthSignal copyWith({
    int? id,
    int? serviceId,
    int? serviceId,
    _i2.Service? service,
    String? name,
    String? identifier,
    _i3.SignalType? type,
    DateTime? lastCheckedAt,
    bool? isHealthy,
    double? currentValue,
    String? unit,
    String? endpoint,
    String? metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'HealthSignal',
      if (id != null) 'id': id,
      'serviceId': serviceId,
      'serviceId': serviceId,
      if (service != null) 'service': service?.toJson(),
      'name': name,
      'identifier': identifier,
      'type': type.toJson(),
      if (lastCheckedAt != null) 'lastCheckedAt': lastCheckedAt?.toJson(),
      'isHealthy': isHealthy,
      if (currentValue != null) 'currentValue': currentValue,
      if (unit != null) 'unit': unit,
      if (endpoint != null) 'endpoint': endpoint,
      if (metadata != null) 'metadata': metadata,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (_serviceSignalsServiceId != null)
        '_serviceSignalsServiceId': _serviceSignalsServiceId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'HealthSignal',
      if (id != null) 'id': id,
      'serviceId': serviceId,
      'serviceId': serviceId,
      if (service != null) 'service': service?.toJsonForProtocol(),
      'name': name,
      'identifier': identifier,
      'type': type.toJson(),
      if (lastCheckedAt != null) 'lastCheckedAt': lastCheckedAt?.toJson(),
      'isHealthy': isHealthy,
      if (currentValue != null) 'currentValue': currentValue,
      if (unit != null) 'unit': unit,
      if (endpoint != null) 'endpoint': endpoint,
      if (metadata != null) 'metadata': metadata,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static HealthSignalInclude include({_i2.ServiceInclude? service}) {
    return HealthSignalInclude._(service: service);
  }

  static HealthSignalIncludeList includeList({
    _i1.WhereExpressionBuilder<HealthSignalTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<HealthSignalTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<HealthSignalTable>? orderByList,
    HealthSignalInclude? include,
  }) {
    return HealthSignalIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(HealthSignal.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(HealthSignal.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _HealthSignalImpl extends HealthSignal {
  _HealthSignalImpl({
    int? id,
    required int serviceId,
    required int serviceId,
    _i2.Service? service,
    required String name,
    required String identifier,
    required _i3.SignalType type,
    DateTime? lastCheckedAt,
    required bool isHealthy,
    double? currentValue,
    String? unit,
    String? endpoint,
    String? metadata,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         serviceId: serviceId,
         service: service,
         name: name,
         identifier: identifier,
         type: type,
         lastCheckedAt: lastCheckedAt,
         isHealthy: isHealthy,
         currentValue: currentValue,
         unit: unit,
         endpoint: endpoint,
         metadata: metadata,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [HealthSignal]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  HealthSignal copyWith({
    Object? id = _Undefined,
    int? serviceId,
    int? serviceId,
    Object? service = _Undefined,
    String? name,
    String? identifier,
    _i3.SignalType? type,
    Object? lastCheckedAt = _Undefined,
    bool? isHealthy,
    Object? currentValue = _Undefined,
    Object? unit = _Undefined,
    Object? endpoint = _Undefined,
    Object? metadata = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return HealthSignalImplicit._(
      id: id is int? ? id : this.id,
      serviceId: serviceId ?? this.serviceId,
      service: service is _i2.Service? ? service : this.service?.copyWith(),
      name: name ?? this.name,
      identifier: identifier ?? this.identifier,
      type: type ?? this.type,
      lastCheckedAt: lastCheckedAt is DateTime?
          ? lastCheckedAt
          : this.lastCheckedAt,
      isHealthy: isHealthy ?? this.isHealthy,
      currentValue: currentValue is double? ? currentValue : this.currentValue,
      unit: unit is String? ? unit : this.unit,
      endpoint: endpoint is String? ? endpoint : this.endpoint,
      metadata: metadata is String? ? metadata : this.metadata,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      $_serviceSignalsServiceId: this._serviceSignalsServiceId,
    );
  }
}

class HealthSignalImplicit extends _HealthSignalImpl {
  HealthSignalImplicit._({
    int? id,
    required int serviceId,
    required int serviceId,
    _i2.Service? service,
    required String name,
    required String identifier,
    required _i3.SignalType type,
    DateTime? lastCheckedAt,
    required bool isHealthy,
    double? currentValue,
    String? unit,
    String? endpoint,
    String? metadata,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? $_serviceSignalsServiceId,
  }) : _serviceSignalsServiceId = $_serviceSignalsServiceId,
       super(
         id: id,
         serviceId: serviceId,
         service: service,
         name: name,
         identifier: identifier,
         type: type,
         lastCheckedAt: lastCheckedAt,
         isHealthy: isHealthy,
         currentValue: currentValue,
         unit: unit,
         endpoint: endpoint,
         metadata: metadata,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  factory HealthSignalImplicit(
    HealthSignal healthSignal, {
    int? $_serviceSignalsServiceId,
  }) {
    return HealthSignalImplicit._(
      id: healthSignal.id,
      serviceId: healthSignal.serviceId,
      service: healthSignal.service,
      name: healthSignal.name,
      identifier: healthSignal.identifier,
      type: healthSignal.type,
      lastCheckedAt: healthSignal.lastCheckedAt,
      isHealthy: healthSignal.isHealthy,
      currentValue: healthSignal.currentValue,
      unit: healthSignal.unit,
      endpoint: healthSignal.endpoint,
      metadata: healthSignal.metadata,
      createdAt: healthSignal.createdAt,
      updatedAt: healthSignal.updatedAt,
      $_serviceSignalsServiceId: $_serviceSignalsServiceId,
    );
  }

  @override
  final int? _serviceSignalsServiceId;
}

class HealthSignalUpdateTable extends _i1.UpdateTable<HealthSignalTable> {
  HealthSignalUpdateTable(super.table);

  _i1.ColumnValue<int, int> serviceId(int value) => _i1.ColumnValue(
    table.serviceId,
    value,
  );

  _i1.ColumnValue<int, int> serviceId(int value) => _i1.ColumnValue(
    table.serviceId,
    value,
  );

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> identifier(String value) => _i1.ColumnValue(
    table.identifier,
    value,
  );

  _i1.ColumnValue<_i3.SignalType, _i3.SignalType> type(_i3.SignalType value) =>
      _i1.ColumnValue(
        table.type,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> lastCheckedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.lastCheckedAt,
        value,
      );

  _i1.ColumnValue<bool, bool> isHealthy(bool value) => _i1.ColumnValue(
    table.isHealthy,
    value,
  );

  _i1.ColumnValue<double, double> currentValue(double? value) =>
      _i1.ColumnValue(
        table.currentValue,
        value,
      );

  _i1.ColumnValue<String, String> unit(String? value) => _i1.ColumnValue(
    table.unit,
    value,
  );

  _i1.ColumnValue<String, String> endpoint(String? value) => _i1.ColumnValue(
    table.endpoint,
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

  _i1.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _i1.ColumnValue(
        table.updatedAt,
        value,
      );

  _i1.ColumnValue<int, int> $_serviceSignalsServiceId(int? value) =>
      _i1.ColumnValue(
        table.$_serviceSignalsServiceId,
        value,
      );
}

class HealthSignalTable extends _i1.Table<int?> {
  HealthSignalTable({super.tableRelation}) : super(tableName: 'health_signal') {
    updateTable = HealthSignalUpdateTable(this);
    serviceId = _i1.ColumnInt(
      'serviceId',
      this,
    );
    serviceId = _i1.ColumnInt(
      'serviceId',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    identifier = _i1.ColumnString(
      'identifier',
      this,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
    );
    lastCheckedAt = _i1.ColumnDateTime(
      'lastCheckedAt',
      this,
    );
    isHealthy = _i1.ColumnBool(
      'isHealthy',
      this,
    );
    currentValue = _i1.ColumnDouble(
      'currentValue',
      this,
    );
    unit = _i1.ColumnString(
      'unit',
      this,
    );
    endpoint = _i1.ColumnString(
      'endpoint',
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
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
    $_serviceSignalsServiceId = _i1.ColumnInt(
      '_serviceSignalsServiceId',
      this,
    );
  }

  late final HealthSignalUpdateTable updateTable;

  late final _i1.ColumnInt serviceId;

  late final _i1.ColumnInt serviceId;

  _i2.ServiceTable? _service;

  late final _i1.ColumnString name;

  late final _i1.ColumnString identifier;

  late final _i1.ColumnEnum<_i3.SignalType> type;

  late final _i1.ColumnDateTime lastCheckedAt;

  late final _i1.ColumnBool isHealthy;

  late final _i1.ColumnDouble currentValue;

  late final _i1.ColumnString unit;

  late final _i1.ColumnString endpoint;

  late final _i1.ColumnString metadata;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnInt $_serviceSignalsServiceId;

  _i2.ServiceTable get service {
    if (_service != null) return _service!;
    _service = _i1.createRelationTable(
      relationFieldName: 'service',
      field: HealthSignal.t.serviceId,
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
    serviceId,
    name,
    identifier,
    type,
    lastCheckedAt,
    isHealthy,
    currentValue,
    unit,
    endpoint,
    metadata,
    createdAt,
    updatedAt,
    $_serviceSignalsServiceId,
  ];

  @override
  List<_i1.Column> get managedColumns => [
    id,
    serviceId,
    serviceId,
    name,
    identifier,
    type,
    lastCheckedAt,
    isHealthy,
    currentValue,
    unit,
    endpoint,
    metadata,
    createdAt,
    updatedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'service') {
      return service;
    }
    return null;
  }
}

class HealthSignalInclude extends _i1.IncludeObject {
  HealthSignalInclude._({_i2.ServiceInclude? service}) {
    _service = service;
  }

  _i2.ServiceInclude? _service;

  @override
  Map<String, _i1.Include?> get includes => {'service': _service};

  @override
  _i1.Table<int?> get table => HealthSignal.t;
}

class HealthSignalIncludeList extends _i1.IncludeList {
  HealthSignalIncludeList._({
    _i1.WhereExpressionBuilder<HealthSignalTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(HealthSignal.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => HealthSignal.t;
}

class HealthSignalRepository {
  const HealthSignalRepository._();

  final attachRow = const HealthSignalAttachRowRepository._();

  /// Returns a list of [HealthSignal]s matching the given query parameters.
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
  Future<List<HealthSignal>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<HealthSignalTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<HealthSignalTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<HealthSignalTable>? orderByList,
    _i1.Transaction? transaction,
    HealthSignalInclude? include,
  }) async {
    return session.db.find<HealthSignal>(
      where: where?.call(HealthSignal.t),
      orderBy: orderBy?.call(HealthSignal.t),
      orderByList: orderByList?.call(HealthSignal.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [HealthSignal] matching the given query parameters.
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
  Future<HealthSignal?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<HealthSignalTable>? where,
    int? offset,
    _i1.OrderByBuilder<HealthSignalTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<HealthSignalTable>? orderByList,
    _i1.Transaction? transaction,
    HealthSignalInclude? include,
  }) async {
    return session.db.findFirstRow<HealthSignal>(
      where: where?.call(HealthSignal.t),
      orderBy: orderBy?.call(HealthSignal.t),
      orderByList: orderByList?.call(HealthSignal.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [HealthSignal] by its [id] or null if no such row exists.
  Future<HealthSignal?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    HealthSignalInclude? include,
  }) async {
    return session.db.findById<HealthSignal>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [HealthSignal]s in the list and returns the inserted rows.
  ///
  /// The returned [HealthSignal]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<HealthSignal>> insert(
    _i1.Session session,
    List<HealthSignal> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<HealthSignal>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [HealthSignal] and returns the inserted row.
  ///
  /// The returned [HealthSignal] will have its `id` field set.
  Future<HealthSignal> insertRow(
    _i1.Session session,
    HealthSignal row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<HealthSignal>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [HealthSignal]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<HealthSignal>> update(
    _i1.Session session,
    List<HealthSignal> rows, {
    _i1.ColumnSelections<HealthSignalTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<HealthSignal>(
      rows,
      columns: columns?.call(HealthSignal.t),
      transaction: transaction,
    );
  }

  /// Updates a single [HealthSignal]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<HealthSignal> updateRow(
    _i1.Session session,
    HealthSignal row, {
    _i1.ColumnSelections<HealthSignalTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<HealthSignal>(
      row,
      columns: columns?.call(HealthSignal.t),
      transaction: transaction,
    );
  }

  /// Updates a single [HealthSignal] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<HealthSignal?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<HealthSignalUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<HealthSignal>(
      id,
      columnValues: columnValues(HealthSignal.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [HealthSignal]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<HealthSignal>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<HealthSignalUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<HealthSignalTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<HealthSignalTable>? orderBy,
    _i1.OrderByListBuilder<HealthSignalTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<HealthSignal>(
      columnValues: columnValues(HealthSignal.t.updateTable),
      where: where(HealthSignal.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(HealthSignal.t),
      orderByList: orderByList?.call(HealthSignal.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [HealthSignal]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<HealthSignal>> delete(
    _i1.Session session,
    List<HealthSignal> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<HealthSignal>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [HealthSignal].
  Future<HealthSignal> deleteRow(
    _i1.Session session,
    HealthSignal row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<HealthSignal>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<HealthSignal>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<HealthSignalTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<HealthSignal>(
      where: where(HealthSignal.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<HealthSignalTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<HealthSignal>(
      where: where?.call(HealthSignal.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class HealthSignalAttachRowRepository {
  const HealthSignalAttachRowRepository._();

  /// Creates a relation between the given [HealthSignal] and [Service]
  /// by setting the [HealthSignal]'s foreign key `serviceId` to refer to the [Service].
  Future<void> service(
    _i1.Session session,
    HealthSignal healthSignal,
    _i2.Service service, {
    _i1.Transaction? transaction,
  }) async {
    if (healthSignal.id == null) {
      throw ArgumentError.notNull('healthSignal.id');
    }
    if (service.id == null) {
      throw ArgumentError.notNull('service.id');
    }

    var $healthSignal = healthSignal.copyWith(serviceId: service.id);
    await session.db.updateRow<HealthSignal>(
      $healthSignal,
      columns: [HealthSignal.t.serviceId],
      transaction: transaction,
    );
  }
}
