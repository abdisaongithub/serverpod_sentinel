import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:serverpod_sentinel_server/src/business/security/encryption_service.dart';
import 'package:serverpod_sentinel_server/src/business/security/security_checks.dart';
import 'package:serverpod_sentinel_server/src/business/security/audit_logger.dart';
import 'package:serverpod_sentinel_server/src/business/resilience/l1_cache.dart';

class SystemSettingsEndpoint extends Endpoint {
  /// Helper to verify permission
  Future<void> _checkPermission(Session session, AppPermission permission) async {
    await SecurityChecks.requirePermission(session, permission);
  }

  /// List all system settings
  Future<List<SystemSetting>> list(Session session, {String? category}) async {
    await _checkPermission(session, AppPermission.system_settings_view);
    final settings = await SystemSetting.db.find(
      session,
      where: category != null ? (t) => t.category.equals(category) : null,
      orderBy: (t) => t.key,
    );

    // Redact secret values in list
    for (var i = 0; i < settings.length; i++) {
      if (settings[i].isSecret) {
        settings[i].value = '********';
      }
    }

    return settings;
  }

  /// Get a single setting by key
  Future<SystemSetting?> getByKey(Session session, String key) async {
    await _checkPermission(session, AppPermission.system_settings_view);

    return await L1Cache.wrap<SystemSetting>(
      session,
      'setting:$key',
      const Duration(minutes: 10),
      () async {
        final setting = await SystemSetting.db.findFirstRow(
          session,
          where: (t) => t.key.equals(key),
        );

        if (setting != null && setting.isSecret) {
          setting.value = await EncryptionService.decrypt(session, setting.value);
        }

        return setting;
      },
    );
  }

  /// Get setting value by key (returns value string or null)
  Future<String?> getValue(Session session, String key) async {
    final setting = await getByKey(session, key);
    return setting?.value;
  }

  /// Update or create a setting
  Future<SystemSetting> upsert(
    Session session,
    String key,
    String value, {
    String? description,
    String category = 'general',
    bool isSecret = false,
  }) async {
    await _checkPermission(session, AppPermission.system_settings_edit);

    // Invalidate L1 Cache
    await L1Cache.invalidate(session, 'setting:$key');

    String finalValue = value;
    if (isSecret) {
      finalValue = await EncryptionService.encrypt(session, value);
    }

    var setting = await SystemSetting.db.findFirstRow(
      session,
      where: (t) => t.key.equals(key),
    );

    SystemSetting result;
    if (setting == null) {
      setting = SystemSetting(
        key: key,
        value: finalValue,
        description: description,
        category: category,
        isSecret: isSecret,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      result = await SystemSetting.db.insertRow(session, setting);
    } else {
      setting.value = finalValue;
      if (description != null) setting.description = description;
      setting.updatedAt = DateTime.now();
      setting.isSecret = isSecret; 
      result = await SystemSetting.db.updateRow(session, setting);
    }

    await AuditLogger.log(
      session: session,
      action: 'UPSERT_SETTING',
      entityType: 'SystemSetting',
      entityId: result.id!,
      changes: {'key': key, 'isSecret': isSecret},
    );

    return result;
  }

  /// Delete a setting
  Future<bool> delete(Session session, String key) async {
    await _checkPermission(session, AppPermission.system_settings_edit);
    
    // Invalidate L1 Cache
    await L1Cache.invalidate(session, 'setting:$key');

    final deleted = await SystemSetting.db.deleteWhere(
      session,
      where: (t) => t.key.equals(key),
    );
    return deleted.isNotEmpty;
  }

  /// Get all categories
  Future<List<String>> getCategories(Session session) async {
    await _checkPermission(session, AppPermission.system_settings_view);
    final settings = await SystemSetting.db.find(session);
    final categories = settings.map((s) => s.category).toSet().toList();
    categories.sort();
    return categories;
  }

  /// Bulk update settings
  Future<List<SystemSetting>> bulkUpdate(
    Session session,
    List<SystemSetting> settings,
  ) async {
    await _checkPermission(session, AppPermission.system_settings_edit);
    final results = <SystemSetting>[];
    for (final setting in settings) {
      await L1Cache.invalidate(session, 'setting:${setting.key}');
      setting.updatedAt = DateTime.now();
      final updated = await SystemSetting.db.updateRow(session, setting);
      results.add(updated);
    }
    return results;
  }

  /// Get public settings (non-secret)
  Future<List<SystemSetting>> getPublic(Session session) async {
    return await SystemSetting.db.find(
      session,
      where: (t) => t.isSecret.equals(false),
      orderBy: (t) => t.key,
    );
  }
}
