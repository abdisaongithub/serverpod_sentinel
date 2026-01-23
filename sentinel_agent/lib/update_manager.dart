import 'dart:io';
import 'package:logging/logging.dart';
import 'package:http/http.dart' as http;
import 'package:archive/archive.dart';

class UpdateManager {
  static final _log = Logger('UpdateManager');
  static const String currentVersion = '1.5.0';

  /// Checks for a new version and applies it if available.
  /// Expects a URL to a zip containing the new 'sentinel_agent' binary/source.
  static Future<void> checkForUpdates(String updateUrl) async {
    _log.info('Checking for updates at $updateUrl...');
    
    try {
      final response = await http.get(Uri.parse(updateUrl));
      if (response.statusCode == 200) {
        // In a real scenario, we'd check a version.json first.
        // For this implementation, we assume if the URL is hit, we apply.
        _log.shout('New update found! Downloading and applying...');
        
        final bytes = response.bodyBytes;
        final archive = ZipDecoder().decodeBytes(bytes);

        for (final file in archive) {
          final filename = file.name;
          if (file.isFile) {
            final data = file.content as List<int>;
            File(filename)
              ..createSync(recursive: true)
              ..writeAsBytesSync(data);
          } else {
            Directory(filename).createSync(recursive: true);
          }
        }

        _log.shout('Update applied successfully. Restarting agent...');
        // On Linux/Windows, exiting while managed by a supervisor (systemd/PM2) 
        // will cause an immediate restart with the new code.
        exit(0);
      }
    } catch (e) {
      _log.warning('Update check failed: $e');
    }
  }
}
