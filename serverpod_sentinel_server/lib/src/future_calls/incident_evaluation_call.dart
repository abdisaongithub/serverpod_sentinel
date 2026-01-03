import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/business/detection_engine.dart';

class IncidentEvaluationCall extends FutureCall {
  @override
  Future<void> invoke(Session session, SerializableModel? object) async {
    print('Starting Incident Evaluation...');
    final detectionEngine = DetectionEngine();
    await detectionEngine.run(session);
    print('Incident Evaluation Completed.');
    // Schedule next run in 60 seconds
    await session.serverpod.futureCallWithDelay(
      'incidentEvaluation',
      null,
      const Duration(seconds: 60),
    );
  }
}
