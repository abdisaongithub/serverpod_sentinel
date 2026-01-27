import 'dart:io';
import 'package:test/test.dart';
import 'package:sentinel_agent/log_scraper.dart';

void main() {
  late File logFile;
  late LogScraper scraper;
  List<String> alerts = [];

  setUp(() {
    logFile = File('test_app.log');
    if (logFile.existsSync()) logFile.deleteSync();
    logFile.createSync();
    alerts.clear();

    scraper = LogScraper(
      filePath: logFile.path,
      patterns: ['ERROR', 'CRITICAL'],
      severity: 'CRITICAL',
      onAlert: (signal) {
        alerts.add(signal.identifier);
      },
    );
  });

  tearDown(() {
    if (logFile.existsSync()) logFile.deleteSync();
  });

  test('detects patterns in new log lines', () {
    logFile.writeAsStringSync('INFO: Everything is fine\n', mode: FileMode.append);
    scraper.tick();
    expect(alerts, isEmpty);

    logFile.writeAsStringSync('ERROR: Something went wrong\n', mode: FileMode.append);
    scraper.tick();
    expect(alerts, contains('log.alert.error'));
  });

  test('handles log rotation (truncation)', () {
    logFile.writeAsStringSync('ERROR: Old error\n');
    scraper.tick();
    alerts.clear();

    // Rotate: Truncate file
    logFile.writeAsStringSync('');
    scraper.tick(); // Should detect truncation and reset
    
    logFile.writeAsStringSync('CRITICAL: New error after rotation\n');
    scraper.tick();
    
    expect(alerts, contains('log.alert.critical'));
  });
}
