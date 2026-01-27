import 'package:test/test.dart';
import 'package:sentinel_agent/metrics_collector.dart';

void main() {
  group('MetricsCollector', () {
    test('collectResources returns valid values', () {
      final resources = MetricsCollector.collectResources();
      print('CPU: ${resources.cpuLoad}, Mem: ${resources.memoryUsagePercentage}');
      
      expect(resources.cpuLoad, isNotNull);
      expect(resources.memoryUsagePercentage, isNotNull);
      // Values might be 0 in some environments, but shouldn't crash
    });

    test('collectExtendedSignals returns basic signals', () {
      final signals = MetricsCollector.collectExtendedSignals();
      
      expect(signals.any((s) => s.identifier == 'system.cpu.load'), isTrue);
      expect(signals.any((s) => s.identifier == 'system.memory.usage'), isTrue);
      expect(signals.any((s) => s.identifier == 'system.process.count'), isTrue);
      expect(signals.any((s) => s.identifier == 'system.network.in'), isTrue);
    });
  });
}
