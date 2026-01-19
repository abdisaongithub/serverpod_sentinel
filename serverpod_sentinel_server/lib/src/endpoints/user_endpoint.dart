import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class UserEndpoint extends Endpoint {
  /// Get current authenticated user profile
  Future<TeamMember?> getCurrentUser(Session session) async {
    // Dynamic cast workaround for authentication info
    final authInfo = (await session.authenticated) as dynamic;
    final int? userId = authInfo?.userId;

    if (userId == null) return null;

    final opsUser = await OpsUser.db.findFirstRow(
      session,
      where: (t) => t.userInfoId.equals(userId),
      include: OpsUser.include(
        roles: UserRole.includeList(),
      ),
    );

    if (opsUser == null) return null;

    final userInfo = await Users.findUserByUserId(session, userId);

    if (userInfo == null) return null;

    return TeamMember(
      user: opsUser,
      userName: userInfo.userName ?? 'Unknown',
      email: userInfo.email,
      imageUrl: userInfo.imageUrl,
    );
  }

  /// List team members
  Future<List<TeamMember>> listTeamMembers(Session session) async {
    final opsUsers = await OpsUser.db.find(
      session,
      include: OpsUser.include(
        roles: UserRole.includeList(),
      ),
      orderBy: (t) => t.createdAt,
    );

    final List<TeamMember> members = [];
    for (final user in opsUsers) {
      final userInfo = await Users.findUserByUserId(session, user.userInfoId);
      if (userInfo != null) {
        members.add(
          TeamMember(
            user: user,
            userName: userInfo.userName ?? 'Unknown',
            email: userInfo.email,
            imageUrl: userInfo.imageUrl,
          ),
        );
      }
    }
    return members;
  }

  /// Get user by ID
  Future<TeamMember?> get(Session session, int id) async {
    final opsUser = await OpsUser.db.findById(
      session,
      id,
      include: OpsUser.include(
        roles: UserRole.includeList(),
      ),
    );

    if (opsUser == null) return null;

    final userInfo = await Users.findUserByUserId(session, opsUser.userInfoId);

    if (userInfo == null) return null;

    return TeamMember(
      user: opsUser,
      userName: userInfo.userName ?? 'Unknown',
      email: userInfo.email,
      imageUrl: userInfo.imageUrl,
    );
  }

  /// Update user profile
  Future<OpsUser> update(Session session, OpsUser user) async {
    user.updatedAt = DateTime.now();
    return await OpsUser.db.updateRow(session, user);
  }

  /// Assign role to user
  Future<UserRole> assignRole(Session session, int userId, int roleId) async {
    final userRole = UserRole(
      userId: userId,
      roleId: roleId,
      // createdAt removed as it's not in protocol
    );
    return await UserRole.db.insertRow(session, userRole);
  }

  /// Remove role from user
  Future<bool> removeRole(Session session, int userId, int roleId) async {
    final deleted = await UserRole.db.deleteWhere(
      session,
      where: (t) => t.userId.equals(userId) & t.roleId.equals(roleId),
    );
    return deleted.isNotEmpty;
  }
}
