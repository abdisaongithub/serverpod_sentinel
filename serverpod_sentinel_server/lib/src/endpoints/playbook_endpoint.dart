import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:serverpod_sentinel_server/src/business/security/security_checks.dart';
import 'package:serverpod_sentinel_server/src/business/security/audit_logger.dart';
import 'package:serverpod_sentinel_server/src/business/security/encryption_service.dart';

class PlaybookEndpoint extends Endpoint {
  /// Helper to verify permission
  Future<void> _checkPermission(Session session, AppPermission permission) async {
    await SecurityChecks.requirePermission(session, permission);
  }

  /// List all playbooks
  Future<List<Playbook>> list(Session session, {PlaybookType? type}) async {
    await _checkPermission(session, AppPermission.playbook_view);
    final playbooks = await Playbook.db.find(
      session,
      where: type != null ? (t) => t.type.equals(type) : null,
      orderBy: (t) => t.name,
    );

    // Redact content in list view
    for (var i = 0; i < playbooks.length; i++) {
      playbooks[i].content = 'REDACTED';
    }

    return playbooks;
  }

  /// Get playbook by ID
  Future<Playbook?> get(Session session, int id) async {
    await _checkPermission(session, AppPermission.playbook_view);
    final playbook = await Playbook.db.findById(
      session,
      id,
      include: Playbook.include(executions: PlaybookExecution.includeList()),
    );

    if (playbook != null) {
      playbook.content = await EncryptionService.decrypt(session, playbook.content);
    }

    return playbook;
  }

  /// Create playbook
  Future<Playbook> create(Session session, Playbook playbook) async {
    await _checkPermission(session, AppPermission.playbook_create);
    
    // Encrypt sensitive content
    playbook.content = await EncryptionService.encrypt(session, playbook.content);

    playbook.createdAt = DateTime.now();
    playbook.updatedAt = DateTime.now();
    final created = await Playbook.db.insertRow(session, playbook);

    await AuditLogger.log(
      session: session,
      action: 'CREATE',
      entityType: 'Playbook',
      entityId: created.id!,
    );

    return created;
  }

  /// Update playbook
  Future<Playbook> update(Session session, Playbook playbook) async {
    await _checkPermission(session, AppPermission.playbook_manage);
    
    // Re-encrypt content
    playbook.content = await EncryptionService.encrypt(session, playbook.content);

    playbook.updatedAt = DateTime.now();
    final updated = await Playbook.db.updateRow(session, playbook);

    await AuditLogger.log(
      session: session,
      action: 'UPDATE',
      entityType: 'Playbook',
      entityId: updated.id!,
    );

    return updated;
  }

  /// Delete playbook
  Future<bool> delete(Session session, int id) async {
    await _checkPermission(session, AppPermission.playbook_manage);
    final deleted = await Playbook.db.deleteWhere(
      session,
      where: (t) => t.id.equals(id),
    );

    if (deleted.isNotEmpty) {
      await AuditLogger.log(
        session: session,
        action: 'DELETE',
        entityType: 'Playbook',
        entityId: id,
      );
    }

    return deleted.isNotEmpty;
  }

  /// Trigger playbook execution for an incident
  Future<PlaybookExecution> execute(
    Session session,
    int playbookId,
    int incidentId,
    int initiatorId,
  ) async {
    await _checkPermission(session, AppPermission.playbook_execute);
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

    await AuditLogger.log(
      session: session,
      action: 'EXECUTE',
      entityType: 'Playbook',
      entityId: playbookId,
      changes: {'incidentId': incidentId, 'executionId': created.id},
    );

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
    await _checkPermission(session, AppPermission.playbook_view);
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
