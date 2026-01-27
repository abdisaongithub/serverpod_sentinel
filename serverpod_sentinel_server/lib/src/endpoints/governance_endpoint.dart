import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:serverpod_sentinel_server/src/business/security/security_checks.dart';
import 'package:serverpod_sentinel_server/src/business/governance/policy_engine.dart';
import 'package:serverpod_sentinel_server/src/business/governance/chaos_service.dart';

class GovernanceEndpoint extends Endpoint {
  Future<void> _checkPermission(Session session, AppPermission permission) async {
    await SecurityChecks.requirePermission(session, permission);
  }

  /// Runs a platform-wide compliance audit.
  Future<List<Map<String, dynamic>>> runAudit(Session session) async {
    await _checkPermission(session, AppPermission.audit_log_view);
    return await PolicyEngine.auditCompliance(session);
  }

  /// Lists all remediation policies.
  Future<List<RemediationPolicy>> listRemediationPolicies(Session session) async {
    await _checkPermission(session, AppPermission.playbook_view);
    return await RemediationPolicy.db.find(session, orderBy: (t) => t.name);
  }

  /// Lists chaos experiments.
  Future<List<ChaosExperiment>> listChaosExperiments(Session session) async {
    await _checkPermission(session, AppPermission.ai_insight_view);
    return await ChaosExperiment.db.find(session, orderBy: (t) => t.scheduledAt);
  }

  /// Triggers a chaos experiment.
  Future<void> triggerChaos(Session session, int experimentId) async {
    await _checkPermission(session, AppPermission.ai_insight_regenerate);
    // Execute in background
    ChaosService.runExperiment(session, experimentId);
  }
}
