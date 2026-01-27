import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:serverpod_sentinel_server/src/business/security/encryption_service.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class ApiKeyService {
  /// Generates a new API key.
  static Future<String> generate(
    Session session, {
    required String name,
    required List<String> scopes,
    int? userId,
  }) async {
    final rawKey = 'sn_${Uuid().v4().replaceAll('-', '')}';
    
    // Hash for lookup
    final hash = sha256.convert(utf8.encode(rawKey)).toString();
    
    // Encrypt for storage
    final encryptedKey = await EncryptionService.encrypt(session, rawKey);
    
    final apiKey = SentinelApiKey(
      name: name,
      key: encryptedKey,
      keyHash: hash,
      scopes: scopes,
      userId: userId,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await SentinelApiKey.db.insertRow(session, apiKey);
    
    return rawKey;
  }

  /// Validates a raw API key and returns the model if valid.
  static Future<SentinelApiKey?> validate(Session session, String rawKey) async {
    final hash = sha256.convert(utf8.encode(rawKey)).toString();
    
    final apiKey = await SentinelApiKey.db.findFirstRow(
      session,
      where: (t) => t.keyHash.equals(hash),
    );

    if (apiKey != null) {
      if (apiKey.expiresAt != null && apiKey.expiresAt!.isBefore(DateTime.now())) {
        return null;
      }
      
      // Update last used (in background)
      _updateLastUsed(session, apiKey.id!);
    }
    
    return apiKey;
  }

  static void _updateLastUsed(Session session, int id) async {
    try {
      await SentinelApiKey.db.updateById(
        session,
        id,
        columnValues: (t) => [t.lastUsedAt(DateTime.now())],
      );
    } catch (_) {}
  }
}
