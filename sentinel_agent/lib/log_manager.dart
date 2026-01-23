import 'dart:io';
import 'package:logging/logging.dart';

class LogManager {
  static final _log = Logger('LogManager');

  /// Checks and rotates a log file if it exceeds the max size.
  static void checkAndRotate(String path, {int maxSizeBytes = 10 * 1024 * 1024, int maxFiles = 5}) {
    final file = File(path);
    if (!file.existsSync()) return;

    if (file.lengthSync() > maxSizeBytes) {
      _log.info('Rotating log file: $path (Size: ${file.lengthSync()} bytes)');
      
      try {
        // 1. Delete the oldest file
        final oldest = File('$path.$maxFiles');
        if (oldest.existsSync()) oldest.deleteSync();

        // 2. Shift existing rotated files
        for (var i = maxFiles - 1; i >= 1; i--) {
          final current = File('$path.$i');
          if (current.existsSync()) {
            current.renameSync('$path.${i + 1}');
          }
        }

        // 3. Rename current log to .1
        file.renameSync('$path.1');
        
        // 4. Create new empty log file
        File(path).createSync();
        _log.info('Log rotation complete for $path');
      } catch (e) {
        _log.severe('Failed to rotate log $path: $e');
      }
    }
  }
}
