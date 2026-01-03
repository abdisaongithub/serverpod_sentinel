import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';

class ForbiddenException implements Exception {
  final String message;
  ForbiddenException(this.message);
  @override
  String toString() => 'ForbiddenException: $message';
}

class SecurityChecks {
  /// Verifies the user is authenticated and has the specified role.
  /// Throws ForbiddenException if authorization fails.
  static Future<void> requireRole(Session session, String roleName) async {
    final userId = await _getUserId(session);
    if (userId == null) {
      throw ForbiddenException('Authentication required');
    }

    // Query UserRole join table to check if user has this role
    final userRoles = await UserRole.db.find(
      session,
      where: (t) => t.userId.equals(userId),
      include: UserRole.include(role: Role.include()),
    );

    final hasRole = userRoles.any((ur) => ur.role?.name == roleName);
    if (!hasRole) {
      throw ForbiddenException('Role "$roleName" required');
    }
  }

  /// Verifies the user has at least one of the specified roles.
  static Future<void> requireAnyRole(
    Session session,
    List<String> roleNames,
  ) async {
    final userId = await _getUserId(session);
    if (userId == null) {
      throw ForbiddenException('Authentication required');
    }

    final userRoles = await UserRole.db.find(
      session,
      where: (t) => t.userId.equals(userId),
      include: UserRole.include(role: Role.include()),
    );

    final hasAnyRole = userRoles.any((ur) => roleNames.contains(ur.role?.name));
    if (!hasAnyRole) {
      throw ForbiddenException(
        'One of roles "${roleNames.join(', ')}" required',
      );
    }
  }

  /// Ensures the user is logged in.
  static Future<int> requireAuthentication(Session session) async {
    final userId = await _getUserId(session);
    if (userId == null) {
      throw ForbiddenException('Authentication required');
    }
    return userId;
  }

  /// Helper to get user ID from session (leverages serverpod_auth).
  static Future<int?> _getUserId(Session session) async {
    // Serverpod auth stores authenticated user info in session.
    // This depends on how auth is configured. Typically:
    // session.auth.authenticatedUserId or similar.
    // For serverpod_auth_idp, check session.authenticationInfo?.userId
    final authInfo = await session.authenticated;
    return authInfo?.userId;
  }
}
