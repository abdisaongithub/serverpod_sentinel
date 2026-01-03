import 'package:serverpod_sentinel_server/src/generated/protocol.dart';

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
