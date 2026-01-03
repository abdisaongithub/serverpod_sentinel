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
import '../security/user_role.dart' as _i2;
import 'package:serverpod_sentinel_server/src/generated/protocol.dart' as _i3;

/// A collection of permissions assignable to users.
abstract class Role implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Role._({
    this.id,
    required this.name,
    this.description,
    required this.permissions,
    this.users,
  });

  factory Role({
    int? id,
    required String name,
    String? description,
    required List<String> permissions,
    List<_i2.UserRole>? users,
  }) = _RoleImpl;

  factory Role.fromJson(Map<String, dynamic> jsonSerialization) {
    return Role(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      permissions: _i3.Protocol().deserialize<List<String>>(
        jsonSerialization['permissions'],
      ),
      users: jsonSerialization['users'] == null
          ? null
          : _i3.Protocol().deserialize<List<_i2.UserRole>>(
              jsonSerialization['users'],
            ),
    );
  }

  static final t = RoleTable();

  static const db = RoleRepository._();

  @override
  int? id;

  String name;

  String? description;

  List<String> permissions;

  List<_i2.UserRole>? users;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Role]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Role copyWith({
    int? id,
    String? name,
    String? description,
    List<String>? permissions,
    List<_i2.UserRole>? users,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Role',
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'permissions': permissions.toJson(),
      if (users != null) 'users': users?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Role',
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'permissions': permissions.toJson(),
      if (users != null)
        'users': users?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static RoleInclude include({_i2.UserRoleIncludeList? users}) {
    return RoleInclude._(users: users);
  }

  static RoleIncludeList includeList({
    _i1.WhereExpressionBuilder<RoleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RoleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RoleTable>? orderByList,
    RoleInclude? include,
  }) {
    return RoleIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Role.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Role.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RoleImpl extends Role {
  _RoleImpl({
    int? id,
    required String name,
    String? description,
    required List<String> permissions,
    List<_i2.UserRole>? users,
  }) : super._(
         id: id,
         name: name,
         description: description,
         permissions: permissions,
         users: users,
       );

  /// Returns a shallow copy of this [Role]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Role copyWith({
    Object? id = _Undefined,
    String? name,
    Object? description = _Undefined,
    List<String>? permissions,
    Object? users = _Undefined,
  }) {
    return Role(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      permissions: permissions ?? this.permissions.map((e0) => e0).toList(),
      users: users is List<_i2.UserRole>?
          ? users
          : this.users?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class RoleUpdateTable extends _i1.UpdateTable<RoleTable> {
  RoleUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> description(String? value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<List<String>, List<String>> permissions(List<String> value) =>
      _i1.ColumnValue(
        table.permissions,
        value,
      );
}

class RoleTable extends _i1.Table<int?> {
  RoleTable({super.tableRelation}) : super(tableName: 'role') {
    updateTable = RoleUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    permissions = _i1.ColumnSerializable<List<String>>(
      'permissions',
      this,
    );
  }

  late final RoleUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnSerializable<List<String>> permissions;

  _i2.UserRoleTable? ___users;

  _i1.ManyRelation<_i2.UserRoleTable>? _users;

  _i2.UserRoleTable get __users {
    if (___users != null) return ___users!;
    ___users = _i1.createRelationTable(
      relationFieldName: '__users',
      field: Role.t.id,
      foreignField: _i2.UserRole.t.$_roleUsersRoleId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserRoleTable(tableRelation: foreignTableRelation),
    );
    return ___users!;
  }

  _i1.ManyRelation<_i2.UserRoleTable> get users {
    if (_users != null) return _users!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'users',
      field: Role.t.id,
      foreignField: _i2.UserRole.t.$_roleUsersRoleId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserRoleTable(tableRelation: foreignTableRelation),
    );
    _users = _i1.ManyRelation<_i2.UserRoleTable>(
      tableWithRelations: relationTable,
      table: _i2.UserRoleTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _users!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    description,
    permissions,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'users') {
      return __users;
    }
    return null;
  }
}

class RoleInclude extends _i1.IncludeObject {
  RoleInclude._({_i2.UserRoleIncludeList? users}) {
    _users = users;
  }

  _i2.UserRoleIncludeList? _users;

  @override
  Map<String, _i1.Include?> get includes => {'users': _users};

  @override
  _i1.Table<int?> get table => Role.t;
}

class RoleIncludeList extends _i1.IncludeList {
  RoleIncludeList._({
    _i1.WhereExpressionBuilder<RoleTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Role.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Role.t;
}

class RoleRepository {
  const RoleRepository._();

  final attach = const RoleAttachRepository._();

  final attachRow = const RoleAttachRowRepository._();

  final detach = const RoleDetachRepository._();

  final detachRow = const RoleDetachRowRepository._();

  /// Returns a list of [Role]s matching the given query parameters.
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
  Future<List<Role>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RoleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RoleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RoleTable>? orderByList,
    _i1.Transaction? transaction,
    RoleInclude? include,
  }) async {
    return session.db.find<Role>(
      where: where?.call(Role.t),
      orderBy: orderBy?.call(Role.t),
      orderByList: orderByList?.call(Role.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Role] matching the given query parameters.
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
  Future<Role?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RoleTable>? where,
    int? offset,
    _i1.OrderByBuilder<RoleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RoleTable>? orderByList,
    _i1.Transaction? transaction,
    RoleInclude? include,
  }) async {
    return session.db.findFirstRow<Role>(
      where: where?.call(Role.t),
      orderBy: orderBy?.call(Role.t),
      orderByList: orderByList?.call(Role.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Role] by its [id] or null if no such row exists.
  Future<Role?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    RoleInclude? include,
  }) async {
    return session.db.findById<Role>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Role]s in the list and returns the inserted rows.
  ///
  /// The returned [Role]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Role>> insert(
    _i1.Session session,
    List<Role> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Role>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Role] and returns the inserted row.
  ///
  /// The returned [Role] will have its `id` field set.
  Future<Role> insertRow(
    _i1.Session session,
    Role row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Role>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Role]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Role>> update(
    _i1.Session session,
    List<Role> rows, {
    _i1.ColumnSelections<RoleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Role>(
      rows,
      columns: columns?.call(Role.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Role]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Role> updateRow(
    _i1.Session session,
    Role row, {
    _i1.ColumnSelections<RoleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Role>(
      row,
      columns: columns?.call(Role.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Role] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Role?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<RoleUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Role>(
      id,
      columnValues: columnValues(Role.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Role]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Role>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<RoleUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<RoleTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RoleTable>? orderBy,
    _i1.OrderByListBuilder<RoleTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Role>(
      columnValues: columnValues(Role.t.updateTable),
      where: where(Role.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Role.t),
      orderByList: orderByList?.call(Role.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Role]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Role>> delete(
    _i1.Session session,
    List<Role> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Role>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Role].
  Future<Role> deleteRow(
    _i1.Session session,
    Role row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Role>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Role>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RoleTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Role>(
      where: where(Role.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RoleTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Role>(
      where: where?.call(Role.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class RoleAttachRepository {
  const RoleAttachRepository._();

  /// Creates a relation between this [Role] and the given [UserRole]s
  /// by setting each [UserRole]'s foreign key `_roleUsersRoleId` to refer to this [Role].
  Future<void> users(
    _i1.Session session,
    Role role,
    List<_i2.UserRole> userRole, {
    _i1.Transaction? transaction,
  }) async {
    if (userRole.any((e) => e.id == null)) {
      throw ArgumentError.notNull('userRole.id');
    }
    if (role.id == null) {
      throw ArgumentError.notNull('role.id');
    }

    var $userRole = userRole
        .map(
          (e) => _i2.UserRoleImplicit(
            e,
            $_roleUsersRoleId: role.id,
          ),
        )
        .toList();
    await session.db.update<_i2.UserRole>(
      $userRole,
      columns: [_i2.UserRole.t.$_roleUsersRoleId],
      transaction: transaction,
    );
  }
}

class RoleAttachRowRepository {
  const RoleAttachRowRepository._();

  /// Creates a relation between this [Role] and the given [UserRole]
  /// by setting the [UserRole]'s foreign key `_roleUsersRoleId` to refer to this [Role].
  Future<void> users(
    _i1.Session session,
    Role role,
    _i2.UserRole userRole, {
    _i1.Transaction? transaction,
  }) async {
    if (userRole.id == null) {
      throw ArgumentError.notNull('userRole.id');
    }
    if (role.id == null) {
      throw ArgumentError.notNull('role.id');
    }

    var $userRole = _i2.UserRoleImplicit(
      userRole,
      $_roleUsersRoleId: role.id,
    );
    await session.db.updateRow<_i2.UserRole>(
      $userRole,
      columns: [_i2.UserRole.t.$_roleUsersRoleId],
      transaction: transaction,
    );
  }
}

class RoleDetachRepository {
  const RoleDetachRepository._();

  /// Detaches the relation between this [Role] and the given [UserRole]
  /// by setting the [UserRole]'s foreign key `_roleUsersRoleId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> users(
    _i1.Session session,
    List<_i2.UserRole> userRole, {
    _i1.Transaction? transaction,
  }) async {
    if (userRole.any((e) => e.id == null)) {
      throw ArgumentError.notNull('userRole.id');
    }

    var $userRole = userRole
        .map(
          (e) => _i2.UserRoleImplicit(
            e,
            $_roleUsersRoleId: null,
          ),
        )
        .toList();
    await session.db.update<_i2.UserRole>(
      $userRole,
      columns: [_i2.UserRole.t.$_roleUsersRoleId],
      transaction: transaction,
    );
  }
}

class RoleDetachRowRepository {
  const RoleDetachRowRepository._();

  /// Detaches the relation between this [Role] and the given [UserRole]
  /// by setting the [UserRole]'s foreign key `_roleUsersRoleId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> users(
    _i1.Session session,
    _i2.UserRole userRole, {
    _i1.Transaction? transaction,
  }) async {
    if (userRole.id == null) {
      throw ArgumentError.notNull('userRole.id');
    }

    var $userRole = _i2.UserRoleImplicit(
      userRole,
      $_roleUsersRoleId: null,
    );
    await session.db.updateRow<_i2.UserRole>(
      $userRole,
      columns: [_i2.UserRole.t.$_roleUsersRoleId],
      transaction: transaction,
    );
  }
}
