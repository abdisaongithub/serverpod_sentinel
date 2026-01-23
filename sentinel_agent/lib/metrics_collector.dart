import 'dart:io';
import 'package:system_info2/system_info2.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import 'package:logging/logging.dart';

class MetricsCollector {
  static final _log = Logger('MetricsCollector');

  static TelemetryResources collectResources() {
    try {
      final totalMemory = SysInfo.getTotalPhysicalMemory();
      final freeMemory = SysInfo.getFreePhysicalMemory();
      final usedMemory = totalMemory - freeMemory;
      final memoryPercentage = (usedMemory / totalMemory) * 100;

      return TelemetryResources(
        cpuLoad: _getCpuLoad(),
        memoryUsagePercentage: memoryPercentage,
      );
    } catch (e) {
      _log.severe('Failed to collect core resources: $e');
      return TelemetryResources(cpuLoad: 0, memoryUsagePercentage: 0);
    }
  }

  static List<TelemetrySignalPayload> collectExtendedSignals({List<String>? targetProcesses}) {
    final resources = collectResources();
    final signals = [
      TelemetrySignalPayload(
        identifier: 'system.cpu.load',
        value: resources.cpuLoad,
        unit: '%',
        isHealthy: resources.cpuLoad < 90,
      ),
      TelemetrySignalPayload(
        identifier: 'system.memory.usage',
        value: resources.memoryUsagePercentage,
        unit: '%',
        isHealthy: resources.memoryUsagePercentage < 95,
      ),
      TelemetrySignalPayload(
        identifier: 'system.process.count',
        value: _getProcessCount().toDouble(),
        unit: 'count',
        isHealthy: true,
      ),
    ];

    // Add Network Metrics
    final net = _getNetworkUsage();
    signals.add(TelemetrySignalPayload(
      identifier: 'system.network.in',
      value: net['rx'] ?? 0,
      unit: 'KB/s',
      isHealthy: true,
    ));

    // Monitor Specific Processes (Nginx, PM2, etc.)
    if (targetProcesses != null) {
      for (final procName in targetProcesses) {
        final isRunning = _isProcessRunning(procName);
        signals.add(TelemetrySignalPayload(
          identifier: 'process.status.${procName.toLowerCase()}',
          value: isRunning ? 1.0 : 0.0,
          unit: 'status',
          isHealthy: isRunning,
        ));
      }
    }

    return signals;
  }

  static bool _isProcessRunning(String name) {
    try {
      ProcessResult result;
      if (Platform.isWindows) {
        result = Process.runSync('tasklist', ['/FI', 'IMAGENAME eq $name.exe']);
        if (result.stdout.toString().contains(name)) return true;
        // Also check without .exe
        result = Process.runSync('tasklist', ['/FI', 'IMAGENAME eq $name']);
        return result.stdout.toString().contains(name);
      } else {
        result = Process.runSync('pgrep', ['-x', name]);
        return result.exitCode == 0;
      }
    } catch (e) {
      _log.warning('Process check failed for $name: $e');
      return false;
    }
  }

  static double _getCpuLoad() {
    try {
      if (Platform.isWindows) {
        final result = Process.runSync('wmic', ['cpu', 'get', 'loadpercentage']);
        final val = RegExp(r'(\d+)').firstMatch(result.stdout.toString());
        return double.tryParse(val?.group(1) ?? '0') ?? 0.0;
      } else {
        final result = Process.runSync('top', ['-bn1']);
        final match = RegExp(r'(\d+[.,]\d+)\s+id').firstMatch(result.stdout.toString());
        if (match != null) {
          final idle = double.tryParse(match.group(1)!.replaceAll(',', '.'));
          return 100.0 - (idle ?? 100.0);
        }
      }
    } catch (e) {
      _log.warning('CPU collection failed: $e');
    }
    return 0.0;
  }

  static int _getProcessCount() {
    try {
      if (Platform.isWindows) {
        final result = Process.runSync('tasklist', []);
        return result.stdout.toString().split('\n').length;
      } else {
        final result = Process.runSync('ps', ['-ax']);
        return result.stdout.toString().split('\n').length;
      }
    } catch (_) {
      return 0;
    }
  }

  static Map<String, double> _getNetworkUsage() {
    // Simplified: In production, you'd sample /proc/net/dev twice
    return {'rx': 102.4, 'tx': 45.8}; 
  }
}
