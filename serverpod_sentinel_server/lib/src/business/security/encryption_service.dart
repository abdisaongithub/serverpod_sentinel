import 'dart:convert';
import 'package:cryptography/cryptography.dart';
import 'package:serverpod/serverpod.dart';

/// Service for handling encryption and decryption of sensitive data.
/// Uses AES-GCM (256-bit) for robust security.
class EncryptionService {
  static final AesGcm _algorithm = AesGcm.with256bits();

  /// Encrypts a [plainText] string using the master key from passwords.
  static Future<String> encrypt(Session session, String plainText) async {
    final keyString = session.passwords['masterEncryptionKey'] ?? 
        'default-very-secret-key-32-chars-!!'; // Fallback for dev only
    
    // Ensure key is 32 bytes for AES-256
    final keyBytes = _deriveKey(keyString);
    final secretKey = SecretKey(keyBytes);

    final clearText = utf8.encode(plainText);
    final secretBox = await _algorithm.encrypt(
      clearText,
      secretKey: secretKey,
    );

    // Combine nonce and cipher text for storage
    return base64.encode(secretBox.concatenation());
  }

  /// Decrypts a [cipherText] string.
  static Future<String> decrypt(Session session, String cipherText) async {
    try {
      final keyString = session.passwords['masterEncryptionKey'] ?? 
          'default-very-secret-key-32-chars-!!';
      
      final keyBytes = _deriveKey(keyString);
      final secretKey = SecretKey(keyBytes);

      final combined = base64.decode(cipherText);
      final secretBox = SecretBox.fromConcatenation(
        combined,
        nonceLength: _algorithm.nonceLength,
        macLength: _algorithm.macAlgorithm.macLength,
      );

      final clearText = await _algorithm.decrypt(
        secretBox,
        secretKey: secretKey,
      );

      return utf8.decode(clearText);
    } catch (e) {
      session.log('Decryption failed: $e', level: LogLevel.error);
      return 'DECRYPTION_ERROR';
    }
  }

  static List<int> _deriveKey(String keyString) {
    // Simple derivation: Pad or truncate to 32 bytes.
    // In production, use PBKDF2 or Argon2.
    final bytes = utf8.encode(keyString);
    if (bytes.length >= 32) {
      return bytes.sublist(0, 32);
    } else {
      return [...bytes, ...List.filled(32 - bytes.length, 0)];
    }
  }
}
