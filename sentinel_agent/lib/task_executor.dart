import 'dart:io';
import 'package:logging/logging.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';

class TaskExecutor {
  static final _log = Logger('TaskExecutor');

  /// Executes a command received from the server.
  static Future<void> executeTask(Client client, AgentTask task) async {
    _log.shout('EXEC: Received remote task [${task.id}]: ${task.command} ${task.arguments?.join(' ') ?? ''}');

    try {
      // 1. Mark as in progress
      await client.agent.updateTaskStatus(
        task.id!,
        AgentTaskStatus.inProgress,
      );

      // 2. Run the process
      final result = await Process.run(
        task.command,
        task.arguments ?? [],
        runInShell: true,
      ).timeout(Duration(seconds: task.timeoutSeconds));

      // 3. Report completion
      await client.agent.updateTaskStatus(
        task.id!,
        AgentTaskStatus.completed,
        output: result.stdout.toString() + result.stderr.toString(),
        exitCode: result.exitCode,
      );

      _log.info('TASK SUCCESS: [${task.id}] exited with ${result.exitCode}');
    } catch (e) {
      _log.severe('TASK FAILED: [${task.id}] Error: $e');
      await client.agent.updateTaskStatus(
        task.id!,
        AgentTaskStatus.failed,
        output: e.toString(),
        exitCode: -1,
      );
    }
  }
}
