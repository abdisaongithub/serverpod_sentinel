import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';

class SystemSettingsEndpoint extends Endpoint {
  /// List all system settings
  Future<List<SystemSetting>> list(Session session, {String? category}) async {
    return await SystemSetting.db.find(
      session,
      where: category != null ? (t) => t.category.equals(category) : null,
      orderBy: (t) => t.key,
    );
  }

  /// Get a single setting by key
  Future<SystemSetting?> getByKey(Session session, String key) async {
    return await SystemSetting.db.findFirstRow(
      session,
      where: (t) => t.key.equals(key),
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
    var setting = await SystemSetting.db.findFirstRow(
      session,
      where: (t) => t.key.equals(key),
    );

    if (setting == null) {
      setting = SystemSetting(
        key: key,
        value: value,
        description: description,
        category: category,
        isSecret: isSecret,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      return await SystemSetting.db.insertRow(session, setting);
    }

    setting.value = value;
    if (description != null) setting.description = description;
    setting.updatedAt = DateTime.now();
    return await SystemSetting.db.updateRow(session, setting);
  }

  /// Delete a setting
  Future<bool> delete(Session session, String key) async {
    final deleted = await SystemSetting.db.deleteWhere(
      session,
      where: (t) => t.key.equals(key),
    );
    return deleted.isNotEmpty;
  }

  /// Get all categories
  Future<List<String>> getCategories(Session session) async {
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
    final results = <SystemSetting>[];
    for (final setting in settings) {
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
