import 'dart:io';
import 'package:logging/logging.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';

class LogScraper {
  final _log = Logger('LogScraper');
  final String filePath;
  final List<String> patterns;
  final String severity;
  final Function(TelemetrySignalPayload) onAlert;
  
  late File _file;
  int _lastPosition = 0;

  LogScraper({
    required this.filePath,
    required this.patterns,
    required this.severity,
    required this.onAlert,
  }) {
    _file = File(filePath);
    if (_file.existsSync()) {
      _lastPosition = _file.lengthSync();
      _log.info('Started watching $filePath from position $_lastPosition');
    } else {
      _log.warning('Log file $filePath does not exist yet. Will wait for creation.');
    }
  }

  void tick() {
    if (!_file.existsSync()) return;

    final currentLength = _file.lengthSync();
    if (currentLength < _lastPosition) {
      _log.info('Log file truncated, resetting position.');
      _lastPosition = 0;
    }

    if (currentLength > _lastPosition) {
      try {
        final randomAccessFile = _file.openSync(mode: FileMode.read);
        randomAccessFile.setPositionSync(_lastPosition);
        
        final bytes = randomAccessFile.readSync(currentLength - _lastPosition);
        final newContent = String.fromCharCodes(bytes);
        
        _lastPosition = currentLength;
        randomAccessFile.closeSync();

        _processContent(newContent);
      } catch (e) {
        _log.severe('Error reading log file: $e');
      }
    }
  }

  void _processContent(String content) {
    final lines = content.split('\n');
    for (final line in lines) {
      if (line.trim().isEmpty) continue;

      for (final pattern in patterns) {
        if (line.contains(pattern)) {
          _log.shout('Log Alert Detected: "$pattern" found in $filePath');
          
          // Create an alert signal
          onAlert(TelemetrySignalPayload(
            identifier: 'log.alert.${pattern.toLowerCase().replaceAll(' ', '_')}',
            value: 1.0,
            unit: 'event',
            isHealthy: false,
          ));
        }
      }
    }
  }
}
