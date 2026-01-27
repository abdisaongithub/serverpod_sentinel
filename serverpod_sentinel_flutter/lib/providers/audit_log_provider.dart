import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import 'client_provider.dart';

/// Fetch audit logs from the backend.
final auditLogsProvider = FutureProvider.family<List<AuditLog>, int?>((ref, limit) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.auditLog.list(limit: limit ?? 50);
  } catch (e) {
    print('Error fetching audit logs: $e');
    rethrow;
  }
});

/// Fetch audit logs for a specific entity.
final entityAuditLogsProvider =
    FutureProvider.family<List<AuditLog>, ({String entityType, int entityId})>(
        (ref, arg) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.auditLog.getForEntity(arg.entityType, arg.entityId);
  } catch (e) {
    print('Error fetching entity audit logs: $e');
    rethrow;
  }
});

/// Available action types for filtering.
final auditActionTypesProvider = FutureProvider<List<String>>((ref) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.auditLog.getActionTypes();
  } catch (e) {
    print('Error fetching audit action types: $e');
    rethrow;
  }
});

/// Available entity types for filtering.
final auditEntityTypesProvider = FutureProvider<List<String>>((ref) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.auditLog.getEntityTypes();
  } catch (e) {
    print('Error fetching audit entity types: $e');
    rethrow;
  }
});
