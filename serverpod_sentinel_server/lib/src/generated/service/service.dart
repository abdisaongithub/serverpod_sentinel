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
import '../security/ops_user.dart' as _i2;
import '../enums/service_status.dart' as _i3;
import '../enums/service_tier.dart' as _i4;
import '../service/health_signal.dart' as _i5;
import '../service/rule.dart' as _i6;
import '../incident/incident.dart' as _i7;
import 'package:serverpod_sentinel_server/src/generated/protocol.dart' as _i8;

/// Represents a logical monitoring target (e.g., API, Database, Worker).
abstract class Service
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Service._({
    this.id,
    required this.name,
    this.description,
    required this.ownerId,
    required this.ownerId,
    this.owner,
    required this.status,
    required this.tier,
    required this.tags,
    this.signals,
    this.rules,
    this.incidents,
    required this.createdAt,
    required this.updatedAt,
  }) : _opsUserServicesOpsUserId = null;

  factory Service({
    int? id,
    required String name,
    String? description,
    required int ownerId,
    required int ownerId,
    _i2.OpsUser? owner,
    required _i3.ServiceStatus status,
    required _i4.ServiceTier tier,
    required List<String> tags,
    List<_i5.HealthSignal>? signals,
    List<_i6.Rule>? rules,
    List<_i7.Incident>? incidents,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ServiceImpl;

  factory Service.fromJson(Map<String, dynamic> jsonSerialization) {
    return ServiceImplicit._(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i8.Protocol().deserialize<_i2.OpsUser>(jsonSerialization['owner']),
      status: _i3.ServiceStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      tier: _i4.ServiceTier.fromJson((jsonSerialization['tier'] as String)),
      tags: _i8.Protocol().deserialize<List<String>>(jsonSerialization['tags']),
      signals: jsonSerialization['signals'] == null
          ? null
          : _i8.Protocol().deserialize<List<_i5.HealthSignal>>(
              jsonSerialization['signals'],
            ),
      rules: jsonSerialization['rules'] == null
          ? null
          : _i8.Protocol().deserialize<List<_i6.Rule>>(
              jsonSerialization['rules'],
            ),
      incidents: jsonSerialization['incidents'] == null
          ? null
          : _i8.Protocol().deserialize<List<_i7.Incident>>(
              jsonSerialization['incidents'],
            ),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
      $_opsUserServicesOpsUserId:
          jsonSerialization['_opsUserServicesOpsUserId'] as int?,
    );
  }

  static final t = ServiceTable();

  static const db = ServiceRepository._();

  @override
  int? id;

  String name;

  String? description;

  int ownerId;

  int ownerId;

  _i2.OpsUser? owner;

  _i3.ServiceStatus status;

  _i4.ServiceTier tier;

  List<String> tags;

  List<_i5.HealthSignal>? signals;

  List<_i6.Rule>? rules;

  List<_i7.Incident>? incidents;

  DateTime createdAt;

  DateTime updatedAt;

  final int? _opsUserServicesOpsUserId;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Service]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Service copyWith({
    int? id,
    String? name,
    String? description,
    int? ownerId,
    int? ownerId,
    _i2.OpsUser? owner,
    _i3.ServiceStatus? status,
    _i4.ServiceTier? tier,
    List<String>? tags,
    List<_i5.HealthSignal>? signals,
    List<_i6.Rule>? rules,
    List<_i7.Incident>? incidents,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Service',
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'ownerId': ownerId,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      'status': status.toJson(),
      'tier': tier.toJson(),
      'tags': tags.toJson(),
      if (signals != null)
        'signals': signals?.toJson(valueToJson: (v) => v.toJson()),
      if (rules != null) 'rules': rules?.toJson(valueToJson: (v) => v.toJson()),
      if (incidents != null)
        'incidents': incidents?.toJson(valueToJson: (v) => v.toJson()),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (_opsUserServicesOpsUserId != null)
        '_opsUserServicesOpsUserId': _opsUserServicesOpsUserId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Service',
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'ownerId': ownerId,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      'status': status.toJson(),
      'tier': tier.toJson(),
      'tags': tags.toJson(),
      if (signals != null)
        'signals': signals?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (rules != null)
        'rules': rules?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (incidents != null)
        'incidents': incidents?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static ServiceInclude include({
    _i2.OpsUserInclude? owner,
    _i5.HealthSignalIncludeList? signals,
    _i6.RuleIncludeList? rules,
    _i7.IncidentIncludeList? incidents,
  }) {
    return ServiceInclude._(
      owner: owner,
      signals: signals,
      rules: rules,
      incidents: incidents,
    );
  }

  static ServiceIncludeList includeList({
    _i1.WhereExpressionBuilder<ServiceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ServiceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ServiceTable>? orderByList,
    ServiceInclude? include,
  }) {
    return ServiceIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Service.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Service.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ServiceImpl extends Service {
  _ServiceImpl({
    int? id,
    required String name,
    String? description,
    required int ownerId,
    required int ownerId,
    _i2.OpsUser? owner,
    required _i3.ServiceStatus status,
    required _i4.ServiceTier tier,
    required List<String> tags,
    List<_i5.HealthSignal>? signals,
    List<_i6.Rule>? rules,
    List<_i7.Incident>? incidents,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         name: name,
         description: description,
         ownerId: ownerId,
         owner: owner,
         status: status,
         tier: tier,
         tags: tags,
         signals: signals,
         rules: rules,
         incidents: incidents,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Service]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Service copyWith({
    Object? id = _Undefined,
    String? name,
    Object? description = _Undefined,
    int? ownerId,
    int? ownerId,
    Object? owner = _Undefined,
    _i3.ServiceStatus? status,
    _i4.ServiceTier? tier,
    List<String>? tags,
    Object? signals = _Undefined,
    Object? rules = _Undefined,
    Object? incidents = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ServiceImplicit._(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.OpsUser? ? owner : this.owner?.copyWith(),
      status: status ?? this.status,
      tier: tier ?? this.tier,
      tags: tags ?? this.tags.map((e0) => e0).toList(),
      signals: signals is List<_i5.HealthSignal>?
          ? signals
          : this.signals?.map((e0) => e0.copyWith()).toList(),
      rules: rules is List<_i6.Rule>?
          ? rules
          : this.rules?.map((e0) => e0.copyWith()).toList(),
      incidents: incidents is List<_i7.Incident>?
          ? incidents
          : this.incidents?.map((e0) => e0.copyWith()).toList(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      $_opsUserServicesOpsUserId: this._opsUserServicesOpsUserId,
    );
  }
}

class ServiceImplicit extends _ServiceImpl {
  ServiceImplicit._({
    int? id,
    required String name,
    String? description,
    required int ownerId,
    required int ownerId,
    _i2.OpsUser? owner,
    required _i3.ServiceStatus status,
    required _i4.ServiceTier tier,
    required List<String> tags,
    List<_i5.HealthSignal>? signals,
    List<_i6.Rule>? rules,
    List<_i7.Incident>? incidents,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? $_opsUserServicesOpsUserId,
  }) : _opsUserServicesOpsUserId = $_opsUserServicesOpsUserId,
       super(
         id: id,
         name: name,
         description: description,
         ownerId: ownerId,
         owner: owner,
         status: status,
         tier: tier,
         tags: tags,
         signals: signals,
         rules: rules,
         incidents: incidents,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  factory ServiceImplicit(
    Service service, {
    int? $_opsUserServicesOpsUserId,
  }) {
    return ServiceImplicit._(
      id: service.id,
      name: service.name,
      description: service.description,
      ownerId: service.ownerId,
      owner: service.owner,
      status: service.status,
      tier: service.tier,
      tags: service.tags,
      signals: service.signals,
      rules: service.rules,
      incidents: service.incidents,
      createdAt: service.createdAt,
      updatedAt: service.updatedAt,
      $_opsUserServicesOpsUserId: $_opsUserServicesOpsUserId,
    );
  }

  @override
  final int? _opsUserServicesOpsUserId;
}

class ServiceUpdateTable extends _i1.UpdateTable<ServiceTable> {
  ServiceUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> description(String? value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<int, int> ownerId(int value) => _i1.ColumnValue(
    table.ownerId,
    value,
  );

  _i1.ColumnValue<int, int> ownerId(int value) => _i1.ColumnValue(
    table.ownerId,
    value,
  );

  _i1.ColumnValue<_i3.ServiceStatus, _i3.ServiceStatus> status(
    _i3.ServiceStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<_i4.ServiceTier, _i4.ServiceTier> tier(
    _i4.ServiceTier value,
  ) => _i1.ColumnValue(
    table.tier,
    value,
  );

  _i1.ColumnValue<List<String>, List<String>> tags(List<String> value) =>
      _i1.ColumnValue(
        table.tags,
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

  _i1.ColumnValue<int, int> $_opsUserServicesOpsUserId(int? value) =>
      _i1.ColumnValue(
        table.$_opsUserServicesOpsUserId,
        value,
      );
}

class ServiceTable extends _i1.Table<int?> {
  ServiceTable({super.tableRelation}) : super(tableName: 'service') {
    updateTable = ServiceUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
    );
    tier = _i1.ColumnEnum(
      'tier',
      this,
      _i1.EnumSerialization.byName,
    );
    tags = _i1.ColumnSerializable<List<String>>(
      'tags',
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
    $_opsUserServicesOpsUserId = _i1.ColumnInt(
      '_opsUserServicesOpsUserId',
      this,
    );
  }

  late final ServiceUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnInt ownerId;

  late final _i1.ColumnInt ownerId;

  _i2.OpsUserTable? _owner;

  late final _i1.ColumnEnum<_i3.ServiceStatus> status;

  late final _i1.ColumnEnum<_i4.ServiceTier> tier;

  late final _i1.ColumnSerializable<List<String>> tags;

  _i5.HealthSignalTable? ___signals;

  _i1.ManyRelation<_i5.HealthSignalTable>? _signals;

  _i6.RuleTable? ___rules;

  _i1.ManyRelation<_i6.RuleTable>? _rules;

  _i7.IncidentTable? ___incidents;

  _i1.ManyRelation<_i7.IncidentTable>? _incidents;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnInt $_opsUserServicesOpsUserId;

  _i2.OpsUserTable get owner {
    if (_owner != null) return _owner!;
    _owner = _i1.createRelationTable(
      relationFieldName: 'owner',
      field: Service.t.ownerId,
      foreignField: _i2.OpsUser.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.OpsUserTable(tableRelation: foreignTableRelation),
    );
    return _owner!;
  }

  _i5.HealthSignalTable get __signals {
    if (___signals != null) return ___signals!;
    ___signals = _i1.createRelationTable(
      relationFieldName: '__signals',
      field: Service.t.id,
      foreignField: _i5.HealthSignal.t.$_serviceSignalsServiceId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.HealthSignalTable(tableRelation: foreignTableRelation),
    );
    return ___signals!;
  }

  _i6.RuleTable get __rules {
    if (___rules != null) return ___rules!;
    ___rules = _i1.createRelationTable(
      relationFieldName: '__rules',
      field: Service.t.id,
      foreignField: _i6.Rule.t.$_serviceRulesServiceId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.RuleTable(tableRelation: foreignTableRelation),
    );
    return ___rules!;
  }

  _i7.IncidentTable get __incidents {
    if (___incidents != null) return ___incidents!;
    ___incidents = _i1.createRelationTable(
      relationFieldName: '__incidents',
      field: Service.t.id,
      foreignField: _i7.Incident.t.$_serviceIncidentsServiceId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i7.IncidentTable(tableRelation: foreignTableRelation),
    );
    return ___incidents!;
  }

  _i1.ManyRelation<_i5.HealthSignalTable> get signals {
    if (_signals != null) return _signals!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'signals',
      field: Service.t.id,
      foreignField: _i5.HealthSignal.t.$_serviceSignalsServiceId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.HealthSignalTable(tableRelation: foreignTableRelation),
    );
    _signals = _i1.ManyRelation<_i5.HealthSignalTable>(
      tableWithRelations: relationTable,
      table: _i5.HealthSignalTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _signals!;
  }

  _i1.ManyRelation<_i6.RuleTable> get rules {
    if (_rules != null) return _rules!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'rules',
      field: Service.t.id,
      foreignField: _i6.Rule.t.$_serviceRulesServiceId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.RuleTable(tableRelation: foreignTableRelation),
    );
    _rules = _i1.ManyRelation<_i6.RuleTable>(
      tableWithRelations: relationTable,
      table: _i6.RuleTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _rules!;
  }

  _i1.ManyRelation<_i7.IncidentTable> get incidents {
    if (_incidents != null) return _incidents!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'incidents',
      field: Service.t.id,
      foreignField: _i7.Incident.t.$_serviceIncidentsServiceId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i7.IncidentTable(tableRelation: foreignTableRelation),
    );
    _incidents = _i1.ManyRelation<_i7.IncidentTable>(
      tableWithRelations: relationTable,
      table: _i7.IncidentTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _incidents!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    description,
    ownerId,
    ownerId,
    status,
    tier,
    tags,
    createdAt,
    updatedAt,
    $_opsUserServicesOpsUserId,
  ];

  @override
  List<_i1.Column> get managedColumns => [
    id,
    name,
    description,
    ownerId,
    ownerId,
    status,
    tier,
    tags,
    createdAt,
    updatedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'owner') {
      return owner;
    }
    if (relationField == 'signals') {
      return __signals;
    }
    if (relationField == 'rules') {
      return __rules;
    }
    if (relationField == 'incidents') {
      return __incidents;
    }
    return null;
  }
}

class ServiceInclude extends _i1.IncludeObject {
  ServiceInclude._({
    _i2.OpsUserInclude? owner,
    _i5.HealthSignalIncludeList? signals,
    _i6.RuleIncludeList? rules,
    _i7.IncidentIncludeList? incidents,
  }) {
    _owner = owner;
    _signals = signals;
    _rules = rules;
    _incidents = incidents;
  }

  _i2.OpsUserInclude? _owner;

  _i5.HealthSignalIncludeList? _signals;

  _i6.RuleIncludeList? _rules;

  _i7.IncidentIncludeList? _incidents;

  @override
  Map<String, _i1.Include?> get includes => {
    'owner': _owner,
    'signals': _signals,
    'rules': _rules,
    'incidents': _incidents,
  };

  @override
  _i1.Table<int?> get table => Service.t;
}

class ServiceIncludeList extends _i1.IncludeList {
  ServiceIncludeList._({
    _i1.WhereExpressionBuilder<ServiceTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Service.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Service.t;
}

class ServiceRepository {
  const ServiceRepository._();

  final attach = const ServiceAttachRepository._();

  final attachRow = const ServiceAttachRowRepository._();

  final detach = const ServiceDetachRepository._();

  final detachRow = const ServiceDetachRowRepository._();

  /// Returns a list of [Service]s matching the given query parameters.
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
  Future<List<Service>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ServiceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ServiceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ServiceTable>? orderByList,
    _i1.Transaction? transaction,
    ServiceInclude? include,
  }) async {
    return session.db.find<Service>(
      where: where?.call(Service.t),
      orderBy: orderBy?.call(Service.t),
      orderByList: orderByList?.call(Service.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Service] matching the given query parameters.
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
  Future<Service?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ServiceTable>? where,
    int? offset,
    _i1.OrderByBuilder<ServiceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ServiceTable>? orderByList,
    _i1.Transaction? transaction,
    ServiceInclude? include,
  }) async {
    return session.db.findFirstRow<Service>(
      where: where?.call(Service.t),
      orderBy: orderBy?.call(Service.t),
      orderByList: orderByList?.call(Service.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Service] by its [id] or null if no such row exists.
  Future<Service?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ServiceInclude? include,
  }) async {
    return session.db.findById<Service>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Service]s in the list and returns the inserted rows.
  ///
  /// The returned [Service]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Service>> insert(
    _i1.Session session,
    List<Service> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Service>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Service] and returns the inserted row.
  ///
  /// The returned [Service] will have its `id` field set.
  Future<Service> insertRow(
    _i1.Session session,
    Service row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Service>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Service]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Service>> update(
    _i1.Session session,
    List<Service> rows, {
    _i1.ColumnSelections<ServiceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Service>(
      rows,
      columns: columns?.call(Service.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Service]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Service> updateRow(
    _i1.Session session,
    Service row, {
    _i1.ColumnSelections<ServiceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Service>(
      row,
      columns: columns?.call(Service.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Service] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Service?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<ServiceUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Service>(
      id,
      columnValues: columnValues(Service.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Service]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Service>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ServiceUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ServiceTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ServiceTable>? orderBy,
    _i1.OrderByListBuilder<ServiceTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Service>(
      columnValues: columnValues(Service.t.updateTable),
      where: where(Service.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Service.t),
      orderByList: orderByList?.call(Service.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Service]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Service>> delete(
    _i1.Session session,
    List<Service> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Service>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Service].
  Future<Service> deleteRow(
    _i1.Session session,
    Service row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Service>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Service>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ServiceTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Service>(
      where: where(Service.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ServiceTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Service>(
      where: where?.call(Service.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ServiceAttachRepository {
  const ServiceAttachRepository._();

  /// Creates a relation between this [Service] and the given [HealthSignal]s
  /// by setting each [HealthSignal]'s foreign key `_serviceSignalsServiceId` to refer to this [Service].
  Future<void> signals(
    _i1.Session session,
    Service service,
    List<_i5.HealthSignal> healthSignal, {
    _i1.Transaction? transaction,
  }) async {
    if (healthSignal.any((e) => e.id == null)) {
      throw ArgumentError.notNull('healthSignal.id');
    }
    if (service.id == null) {
      throw ArgumentError.notNull('service.id');
    }

    var $healthSignal = healthSignal
        .map(
          (e) => _i5.HealthSignalImplicit(
            e,
            $_serviceSignalsServiceId: service.id,
          ),
        )
        .toList();
    await session.db.update<_i5.HealthSignal>(
      $healthSignal,
      columns: [_i5.HealthSignal.t.$_serviceSignalsServiceId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Service] and the given [Rule]s
  /// by setting each [Rule]'s foreign key `_serviceRulesServiceId` to refer to this [Service].
  Future<void> rules(
    _i1.Session session,
    Service service,
    List<_i6.Rule> rule, {
    _i1.Transaction? transaction,
  }) async {
    if (rule.any((e) => e.id == null)) {
      throw ArgumentError.notNull('rule.id');
    }
    if (service.id == null) {
      throw ArgumentError.notNull('service.id');
    }

    var $rule = rule
        .map(
          (e) => _i6.RuleImplicit(
            e,
            $_serviceRulesServiceId: service.id,
          ),
        )
        .toList();
    await session.db.update<_i6.Rule>(
      $rule,
      columns: [_i6.Rule.t.$_serviceRulesServiceId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Service] and the given [Incident]s
  /// by setting each [Incident]'s foreign key `_serviceIncidentsServiceId` to refer to this [Service].
  Future<void> incidents(
    _i1.Session session,
    Service service,
    List<_i7.Incident> incident, {
    _i1.Transaction? transaction,
  }) async {
    if (incident.any((e) => e.id == null)) {
      throw ArgumentError.notNull('incident.id');
    }
    if (service.id == null) {
      throw ArgumentError.notNull('service.id');
    }

    var $incident = incident
        .map(
          (e) => _i7.IncidentImplicit(
            e,
            $_serviceIncidentsServiceId: service.id,
          ),
        )
        .toList();
    await session.db.update<_i7.Incident>(
      $incident,
      columns: [_i7.Incident.t.$_serviceIncidentsServiceId],
      transaction: transaction,
    );
  }
}

class ServiceAttachRowRepository {
  const ServiceAttachRowRepository._();

  /// Creates a relation between the given [Service] and [OpsUser]
  /// by setting the [Service]'s foreign key `ownerId` to refer to the [OpsUser].
  Future<void> owner(
    _i1.Session session,
    Service service,
    _i2.OpsUser owner, {
    _i1.Transaction? transaction,
  }) async {
    if (service.id == null) {
      throw ArgumentError.notNull('service.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $service = service.copyWith(ownerId: owner.id);
    await session.db.updateRow<Service>(
      $service,
      columns: [Service.t.ownerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Service] and the given [HealthSignal]
  /// by setting the [HealthSignal]'s foreign key `_serviceSignalsServiceId` to refer to this [Service].
  Future<void> signals(
    _i1.Session session,
    Service service,
    _i5.HealthSignal healthSignal, {
    _i1.Transaction? transaction,
  }) async {
    if (healthSignal.id == null) {
      throw ArgumentError.notNull('healthSignal.id');
    }
    if (service.id == null) {
      throw ArgumentError.notNull('service.id');
    }

    var $healthSignal = _i5.HealthSignalImplicit(
      healthSignal,
      $_serviceSignalsServiceId: service.id,
    );
    await session.db.updateRow<_i5.HealthSignal>(
      $healthSignal,
      columns: [_i5.HealthSignal.t.$_serviceSignalsServiceId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Service] and the given [Rule]
  /// by setting the [Rule]'s foreign key `_serviceRulesServiceId` to refer to this [Service].
  Future<void> rules(
    _i1.Session session,
    Service service,
    _i6.Rule rule, {
    _i1.Transaction? transaction,
  }) async {
    if (rule.id == null) {
      throw ArgumentError.notNull('rule.id');
    }
    if (service.id == null) {
      throw ArgumentError.notNull('service.id');
    }

    var $rule = _i6.RuleImplicit(
      rule,
      $_serviceRulesServiceId: service.id,
    );
    await session.db.updateRow<_i6.Rule>(
      $rule,
      columns: [_i6.Rule.t.$_serviceRulesServiceId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Service] and the given [Incident]
  /// by setting the [Incident]'s foreign key `_serviceIncidentsServiceId` to refer to this [Service].
  Future<void> incidents(
    _i1.Session session,
    Service service,
    _i7.Incident incident, {
    _i1.Transaction? transaction,
  }) async {
    if (incident.id == null) {
      throw ArgumentError.notNull('incident.id');
    }
    if (service.id == null) {
      throw ArgumentError.notNull('service.id');
    }

    var $incident = _i7.IncidentImplicit(
      incident,
      $_serviceIncidentsServiceId: service.id,
    );
    await session.db.updateRow<_i7.Incident>(
      $incident,
      columns: [_i7.Incident.t.$_serviceIncidentsServiceId],
      transaction: transaction,
    );
  }
}

class ServiceDetachRepository {
  const ServiceDetachRepository._();

  /// Detaches the relation between this [Service] and the given [HealthSignal]
  /// by setting the [HealthSignal]'s foreign key `_serviceSignalsServiceId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> signals(
    _i1.Session session,
    List<_i5.HealthSignal> healthSignal, {
    _i1.Transaction? transaction,
  }) async {
    if (healthSignal.any((e) => e.id == null)) {
      throw ArgumentError.notNull('healthSignal.id');
    }

    var $healthSignal = healthSignal
        .map(
          (e) => _i5.HealthSignalImplicit(
            e,
            $_serviceSignalsServiceId: null,
          ),
        )
        .toList();
    await session.db.update<_i5.HealthSignal>(
      $healthSignal,
      columns: [_i5.HealthSignal.t.$_serviceSignalsServiceId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Service] and the given [Rule]
  /// by setting the [Rule]'s foreign key `_serviceRulesServiceId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> rules(
    _i1.Session session,
    List<_i6.Rule> rule, {
    _i1.Transaction? transaction,
  }) async {
    if (rule.any((e) => e.id == null)) {
      throw ArgumentError.notNull('rule.id');
    }

    var $rule = rule
        .map(
          (e) => _i6.RuleImplicit(
            e,
            $_serviceRulesServiceId: null,
          ),
        )
        .toList();
    await session.db.update<_i6.Rule>(
      $rule,
      columns: [_i6.Rule.t.$_serviceRulesServiceId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Service] and the given [Incident]
  /// by setting the [Incident]'s foreign key `_serviceIncidentsServiceId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> incidents(
    _i1.Session session,
    List<_i7.Incident> incident, {
    _i1.Transaction? transaction,
  }) async {
    if (incident.any((e) => e.id == null)) {
      throw ArgumentError.notNull('incident.id');
    }

    var $incident = incident
        .map(
          (e) => _i7.IncidentImplicit(
            e,
            $_serviceIncidentsServiceId: null,
          ),
        )
        .toList();
    await session.db.update<_i7.Incident>(
      $incident,
      columns: [_i7.Incident.t.$_serviceIncidentsServiceId],
      transaction: transaction,
    );
  }
}

class ServiceDetachRowRepository {
  const ServiceDetachRowRepository._();

  /// Detaches the relation between this [Service] and the given [HealthSignal]
  /// by setting the [HealthSignal]'s foreign key `_serviceSignalsServiceId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> signals(
    _i1.Session session,
    _i5.HealthSignal healthSignal, {
    _i1.Transaction? transaction,
  }) async {
    if (healthSignal.id == null) {
      throw ArgumentError.notNull('healthSignal.id');
    }

    var $healthSignal = _i5.HealthSignalImplicit(
      healthSignal,
      $_serviceSignalsServiceId: null,
    );
    await session.db.updateRow<_i5.HealthSignal>(
      $healthSignal,
      columns: [_i5.HealthSignal.t.$_serviceSignalsServiceId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Service] and the given [Rule]
  /// by setting the [Rule]'s foreign key `_serviceRulesServiceId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> rules(
    _i1.Session session,
    _i6.Rule rule, {
    _i1.Transaction? transaction,
  }) async {
    if (rule.id == null) {
      throw ArgumentError.notNull('rule.id');
    }

    var $rule = _i6.RuleImplicit(
      rule,
      $_serviceRulesServiceId: null,
    );
    await session.db.updateRow<_i6.Rule>(
      $rule,
      columns: [_i6.Rule.t.$_serviceRulesServiceId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Service] and the given [Incident]
  /// by setting the [Incident]'s foreign key `_serviceIncidentsServiceId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> incidents(
    _i1.Session session,
    _i7.Incident incident, {
    _i1.Transaction? transaction,
  }) async {
    if (incident.id == null) {
      throw ArgumentError.notNull('incident.id');
    }

    var $incident = _i7.IncidentImplicit(
      incident,
      $_serviceIncidentsServiceId: null,
    );
    await session.db.updateRow<_i7.Incident>(
      $incident,
      columns: [_i7.Incident.t.$_serviceIncidentsServiceId],
      transaction: transaction,
    );
  }
}
