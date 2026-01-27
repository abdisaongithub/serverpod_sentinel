import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:serverpod_sentinel_server/src/utils/distributed_lock.dart';

class DataRetentionCall extends FutureCall {
  @override
  Future<void> invoke(Session session, SerializableModel? object) async {
    await DistributedLock.runLocked(session, 'data_retention_job', () async {
      final retentionLimit = DateTime.now().subtract(const Duration(days: 30));
      
      // Delete old metric points
      final deletedMetrics = await MetricPoint.db.deleteWhere(
        session,
        where: (t) => t.timestamp < retentionLimit,
      );
      
      // Delete old audit logs (retention: 1 year)
      final auditRetentionLimit = DateTime.now().subtract(const Duration(days: 365));
      final deletedAudit = await AuditLog.db.deleteWhere(
        session,
        where: (t) => t.createdAt < auditRetentionLimit,
      );

      session.log(
        'DataRetention: Cleaned up ${deletedMetrics.length} metrics and ${deletedAudit.length} audit logs.', 
        level: LogLevel.info,
      );
    });

    // Reschedule for 24 hours later
    await session.serverpod.futureCallWithDelay(
      'dataRetention',
      null,
      const Duration(hours: 24),
    );
  }
}
