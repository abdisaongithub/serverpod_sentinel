import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';

/// Service for managing and triggering Chaos Engineering experiments.
class ChaosService {
  /// Starts a scheduled chaos experiment.
  static Future<void> runExperiment(Session session, int experimentId) async {
    final experiment = await ChaosExperiment.db.findById(session, experimentId);
    if (experiment == null) return;

    experiment.status = 'running';
    experiment.startedAt = DateTime.now();
    await ChaosExperiment.db.updateRow(session, experiment);

    // In a real implementation, this would send a special command to the Sentinel Agent
    // to inject latency or kill processes. For now, we simulate it.
    
    session.log('Chaos: Starting experiment [${experiment.name}] on service [${experiment.serviceId}]');

    // Simulate duration
    await Future.delayed(const Duration(seconds: 10));

    experiment.status = 'completed';
    experiment.finishedAt = DateTime.now();
    await ChaosExperiment.db.updateRow(session, experiment);

    session.log('Chaos: Completed experiment [${experiment.name}]');
  }
}
