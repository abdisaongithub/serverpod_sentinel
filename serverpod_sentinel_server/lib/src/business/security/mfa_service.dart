import 'dart:math';
import 'dart:typed_data';
import 'package:otp/otp.dart';
import 'package:base32/base32.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:serverpod_sentinel_server/src/business/security/encryption_service.dart';

class MfaService {
  /// Generates a new TOTP secret for a user.
  static String generateSecret() {
    final rand = Random.secure();
    final bytes = Uint8List.fromList(List<int>.generate(20, (i) => rand.nextInt(256)));
    return base32.encode(bytes);
  }

  /// Verifies a TOTP code against a secret.
  static bool verifyCode(String secret, String code) {
    final now = DateTime.now().millisecondsSinceEpoch;
    final expected = OTP.generateTOTPCodeString(
      secret,
      now,
      interval: 30,
      algorithm: Algorithm.SHA1,
      isGoogle: true,
    );
    return expected == code;
  }

  /// Enables MFA for a user after verifying the first code.
  static Future<bool> enableForUser(
    Session session, 
    int opsUserId, 
    String secret, 
    String code,
  ) async {
    if (verifyCode(secret, code)) {
      final user = await OpsUser.db.findById(session, opsUserId);
      if (user == null) return false;

      // Encrypt the secret before storing
      user.mfaSecret = await EncryptionService.encrypt(session, secret);
      user.mfaEnabled = true;
      user.updatedAt = DateTime.now();
      
      await OpsUser.db.updateRow(session, user);
      return true;
    }
    return false;
  }
}
