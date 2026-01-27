import 'dart:convert';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:serverpod_sentinel_server/src/business/automation/step_runner.dart';
import 'package:serverpod_sentinel_server/src/business/automation/playbook_controller.dart';
import 'package:serverpod_sentinel_server/src/business/notifications/notification_service.dart';
import 'package:serverpod_sentinel_server/src/business/notifications/slack_provider.dart';
import 'package:serverpod_sentinel_server/src/business/notifications/webhook_provider.dart';

class StepExecutorCall extends FutureCall<StepExecutorPayload> {
  @override
  Future<void> invoke(Session session, StepExecutorPayload? payload) async {
    if (payload == null) return;

    final stepExecutionId = payload.stepExecutionId;
    final stepExecution = await PlaybookStepExecution.db.findById(
      session,
      stepExecutionId,
      include: PlaybookStepExecution.include(
        execution: PlaybookExecution.include(playbook: Playbook.include()),
      ),
    );

    if (stepExecution == null) return;
    if (stepExecution.status != ExecutionStatus.PENDING &&
        stepExecution.status != ExecutionStatus.RUNNING)
      return;

    // Mark as RUNNING
    stepExecution.status = ExecutionStatus.RUNNING;
    stepExecution.startedAt = DateTime.now();
    await PlaybookStepExecution.db.updateRow(session, stepExecution);

    // Resolve Runner
    final playbook = stepExecution.execution?.playbook;
    if (playbook == null) {
      _fail(session, stepExecution, 'Playbook not found');
      return;
    }

    final configJson = jsonDecode(playbook.content);
    final List<dynamic> steps = configJson['steps'] ?? [];
    final stepConfig = steps.firstWhere(
      (s) => s['id'] == stepExecution.stepId,
      orElse: () => null,
    );

    if (stepConfig == null) {
      _fail(
        session,
        stepExecution,
        'Step config not found for ID: ${stepExecution.stepId}',
      );
      return;
    }

    final type = stepConfig['type'];
    StepRunner runner;

    // Initialize notification manager for runners that need it
    final notificationManager = NotificationManager();
    // In a real app, populate with providers from config
    notificationManager.registerProvider(WebhookProvider());
    // notificationManager.registerProvider(SlackProvider(webhookUrl: '...'));

    switch (type.toString().toUpperCase()) {
      case 'SSH_COMMAND':
      case 'SCRIPT': // Handle seed data "script"
        runner = SshStepRunner();
        break;
      case 'HTTP_REQUEST':
        runner = HttpStepRunner();
        break;
      case 'APPROVAL_GATE':
        runner = ApprovalStepRunner();
        break;
      case 'NOTIFICATION':
        // Dynamically register slack provider if url present in config
        if (stepConfig['config'] != null &&
            stepConfig['config']['channel'] == 'slack' &&
            stepConfig['config']['webhookUrl'] != null) {
          notificationManager.registerProvider(
            SlackProvider(webhookUrl: stepConfig['config']['webhookUrl']),
          );
        }
        runner = NotificationStepRunner(notificationManager);
        break;
      case 'WEBHOOK':
        runner = WebhookStepRunner(notificationManager);
        break;
      default:
        _fail(session, stepExecution, 'Unknown step type: $type');
        return;
    }

    // Execute
    try {
      final result = await runner.run(
        stepConfig['config'] ?? {},
        {
          'session': session,
          'stepExecutionId': stepExecutionId,
        },
      );


      stepExecution.logs = result.logs;
      stepExecution.output = result.output;
      stepExecution.completedAt = DateTime.now();
      stepExecution.status = result.success
          ? ExecutionStatus.COMPLETED
          : ExecutionStatus.FAILED;

      await PlaybookStepExecution.db.updateRow(session, stepExecution);

      // Trigger Next Steps
      final controller = PlaybookController();
      await controller.evaluateNextSteps(session, stepExecution.executionId);
    } catch (e, stack) {
      stepExecution.logs = 'Error: $e\n$stack';
      stepExecution.status = ExecutionStatus.FAILED;
      stepExecution.completedAt = DateTime.now();
      await PlaybookStepExecution.db.updateRow(session, stepExecution);

      // Also propagate failure to controller (evaluateNextSteps handles failing the parent execution)
      final controller = PlaybookController();
      await controller.evaluateNextSteps(session, stepExecution.executionId);
    }
  }

  Future<void> _fail(
    Session session,
    PlaybookStepExecution exec,
    String message,
  ) async {
    exec.status = ExecutionStatus.FAILED;
    exec.logs = message;
    exec.completedAt = DateTime.now();
    await PlaybookStepExecution.db.updateRow(session, exec);

    final controller = PlaybookController();
    await controller.evaluateNextSteps(session, exec.executionId);
  }
}
