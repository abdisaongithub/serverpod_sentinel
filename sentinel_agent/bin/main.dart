import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:yaml/yaml.dart';
import 'package:logging/logging.dart';
import 'package:serverpod_client/serverpod_client.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import 'package:sentinel_agent/metrics_collector.dart';
import 'package:sentinel_agent/log_scraper.dart';
import 'package:sentinel_agent/remediation_service.dart';
import 'package:sentinel_agent/task_executor.dart';
import 'package:sentinel_agent/log_manager.dart';
import 'package:sentinel_agent/update_manager.dart';

import 'package:serverpod_client/serverpod_client.dart';

final _log = Logger('SentinelAgent');

class ApiKeyManager extends AuthenticationKeyManager {
  final String key;
  ApiKeyManager(this.key);

  @override
  Future<String?> get() async => key;

  @override
  Future<void> put(String key) async {}
  
  @override
  Future<void> remove() async {}

  @override
  Future<String?> toHeaderValue(String? method) async => 'Bearer $key';
}

void main() async {
  // 1. Setup Logging
  Logger.root.level = Level.INFO;
  Logger.root.onRecord.listen((record) {
    print('${record.time} [${record.level.name}] ${record.loggerName}: ${record.message}');
  });

  _log.info('Starting Sentinel Resilient Agent v1.5 (Full Features)...');

  // 2. Load Configuration
  final configFile = File('config.yaml');
  if (!configFile.existsSync()) {
    _log.severe('Config file not found: config.yaml');
    exit(1);
  }
  
  final config = loadYaml(configFile.readAsStringSync());
  final serverUrl = config['server_url'] as String;
  final serviceId = config['service_id'] as int;
  final interval = Duration(seconds: config['interval_seconds'] as int);
  final maxBackoff = Duration(seconds: config['max_backoff_seconds'] as int);

  // 3. Initialize Client (Auth enabled)
  final client = Client(
    serverUrl,
    authenticationKeyManager: ApiKeyManager(config['api_key']?.toString() ?? ''),
  );

  // 4. Initialize Components
  final List<LogScraper> scrapers = [];
  final List<TelemetrySignalPayload> pendingAlerts = [];
  final List<String> targetProcesses = [];

  if (config['monitor_processes'] != null) {
    for (final proc in config['monitor_processes']) {
      targetProcesses.add(proc['command'] as String);
    }
  }

  if (config['watch_logs'] != null) {
    for (final logConf in config['watch_logs']) {
      scrapers.add(LogScraper(
        filePath: logConf['path'],
        patterns: List<String>.from(logConf['patterns']),
        severity: logConf['severity'],
        onAlert: (signal) {
          pendingAlerts.add(signal);
        },
      ));
    }
  }

  int failureCount = 0;
  int tickCount = 0;
  DateTime startTime = DateTime.now();
  _log.info('Agent initialized. Monitoring Service ID: $serviceId');

  // 5. Main Execution Loop
  while (true) {
    tickCount++;
    try {
      // A. Fetch Remote State
      final autoRemediationEnabled = await client.systemSettings.getValue('agent.auto_remediation.enabled') == 'true';
      final maintenanceMode = await client.systemSettings.getValue('service.$serviceId.maintenance_mode') == 'true';
      final updateUrl = await client.systemSettings.getValue('agent.update_url');
      final logRotationEnabled = await client.systemSettings.getValue('agent.log_rotation.enabled') == 'true';

      // B. Auto-Update Check (Every 100 ticks ~8 mins)
      if (updateUrl != null && tickCount % 100 == 0) {
        await UpdateManager.checkForUpdates(updateUrl);
      }

      // C. Remote Task Execution
      try {
        final remoteTask = await client.agent.pollTask(serviceId);
        if (remoteTask != null) {
          await TaskExecutor.executeTask(client, remoteTask);
        }
      } catch (e) {
        _log.warning('Failed to poll for remote tasks: $e');
      }

      // D. Log Scraping & Rotation
      for (var s in scrapers) {
        if (logRotationEnabled) {
          LogManager.checkAndRotate(s.filePath);
        }
        s.tick();
      }

      // E. Metrics & Health
      final resources = MetricsCollector.collectResources();
      final signals = MetricsCollector.collectExtendedSignals(targetProcesses: targetProcesses);

      // F. Self-Healing
      if (autoRemediationEnabled && !maintenanceMode) {
        for (final signal in signals) {
          if (signal.identifier.startsWith('process.status.') && !signal.isHealthy) {
            final procName = signal.identifier.replaceFirst('process.status.', '');
            _log.warning('Detected failure in $procName. Attempting restart...');
            final success = await RemediationService.restartService(procName);
            if (success) {
              _log.info('Successfully restarted $procName');
              signal.isHealthy = true;
              signal.value = 1.0;
            }
          }
        }
      }

      // G. Sync to Cloud
      if (pendingAlerts.isNotEmpty) {
        signals.addAll(List.from(pendingAlerts));
        pendingAlerts.clear();
      }

      await client.telemetry.heartbeat(
        serviceId,
        TelemetryHeartbeat(
          serviceId: serviceId,
          timestamp: DateTime.now(),
          uptimeSeconds: DateTime.now().difference(startTime).inSeconds,
          version: UpdateManager.currentVersion,
          status: maintenanceMode ? ServiceStatus.MAINTENANCE : ServiceStatus.OPERATIONAL,
          resources: resources,
        ),
      );

      await client.telemetry.ingestBatch(
        serviceId,
        TelemetrySignalBatch(
          timestamp: DateTime.now(),
          signals: signals,
        ),
      );

      _log.info('Sync success. Ver: ${UpdateManager.currentVersion} | CPU: ${resources.cpuLoad.toStringAsFixed(1)}%');
      
      failureCount = 0;
      await Future.delayed(interval);
      
    } catch (e) {
      failureCount++;
      final backoff = Duration(
        seconds: min(maxBackoff.inSeconds, pow(2, failureCount).toInt()),
      );
      _log.warning('Sync failed (attempt $failureCount). Retrying in ${backoff.inSeconds}s. Error: $e');
      await Future.delayed(backoff);
    }
  }
}
