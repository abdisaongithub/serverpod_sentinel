import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';

class PlaybookEndpoint extends Endpoint {
  /// List all playbooks
  Future<List<Playbook>> list(Session session, {PlaybookType? type}) async {
    return await Playbook.db.find(
      session,
      where: type != null ? (t) => t.type.equals(type) : null,
      orderBy: (t) => t.name,
    );
  }

  /// Get playbook by ID
  Future<Playbook?> get(Session session, int id) async {
    return await Playbook.db.findById(
      session,
      id,
      include: Playbook.include(executions: PlaybookExecution.includeList()),
    );
  }

  /// Create playbook
  Future<Playbook> create(Session session, Playbook playbook) async {
    playbook.createdAt = DateTime.now();
    playbook.updatedAt = DateTime.now();
    return await Playbook.db.insertRow(session, playbook);
  }

  /// Update playbook
  Future<Playbook> update(Session session, Playbook playbook) async {
    playbook.updatedAt = DateTime.now();
    return await Playbook.db.updateRow(session, playbook);
  }

  /// Delete playbook
  Future<bool> delete(Session session, int id) async {
    final deleted = await Playbook.db.deleteWhere(
      session,
      where: (t) => t.id.equals(id),
    );
    return deleted.isNotEmpty;
  }

  /// Trigger playbook execution for an incident
  Future<PlaybookExecution> execute(
    Session session,
    int playbookId,
    int incidentId,
    int initiatorId,
  ) async {
    final playbook = await Playbook.db.findById(session, playbookId);
    if (playbook == null) throw Exception('Playbook not found');

    final execution = PlaybookExecution(
      playbookId: playbookId,
      incidentId: incidentId,
      initiatorId: initiatorId,
      status: ExecutionStatus.PENDING,
      startedAt: DateTime.now(),
    );

    final created = await PlaybookExecution.db.insertRow(session, execution);

    // Schedule execution via FutureCall
    await session.serverpod.futureCallWithDelay(
      'stepExecutor',
      StepExecutorPayload(stepExecutionId: created.id!),
      const Duration(seconds: 1),
    );

    return created;
  }

  /// Get execution status
  Future<PlaybookExecution?> getExecution(
    Session session,
    int executionId,
  ) async {
    return await PlaybookExecution.db.findById(
      session,
      executionId,
      include: PlaybookExecution.include(
        playbook: Playbook.include(),
        incident: Incident.include(),
      ),
    );
  }
}
