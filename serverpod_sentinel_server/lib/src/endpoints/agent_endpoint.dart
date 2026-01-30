import 'dart:io';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';

class AgentEndpoint extends Endpoint {
  /// Check for any pending tasks for a specific agent
  Future<AgentTask?> pollTask(Session session, int serviceId) async {
    return await AgentTask.db.findFirstRow(
      session,
      where: (t) =>
          t.serviceId.equals(serviceId) &
          t.status.equals(AgentTaskStatus.pending),
      orderBy: (t) => t.timestamp,
    );
  }

  /// Update status and result of a task
  Future<void> updateTaskStatus(
    Session session,
    int taskId,
    AgentTaskStatus status, {
    String? output,
    int? exitCode,
  }) async {
    final task = await AgentTask.db.findById(session, taskId);
    if (task != null) {
      task.status = status;
      if (output != null) task.output = output;
      if (exitCode != null) task.exitCode = exitCode;
      await AgentTask.db.updateRow(session, task);
    }
  }

  /// Create a new task for an agent
  Future<AgentTask> createTask(
    Session session,
    int serviceId,
    String command, {
    List<String>? arguments,
    int timeoutSeconds = 60,
  }) async {
    final task = AgentTask(
      id: 0,
      serviceId: serviceId,
      command: command,
      arguments: arguments,
      timestamp: DateTime.now(),
      timeoutSeconds: timeoutSeconds,
      status: AgentTaskStatus.pending,
    );
    return await AgentTask.db.insertRow(session, task);
  }

  /// Generates a JWT token for the agent and updates the agent's config file.
  Future<bool> generateConnection(Session session, int serviceId) async {
    // 1. Create/Find User
    final email = 'agent_$serviceId@sentinel.system';
    var userInfo = await Users.findUserByEmail(session, email);
    if (userInfo == null) {
      userInfo = UserInfo(
        userIdentifier: email,
        userName: 'Agent $serviceId',
        email: email,
        created: DateTime.now(),
        scopeNames: ['agent'],
        blocked: false,
      );
      userInfo = await Users.createUser(session, userInfo);
    }
    if (userInfo == null) return false;

    // 2. Sign In
    final authInfo = await UserAuthentication.signInUser(
      session,
      userInfo.id!,
      'agent',
    );
    final token = authInfo.key;

    // 3. Update File
    // Try to find the file relative to the server execution directory
    final configFile = File('../sentinel_agent/config.yaml');
    if (!await configFile.exists()) {
      session.log(
        'Config file not found at ${configFile.path}',
        level: LogLevel.error,
      );
      return false;
    }

    var content = await configFile.readAsString();
    // Regex replace to update api_key
    content = content.replaceAll(RegExp(r'api_key: .*'), 'api_key: $token');
    await configFile.writeAsString(content);

    return true;
  }
}
