import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:serverpod_sentinel_server/src/exceptions/app_exceptions.dart';
import 'package:serverpod_sentinel_server/src/business/extensibility/api_key_service.dart';
import 'package:serverpod_sentinel_server/src/utils/security_config.dart';

class SecurityChecks {
  /// Verifies the user is authenticated and has the specified role.
  static Future<void> requireRole(Session session, String roleName) async {
    final userId = await requireAuthentication(session);

    if (userId == 0) {
      // API Keys/Service Tokens bypass role checks but are subject to permission checks.
      return;
    }

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

  /// Verifies the user has the specified permission.
  static Future<void> requirePermission(
    Session session,
    AppPermission permission,
  ) async {
    final authResult = await _authenticate(session);

    if (authResult is OpsUser) {
      final userRoles = await UserRole.db.find(
        session,
        where: (t) => t.userId.equals(authResult.id!),
        include: UserRole.include(role: Role.include()),
      );

      final allPermissions = userRoles
          .where((ur) => ur.role != null)
          .expand((ur) => ur.role!.permissions)
          .toSet();

      if (!allPermissions.contains(permission.name)) {
        throw ForbiddenException('Permission "${permission.name}" required');
      }
    } else if (authResult is SentinelApiKey) {
      if (!authResult.scopes.contains(permission.name) &&
          !authResult.scopes.contains('all')) {
        throw ForbiddenException(
          'API Key does not have scope "${permission.name}"',
        );
      }
    } else if (authResult == 0) {
      // Service Token (Agent) - currently broad access for telemetry
      return;
    } else {
      throw UnauthorizedException('Authentication required');
    }
  }

  /// Ensures the user is logged in.
  static Future<int> requireAuthentication(Session session) async {
    final auth = await _authenticate(session);
    if (auth == null) {
      throw UnauthorizedException('Authentication required');
    }
    if (auth is OpsUser) return auth.userInfoId;
    if (auth is SentinelApiKey) return auth.userId ?? 0;
    return 0; // Service Token
  }

  static Future<dynamic> _authenticate(Session session) async {
    // Bypass all authentication when auth is disabled (dev mode)
    if (SecurityConfig.disableAuth) {
      return 0; // Treat as service token with full access
    }

    final userId = await _getUserId(session);
    if (userId != null) {
      return await OpsUser.db.findFirstRow(
        session,
        where: (t) => t.userInfoId.equals(userId),
      );
    }

    final token = session.authenticationKey;
    if (token == null) return null;

    // 1. Try Platform API Key
    final apiKey = await ApiKeyService.validate(session, token);
    if (apiKey != null) return apiKey;

    // 2. Try Service Token (Agent)
    final validToken = await ServiceToken.db.findFirstRow(
      session,
      where: (t) => t.token.equals(token),
    );
    if (validToken != null &&
        (validToken.expiresAt == null ||
            validToken.expiresAt!.isAfter(DateTime.now()))) {
      return 0;
    }

    return null;
  }

  /// Helper to get user ID from session.
  static Future<int?> _getUserId(Session session) async {
    final authInfo = await session.authenticated;
    return (authInfo as dynamic)?.userId;
  }
}
