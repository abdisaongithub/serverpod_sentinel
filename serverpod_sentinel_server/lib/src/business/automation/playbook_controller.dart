import 'dart:convert';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:serverpod_sentinel_server/src/future_calls/step_executor_call.dart';

class PlaybookController {
  /// Parses the playbook content JSON into a list of step configurations.
  List<Map<String, dynamic>> parseSteps(String content) {
    try {
      final decoded = jsonDecode(content);
      if (decoded is List) {
        return decoded.cast<Map<String, dynamic>>();
      } else if (decoded is Map && decoded.containsKey('steps')) {
        return (decoded['steps'] as List).cast<Map<String, dynamic>>();
      }
      return [];
    } catch (e) {
      print('Error parsing playbook content: $e');
      return [];
    }
  }

  /// Evaluates the DAG and schedules pending steps.
  Future<void> evaluateNextSteps(Session session, int executionId) async {
    final execution = await PlaybookExecution.db.findById(
      session,
      executionId,
      include: PlaybookExecution.include(playbook: Playbook.include()),
    );
    if (execution == null) return;

    if (execution.status == ExecutionStatus.COMPLETED ||
        execution.status == ExecutionStatus.FAILED)
      return;

    // Fetch all step executions
    final stepExecutions = await PlaybookStepExecution.db.find(
      session,
      where: (t) => t.executionId.equals(executionId),
    );

    // Parse Playbook JSON to get the DAG
    final stepsConfig = parseSteps(execution.playbook?.content ?? '{}');

    bool allCompleted = true;
    bool anyFailed = false;

    for (var step in stepsConfig) {
      final stepId = step['id'];
      final List<dynamic> dependsOn = step['depends_on'] ?? [];

      // Find execution record for this step
      var stepRecord = stepExecutions.firstWhere(
        (s) => s.stepId == stepId,
        orElse: () => _createPhantomRecord(stepId),
      );

      // If already started/completed, skip
      if (stepRecord.id != null) {
        // Has been created in DB
        if (stepRecord.status == ExecutionStatus.FAILED) anyFailed = true;
        if (stepRecord.status != ExecutionStatus.COMPLETED)
          allCompleted = false;
        continue;
      }

      // Check dependencies
      bool ready = true;
      for (var depId in dependsOn) {
        final depRecord = stepExecutions.firstWhere(
          (s) => s.stepId == depId,
          orElse: () => _createPhantomRecord(depId),
        );
        if (depRecord.status != ExecutionStatus.COMPLETED) {
          ready = false;
          break;
        }
      }

      if (ready) {
        allCompleted = false; // There is work to do
        // Create the record as PENDING
        final newRecord = PlaybookStepExecution(
          executionId: executionId,
          stepId: stepId,
          status: ExecutionStatus.PENDING, // Using PENDING or RUNNING
          startedAt: DateTime.now(),
        );
        final createdRecord = await PlaybookStepExecution.db.insertRow(
          session,
          newRecord,
        );

        // Schedule FutureCall
        await session.serverpod.futureCallWithDelay(
          'stepExecutor',
          StepExecutorPayload(stepExecutionId: createdRecord.id!),
          Duration(seconds: 1), // Immediate async
        );
      } else {
        allCompleted = false;
      }
    }

    if (anyFailed) {
      execution.status = ExecutionStatus.FAILED;
      execution.completedAt = DateTime.now();
      await PlaybookExecution.db.updateRow(session, execution);
    } else if (allCompleted) {
      execution.status = ExecutionStatus.COMPLETED;
      execution.completedAt = DateTime.now();
      await PlaybookExecution.db.updateRow(session, execution);
    }
  }

  PlaybookStepExecution _createPhantomRecord(String id) {
    // Helper for 'orElse' to return a dummy object indicating "not found in DB"
    return PlaybookStepExecution(
      executionId: 0,
      stepId: id,
      status: ExecutionStatus.PENDING,
      startedAt: DateTime.now(),
    )..id = null;
  }
}
