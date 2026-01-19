import 'package:serverpod/serverpod.dart';

import 'package:serverpod_sentinel_server/src/business/notifications/notification_service.dart';

abstract class StepRunner {
  Future<StepResult> run(
    Map<String, dynamic> config,
    Map<String, dynamic> context,
  );
}

class StepResult {
  final bool success;
  final String output;
  final String logs;

  StepResult({
    required this.success,
    this.output = '',
    this.logs = '',
  });
}

class SshStepRunner extends StepRunner {
  @override
  Future<StepResult> run(
    Map<String, dynamic> config,
    Map<String, dynamic> context,
  ) async {
    // Simulate SSH execution
    final command = config['command'];
    final hostname = config['hostname']; // Ideally resolved via context

    // In real implementation, use 'dart_ssh2' or similar.
    return StepResult(
      success: true,
      logs: 'Connected to $hostname\nExecuting: $command\nSuccess.',
      output: '{"exitCode": 0}',
    );
  }
}

class HttpStepRunner extends StepRunner {
  @override
  Future<StepResult> run(
    Map<String, dynamic> config,
    Map<String, dynamic> context,
  ) async {
    // Simulate HTTP execution
    final url = config['url'];
    final method = config['method'] ?? 'GET';

    return StepResult(
      success: true,
      logs: 'Request: $method $url\nResponse: 200 OK',
      output: '{"status": 200}',
    );
  }
}

class ApprovalStepRunner extends StepRunner {
  @override
  Future<StepResult> run(
    Map<String, dynamic> config,
    Map<String, dynamic> context,
  ) async {
    // Approval steps map to "PAUSED" state in the controller,
    // but the runner itself just sets up the gate.
    // In this architecture, if a step type is APPROVAL_GATE,
    // the controller might handle it specially OR the runner returns a specific status.
    // For simplicity, we'll implement this logic in the Controller/Executor directly or return a special "PAUSED" signal.
    // Here we'll just log.
    return StepResult(
      success: true,
      logs: 'Approval request sent to ${config['approvers']}',
      output: '{"status": "PENDING_APPROVAL"}',
    );
  }
}

class NotificationStepRunner extends StepRunner {
  final NotificationService _notificationService;

  NotificationStepRunner(this._notificationService);

  @override
  Future<StepResult> run(
    Map<String, dynamic> config,
    Map<String, dynamic> context,
  ) async {
    // Config should contain 'session', 'title', 'message', 'channel'
    // Note: StepRunner interface doesn't pass session! We might need to refactor StepRunner
    // or pass session in context if possible, OR StepExecutorCall needs to handle this.
    // Looking at StepExecutorCall, it HAS a session. check step_runner.dart again.
    // step_runner.dart StepRunner.run signatures takes config and context maps.
    // It does NOT take Session.

    // CRITICAL: NotificationService NEEDS a Session object for logging/db access.
    // We must pass session via context map from StepExecutorCall.

    final session = context['session'] as Session?;
    if (session == null) {
      return StepResult(
        success: false,
        logs: 'Error: Session not found in context',
      );
    }

    final channelStr = config['channel'] as String? ?? 'slack';
    final title = config['title'] as String? ?? 'Playbook Notification';
    final message = config['message'] as String? ?? 'No message provided';

    NotificationChannel channel;
    switch (channelStr.toLowerCase()) {
      case 'slack':
        channel = NotificationChannel.slack;
        break;
      case 'webhook':
        channel = NotificationChannel.webhook;
        break;
      case 'email':
        channel = NotificationChannel.email;
        break;
      default:
        channel = NotificationChannel.slack;
    }

    try {
      await _notificationService.send(
        session: session,
        title: title,
        message: message,
        channel: channel,
        metadata: config, // Pass full config as metadata
      );

      return StepResult(
        success: true,
        logs: 'Notification sent via $channelStr',
      );
    } catch (e) {
      return StepResult(
        success: false,
        logs: 'Failed to send notification: $e',
      );
    }
  }
}

class WebhookStepRunner extends StepRunner {
  final NotificationService _notificationService;

  WebhookStepRunner(this._notificationService);

  @override
  Future<StepResult> run(
    Map<String, dynamic> config,
    Map<String, dynamic> context, // Expects session in context
  ) async {
    final session = context['session'] as Session?;
    if (session == null) {
      return StepResult(
        success: false,
        logs: 'Error: Session not found in context',
      );
    }

    try {
      await _notificationService.send(
        session: session,
        title: 'Webhook Step',
        message: 'Triggered from playbook',
        channel: NotificationChannel.webhook,
        metadata: {
          'webhookUrl': config['url'],
          'headers': config['headers'],
          'extra': config['payload'],
        },
      );

      return StepResult(
        success: true,
        logs: 'Webhook called successfully',
      );
    } catch (e) {
      return StepResult(
        success: false,
        logs: 'Failed to call webhook: $e',
      );
    }
  }
}
