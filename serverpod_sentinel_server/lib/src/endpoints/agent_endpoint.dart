import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';

class AgentEndpoint extends Endpoint {
  /// Check for any pending tasks for a specific agent
  Future<AgentTask?> pollTask(Session session, int serviceId) async {
    return await AgentTask.db.findFirstRow(
      session,
      where: (t) => t.serviceId.equals(serviceId) & t.status.equals(AgentTaskStatus.pending),
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
}
