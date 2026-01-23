import 'dart:io';
import 'package:logging/logging.dart';

class RemediationService {
  static final _log = Logger('RemediationService');

  /// Attempts to restart a service based on its name.
  /// Uses platform-specific commands.
  static Future<bool> restartService(String name) async {
    _log.shout('CRITICAL: Attempting auto-remediation for $name...');
    
    try {
      ProcessResult result;
      if (Platform.isLinux) {
        // Try systemd first
        result = await Process.run('sudo', ['systemctl', 'restart', name]);
        if (result.exitCode == 0) return true;

        // Fallback for PM2 specifically if that's the name
        if (name.toLowerCase() == 'pm2') {
          result = await Process.run('pm2', ['resurrect']);
          return result.exitCode == 0;
        }
      } else if (Platform.isWindows) {
        // Windows Service restart
        result = await Process.run('net', ['stop', name]);
        result = await Process.run('net', ['start', name]);
        return result.exitCode == 0;
      }
    } catch (e) {
      _log.severe('Remediation failed for $name: $e');
    }
    return false;
  }
}
