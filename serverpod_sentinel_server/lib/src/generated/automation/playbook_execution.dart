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
import '../automation/playbook.dart' as _i2;
import '../incident/incident.dart' as _i3;
import '../security/ops_user.dart' as _i4;
import '../enums/execution_status.dart' as _i5;
import 'package:serverpod_sentinel_server/src/generated/protocol.dart' as _i6;

/// An instance of a playbook running against a specific incident.
abstract class PlaybookExecution
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PlaybookExecution._({
    this.id,
    required this.playbookId,
    required this.playbookId,
    this.playbook,
    required this.incidentId,
    required this.incidentId,
    this.incident,
    required this.initiatorId,
    required this.initiatorId,
    this.initiator,
    required this.status,
    required this.startedAt,
    this.completedAt,
    this.resultSummary,
  }) : _playbookExecutionsPlaybookId = null,
       _incidentExecutionsIncidentId = null,
       _opsUserPlaybookexecutionsOpsUserId = null;

  factory PlaybookExecution({
    int? id,
    required int playbookId,
    required int playbookId,
    _i2.Playbook? playbook,
    required int incidentId,
    required int incidentId,
    _i3.Incident? incident,
    required int initiatorId,
    required int initiatorId,
    _i4.OpsUser? initiator,
    required _i5.ExecutionStatus status,
    required DateTime startedAt,
    DateTime? completedAt,
    String? resultSummary,
  }) = _PlaybookExecutionImpl;

  factory PlaybookExecution.fromJson(Map<String, dynamic> jsonSerialization) {
    return PlaybookExecutionImplicit._(
      id: jsonSerialization['id'] as int?,
      playbookId: jsonSerialization['playbookId'] as int,
      playbook: jsonSerialization['playbook'] == null
          ? null
          : _i6.Protocol().deserialize<_i2.Playbook>(
              jsonSerialization['playbook'],
            ),
      incidentId: jsonSerialization['incidentId'] as int,
      incident: jsonSerialization['incident'] == null
          ? null
          : _i6.Protocol().deserialize<_i3.Incident>(
              jsonSerialization['incident'],
            ),
      initiatorId: jsonSerialization['initiatorId'] as int,
      initiator: jsonSerialization['initiator'] == null
          ? null
          : _i6.Protocol().deserialize<_i4.OpsUser>(
              jsonSerialization['initiator'],
            ),
      status: _i5.ExecutionStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      startedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['startedAt'],
      ),
      completedAt: jsonSerialization['completedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['completedAt'],
            ),
      resultSummary: jsonSerialization['resultSummary'] as String?,
      $_playbookExecutionsPlaybookId:
          jsonSerialization['_playbookExecutionsPlaybookId'] as int?,
      $_incidentExecutionsIncidentId:
          jsonSerialization['_incidentExecutionsIncidentId'] as int?,
      $_opsUserPlaybookexecutionsOpsUserId:
          jsonSerialization['_opsUserPlaybookexecutionsOpsUserId'] as int?,
    );
  }

  static final t = PlaybookExecutionTable();

  static const db = PlaybookExecutionRepository._();

  @override
  int? id;

  int playbookId;

  int playbookId;

  _i2.Playbook? playbook;

  int incidentId;

  int incidentId;

  _i3.Incident? incident;

  int initiatorId;

  int initiatorId;

  _i4.OpsUser? initiator;

  _i5.ExecutionStatus status;

  DateTime startedAt;

  DateTime? completedAt;

  String? resultSummary;

  final int? _playbookExecutionsPlaybookId;

  final int? _incidentExecutionsIncidentId;

  final int? _opsUserPlaybookexecutionsOpsUserId;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PlaybookExecution]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PlaybookExecution copyWith({
    int? id,
    int? playbookId,
    int? playbookId,
    _i2.Playbook? playbook,
    int? incidentId,
    int? incidentId,
    _i3.Incident? incident,
    int? initiatorId,
    int? initiatorId,
    _i4.OpsUser? initiator,
    _i5.ExecutionStatus? status,
    DateTime? startedAt,
    DateTime? completedAt,
    String? resultSummary,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PlaybookExecution',
      if (id != null) 'id': id,
      'playbookId': playbookId,
      'playbookId': playbookId,
      if (playbook != null) 'playbook': playbook?.toJson(),
      'incidentId': incidentId,
      'incidentId': incidentId,
      if (incident != null) 'incident': incident?.toJson(),
      'initiatorId': initiatorId,
      'initiatorId': initiatorId,
      if (initiator != null) 'initiator': initiator?.toJson(),
      'status': status.toJson(),
      'startedAt': startedAt.toJson(),
      if (completedAt != null) 'completedAt': completedAt?.toJson(),
      if (resultSummary != null) 'resultSummary': resultSummary,
      if (_playbookExecutionsPlaybookId != null)
        '_playbookExecutionsPlaybookId': _playbookExecutionsPlaybookId,
      if (_incidentExecutionsIncidentId != null)
        '_incidentExecutionsIncidentId': _incidentExecutionsIncidentId,
      if (_opsUserPlaybookexecutionsOpsUserId != null)
        '_opsUserPlaybookexecutionsOpsUserId':
            _opsUserPlaybookexecutionsOpsUserId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PlaybookExecution',
      if (id != null) 'id': id,
      'playbookId': playbookId,
      'playbookId': playbookId,
      if (playbook != null) 'playbook': playbook?.toJsonForProtocol(),
      'incidentId': incidentId,
      'incidentId': incidentId,
      if (incident != null) 'incident': incident?.toJsonForProtocol(),
      'initiatorId': initiatorId,
      'initiatorId': initiatorId,
      if (initiator != null) 'initiator': initiator?.toJsonForProtocol(),
      'status': status.toJson(),
      'startedAt': startedAt.toJson(),
      if (completedAt != null) 'completedAt': completedAt?.toJson(),
      if (resultSummary != null) 'resultSummary': resultSummary,
    };
  }

  static PlaybookExecutionInclude include({
    _i2.PlaybookInclude? playbook,
    _i3.IncidentInclude? incident,
    _i4.OpsUserInclude? initiator,
  }) {
    return PlaybookExecutionInclude._(
      playbook: playbook,
      incident: incident,
      initiator: initiator,
    );
  }

  static PlaybookExecutionIncludeList includeList({
    _i1.WhereExpressionBuilder<PlaybookExecutionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlaybookExecutionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlaybookExecutionTable>? orderByList,
    PlaybookExecutionInclude? include,
  }) {
    return PlaybookExecutionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PlaybookExecution.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PlaybookExecution.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PlaybookExecutionImpl extends PlaybookExecution {
  _PlaybookExecutionImpl({
    int? id,
    required int playbookId,
    required int playbookId,
    _i2.Playbook? playbook,
    required int incidentId,
    required int incidentId,
    _i3.Incident? incident,
    required int initiatorId,
    required int initiatorId,
    _i4.OpsUser? initiator,
    required _i5.ExecutionStatus status,
    required DateTime startedAt,
    DateTime? completedAt,
    String? resultSummary,
  }) : super._(
         id: id,
         playbookId: playbookId,
         playbook: playbook,
         incidentId: incidentId,
         incident: incident,
         initiatorId: initiatorId,
         initiator: initiator,
         status: status,
         startedAt: startedAt,
         completedAt: completedAt,
         resultSummary: resultSummary,
       );

  /// Returns a shallow copy of this [PlaybookExecution]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PlaybookExecution copyWith({
    Object? id = _Undefined,
    int? playbookId,
    int? playbookId,
    Object? playbook = _Undefined,
    int? incidentId,
    int? incidentId,
    Object? incident = _Undefined,
    int? initiatorId,
    int? initiatorId,
    Object? initiator = _Undefined,
    _i5.ExecutionStatus? status,
    DateTime? startedAt,
    Object? completedAt = _Undefined,
    Object? resultSummary = _Undefined,
  }) {
    return PlaybookExecutionImplicit._(
      id: id is int? ? id : this.id,
      playbookId: playbookId ?? this.playbookId,
      playbook: playbook is _i2.Playbook?
          ? playbook
          : this.playbook?.copyWith(),
      incidentId: incidentId ?? this.incidentId,
      incident: incident is _i3.Incident?
          ? incident
          : this.incident?.copyWith(),
      initiatorId: initiatorId ?? this.initiatorId,
      initiator: initiator is _i4.OpsUser?
          ? initiator
          : this.initiator?.copyWith(),
      status: status ?? this.status,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt is DateTime? ? completedAt : this.completedAt,
      resultSummary: resultSummary is String?
          ? resultSummary
          : this.resultSummary,
      $_playbookExecutionsPlaybookId: this._playbookExecutionsPlaybookId,
      $_incidentExecutionsIncidentId: this._incidentExecutionsIncidentId,
      $_opsUserPlaybookexecutionsOpsUserId:
          this._opsUserPlaybookexecutionsOpsUserId,
    );
  }
}

class PlaybookExecutionImplicit extends _PlaybookExecutionImpl {
  PlaybookExecutionImplicit._({
    int? id,
    required int playbookId,
    required int playbookId,
    _i2.Playbook? playbook,
    required int incidentId,
    required int incidentId,
    _i3.Incident? incident,
    required int initiatorId,
    required int initiatorId,
    _i4.OpsUser? initiator,
    required _i5.ExecutionStatus status,
    required DateTime startedAt,
    DateTime? completedAt,
    String? resultSummary,
    int? $_playbookExecutionsPlaybookId,
    int? $_incidentExecutionsIncidentId,
    int? $_opsUserPlaybookexecutionsOpsUserId,
  }) : _playbookExecutionsPlaybookId = $_playbookExecutionsPlaybookId,
       _incidentExecutionsIncidentId = $_incidentExecutionsIncidentId,
       _opsUserPlaybookexecutionsOpsUserId =
           $_opsUserPlaybookexecutionsOpsUserId,
       super(
         id: id,
         playbookId: playbookId,
         playbook: playbook,
         incidentId: incidentId,
         incident: incident,
         initiatorId: initiatorId,
         initiator: initiator,
         status: status,
         startedAt: startedAt,
         completedAt: completedAt,
         resultSummary: resultSummary,
       );

  factory PlaybookExecutionImplicit(
    PlaybookExecution playbookExecution, {
    int? $_playbookExecutionsPlaybookId,
    int? $_incidentExecutionsIncidentId,
    int? $_opsUserPlaybookexecutionsOpsUserId,
  }) {
    return PlaybookExecutionImplicit._(
      id: playbookExecution.id,
      playbookId: playbookExecution.playbookId,
      playbook: playbookExecution.playbook,
      incidentId: playbookExecution.incidentId,
      incident: playbookExecution.incident,
      initiatorId: playbookExecution.initiatorId,
      initiator: playbookExecution.initiator,
      status: playbookExecution.status,
      startedAt: playbookExecution.startedAt,
      completedAt: playbookExecution.completedAt,
      resultSummary: playbookExecution.resultSummary,
      $_playbookExecutionsPlaybookId: $_playbookExecutionsPlaybookId,
      $_incidentExecutionsIncidentId: $_incidentExecutionsIncidentId,
      $_opsUserPlaybookexecutionsOpsUserId:
          $_opsUserPlaybookexecutionsOpsUserId,
    );
  }

  @override
  final int? _playbookExecutionsPlaybookId;

  @override
  final int? _incidentExecutionsIncidentId;

  @override
  final int? _opsUserPlaybookexecutionsOpsUserId;
}

class PlaybookExecutionUpdateTable
    extends _i1.UpdateTable<PlaybookExecutionTable> {
  PlaybookExecutionUpdateTable(super.table);

  _i1.ColumnValue<int, int> playbookId(int value) => _i1.ColumnValue(
    table.playbookId,
    value,
  );

  _i1.ColumnValue<int, int> playbookId(int value) => _i1.ColumnValue(
    table.playbookId,
    value,
  );

  _i1.ColumnValue<int, int> incidentId(int value) => _i1.ColumnValue(
    table.incidentId,
    value,
  );

  _i1.ColumnValue<int, int> incidentId(int value) => _i1.ColumnValue(
    table.incidentId,
    value,
  );

  _i1.ColumnValue<int, int> initiatorId(int value) => _i1.ColumnValue(
    table.initiatorId,
    value,
  );

  _i1.ColumnValue<int, int> initiatorId(int value) => _i1.ColumnValue(
    table.initiatorId,
    value,
  );

  _i1.ColumnValue<_i5.ExecutionStatus, _i5.ExecutionStatus> status(
    _i5.ExecutionStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> startedAt(DateTime value) =>
      _i1.ColumnValue(
        table.startedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> completedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.completedAt,
        value,
      );

  _i1.ColumnValue<String, String> resultSummary(String? value) =>
      _i1.ColumnValue(
        table.resultSummary,
        value,
      );

  _i1.ColumnValue<int, int> $_playbookExecutionsPlaybookId(int? value) =>
      _i1.ColumnValue(
        table.$_playbookExecutionsPlaybookId,
        value,
      );

  _i1.ColumnValue<int, int> $_incidentExecutionsIncidentId(int? value) =>
      _i1.ColumnValue(
        table.$_incidentExecutionsIncidentId,
        value,
      );

  _i1.ColumnValue<int, int> $_opsUserPlaybookexecutionsOpsUserId(int? value) =>
      _i1.ColumnValue(
        table.$_opsUserPlaybookexecutionsOpsUserId,
        value,
      );
}

class PlaybookExecutionTable extends _i1.Table<int?> {
  PlaybookExecutionTable({super.tableRelation})
    : super(tableName: 'playbook_execution') {
    updateTable = PlaybookExecutionUpdateTable(this);
    playbookId = _i1.ColumnInt(
      'playbookId',
      this,
    );
    playbookId = _i1.ColumnInt(
      'playbookId',
      this,
    );
    incidentId = _i1.ColumnInt(
      'incidentId',
      this,
    );
    incidentId = _i1.ColumnInt(
      'incidentId',
      this,
    );
    initiatorId = _i1.ColumnInt(
      'initiatorId',
      this,
    );
    initiatorId = _i1.ColumnInt(
      'initiatorId',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
    );
    startedAt = _i1.ColumnDateTime(
      'startedAt',
      this,
    );
    completedAt = _i1.ColumnDateTime(
      'completedAt',
      this,
    );
    resultSummary = _i1.ColumnString(
      'resultSummary',
      this,
    );
    $_playbookExecutionsPlaybookId = _i1.ColumnInt(
      '_playbookExecutionsPlaybookId',
      this,
    );
    $_incidentExecutionsIncidentId = _i1.ColumnInt(
      '_incidentExecutionsIncidentId',
      this,
    );
    $_opsUserPlaybookexecutionsOpsUserId = _i1.ColumnInt(
      '_opsUserPlaybookexecutionsOpsUserId',
      this,
    );
  }

  late final PlaybookExecutionUpdateTable updateTable;

  late final _i1.ColumnInt playbookId;

  late final _i1.ColumnInt playbookId;

  _i2.PlaybookTable? _playbook;

  late final _i1.ColumnInt incidentId;

  late final _i1.ColumnInt incidentId;

  _i3.IncidentTable? _incident;

  late final _i1.ColumnInt initiatorId;

  late final _i1.ColumnInt initiatorId;

  _i4.OpsUserTable? _initiator;

  late final _i1.ColumnEnum<_i5.ExecutionStatus> status;

  late final _i1.ColumnDateTime startedAt;

  late final _i1.ColumnDateTime completedAt;

  late final _i1.ColumnString resultSummary;

  late final _i1.ColumnInt $_playbookExecutionsPlaybookId;

  late final _i1.ColumnInt $_incidentExecutionsIncidentId;

  late final _i1.ColumnInt $_opsUserPlaybookexecutionsOpsUserId;

  _i2.PlaybookTable get playbook {
    if (_playbook != null) return _playbook!;
    _playbook = _i1.createRelationTable(
      relationFieldName: 'playbook',
      field: PlaybookExecution.t.playbookId,
      foreignField: _i2.Playbook.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PlaybookTable(tableRelation: foreignTableRelation),
    );
    return _playbook!;
  }

  _i3.IncidentTable get incident {
    if (_incident != null) return _incident!;
    _incident = _i1.createRelationTable(
      relationFieldName: 'incident',
      field: PlaybookExecution.t.incidentId,
      foreignField: _i3.Incident.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.IncidentTable(tableRelation: foreignTableRelation),
    );
    return _incident!;
  }

  _i4.OpsUserTable get initiator {
    if (_initiator != null) return _initiator!;
    _initiator = _i1.createRelationTable(
      relationFieldName: 'initiator',
      field: PlaybookExecution.t.initiatorId,
      foreignField: _i4.OpsUser.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.OpsUserTable(tableRelation: foreignTableRelation),
    );
    return _initiator!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    playbookId,
    playbookId,
    incidentId,
    incidentId,
    initiatorId,
    initiatorId,
    status,
    startedAt,
    completedAt,
    resultSummary,
    $_playbookExecutionsPlaybookId,
    $_incidentExecutionsIncidentId,
    $_opsUserPlaybookexecutionsOpsUserId,
  ];

  @override
  List<_i1.Column> get managedColumns => [
    id,
    playbookId,
    playbookId,
    incidentId,
    incidentId,
    initiatorId,
    initiatorId,
    status,
    startedAt,
    completedAt,
    resultSummary,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'playbook') {
      return playbook;
    }
    if (relationField == 'incident') {
      return incident;
    }
    if (relationField == 'initiator') {
      return initiator;
    }
    return null;
  }
}

class PlaybookExecutionInclude extends _i1.IncludeObject {
  PlaybookExecutionInclude._({
    _i2.PlaybookInclude? playbook,
    _i3.IncidentInclude? incident,
    _i4.OpsUserInclude? initiator,
  }) {
    _playbook = playbook;
    _incident = incident;
    _initiator = initiator;
  }

  _i2.PlaybookInclude? _playbook;

  _i3.IncidentInclude? _incident;

  _i4.OpsUserInclude? _initiator;

  @override
  Map<String, _i1.Include?> get includes => {
    'playbook': _playbook,
    'incident': _incident,
    'initiator': _initiator,
  };

  @override
  _i1.Table<int?> get table => PlaybookExecution.t;
}

class PlaybookExecutionIncludeList extends _i1.IncludeList {
  PlaybookExecutionIncludeList._({
    _i1.WhereExpressionBuilder<PlaybookExecutionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PlaybookExecution.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PlaybookExecution.t;
}

class PlaybookExecutionRepository {
  const PlaybookExecutionRepository._();

  final attachRow = const PlaybookExecutionAttachRowRepository._();

  /// Returns a list of [PlaybookExecution]s matching the given query parameters.
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
  Future<List<PlaybookExecution>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlaybookExecutionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlaybookExecutionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlaybookExecutionTable>? orderByList,
    _i1.Transaction? transaction,
    PlaybookExecutionInclude? include,
  }) async {
    return session.db.find<PlaybookExecution>(
      where: where?.call(PlaybookExecution.t),
      orderBy: orderBy?.call(PlaybookExecution.t),
      orderByList: orderByList?.call(PlaybookExecution.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PlaybookExecution] matching the given query parameters.
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
  Future<PlaybookExecution?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlaybookExecutionTable>? where,
    int? offset,
    _i1.OrderByBuilder<PlaybookExecutionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlaybookExecutionTable>? orderByList,
    _i1.Transaction? transaction,
    PlaybookExecutionInclude? include,
  }) async {
    return session.db.findFirstRow<PlaybookExecution>(
      where: where?.call(PlaybookExecution.t),
      orderBy: orderBy?.call(PlaybookExecution.t),
      orderByList: orderByList?.call(PlaybookExecution.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PlaybookExecution] by its [id] or null if no such row exists.
  Future<PlaybookExecution?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PlaybookExecutionInclude? include,
  }) async {
    return session.db.findById<PlaybookExecution>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PlaybookExecution]s in the list and returns the inserted rows.
  ///
  /// The returned [PlaybookExecution]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PlaybookExecution>> insert(
    _i1.Session session,
    List<PlaybookExecution> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PlaybookExecution>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PlaybookExecution] and returns the inserted row.
  ///
  /// The returned [PlaybookExecution] will have its `id` field set.
  Future<PlaybookExecution> insertRow(
    _i1.Session session,
    PlaybookExecution row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PlaybookExecution>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PlaybookExecution]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PlaybookExecution>> update(
    _i1.Session session,
    List<PlaybookExecution> rows, {
    _i1.ColumnSelections<PlaybookExecutionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PlaybookExecution>(
      rows,
      columns: columns?.call(PlaybookExecution.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PlaybookExecution]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PlaybookExecution> updateRow(
    _i1.Session session,
    PlaybookExecution row, {
    _i1.ColumnSelections<PlaybookExecutionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PlaybookExecution>(
      row,
      columns: columns?.call(PlaybookExecution.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PlaybookExecution] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<PlaybookExecution?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<PlaybookExecutionUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<PlaybookExecution>(
      id,
      columnValues: columnValues(PlaybookExecution.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [PlaybookExecution]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<PlaybookExecution>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<PlaybookExecutionUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<PlaybookExecutionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlaybookExecutionTable>? orderBy,
    _i1.OrderByListBuilder<PlaybookExecutionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<PlaybookExecution>(
      columnValues: columnValues(PlaybookExecution.t.updateTable),
      where: where(PlaybookExecution.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PlaybookExecution.t),
      orderByList: orderByList?.call(PlaybookExecution.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [PlaybookExecution]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PlaybookExecution>> delete(
    _i1.Session session,
    List<PlaybookExecution> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PlaybookExecution>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PlaybookExecution].
  Future<PlaybookExecution> deleteRow(
    _i1.Session session,
    PlaybookExecution row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PlaybookExecution>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PlaybookExecution>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PlaybookExecutionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PlaybookExecution>(
      where: where(PlaybookExecution.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlaybookExecutionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PlaybookExecution>(
      where: where?.call(PlaybookExecution.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PlaybookExecutionAttachRowRepository {
  const PlaybookExecutionAttachRowRepository._();

  /// Creates a relation between the given [PlaybookExecution] and [Playbook]
  /// by setting the [PlaybookExecution]'s foreign key `playbookId` to refer to the [Playbook].
  Future<void> playbook(
    _i1.Session session,
    PlaybookExecution playbookExecution,
    _i2.Playbook playbook, {
    _i1.Transaction? transaction,
  }) async {
    if (playbookExecution.id == null) {
      throw ArgumentError.notNull('playbookExecution.id');
    }
    if (playbook.id == null) {
      throw ArgumentError.notNull('playbook.id');
    }

    var $playbookExecution = playbookExecution.copyWith(
      playbookId: playbook.id,
    );
    await session.db.updateRow<PlaybookExecution>(
      $playbookExecution,
      columns: [PlaybookExecution.t.playbookId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [PlaybookExecution] and [Incident]
  /// by setting the [PlaybookExecution]'s foreign key `incidentId` to refer to the [Incident].
  Future<void> incident(
    _i1.Session session,
    PlaybookExecution playbookExecution,
    _i3.Incident incident, {
    _i1.Transaction? transaction,
  }) async {
    if (playbookExecution.id == null) {
      throw ArgumentError.notNull('playbookExecution.id');
    }
    if (incident.id == null) {
      throw ArgumentError.notNull('incident.id');
    }

    var $playbookExecution = playbookExecution.copyWith(
      incidentId: incident.id,
    );
    await session.db.updateRow<PlaybookExecution>(
      $playbookExecution,
      columns: [PlaybookExecution.t.incidentId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [PlaybookExecution] and [OpsUser]
  /// by setting the [PlaybookExecution]'s foreign key `initiatorId` to refer to the [OpsUser].
  Future<void> initiator(
    _i1.Session session,
    PlaybookExecution playbookExecution,
    _i4.OpsUser initiator, {
    _i1.Transaction? transaction,
  }) async {
    if (playbookExecution.id == null) {
      throw ArgumentError.notNull('playbookExecution.id');
    }
    if (initiator.id == null) {
      throw ArgumentError.notNull('initiator.id');
    }

    var $playbookExecution = playbookExecution.copyWith(
      initiatorId: initiator.id,
    );
    await session.db.updateRow<PlaybookExecution>(
      $playbookExecution,
      columns: [PlaybookExecution.t.initiatorId],
      transaction: transaction,
    );
  }
}
