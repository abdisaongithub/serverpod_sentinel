import 'dart:math';
import 'dart:convert';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart' as auth;
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:serverpod_sentinel_server/src/generated/endpoints.dart';

Future<void> main(List<String> args) async {
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: (session, token) async {
      return null;
    },
  );

  final session = await pod.createSession(enableLogging: true);
  final rand = Random();

  try {
    print('Starting enhanced seeding process (Final v8)...');

    // ==========================================
    // 1. Users & Auth
    // ==========================================
    var userInfo = await auth.Users.findUserByEmail(
      session,
      'admin@sentinel.com',
    );
    if (userInfo == null) {
      print('Creating default admin UserInfo...');
      userInfo = await auth.Users.createUser(
        session,
        auth.UserInfo(
          userIdentifier: 'admin@sentinel.com',
          email: 'admin@sentinel.com',
          userName: 'Sentinel Admin',
          fullName: 'Admin User',
          created: DateTime.now(),
          scopeNames: [],
          blocked: false,
        ),
      );
    }

    // Business User (OpsUser)
    var opsUser = await OpsUser.db.findFirstRow(
      session,
      where: (t) => t.userInfoId.equals(userInfo!.id!),
    );
    if (opsUser == null) {
      opsUser = await OpsUser.db.insertRow(
        session,
        OpsUser(
          userInfoId: userInfo!.id!,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );
    }
    final ownerId = opsUser.id!;

    // ==========================================
    // 2. Environments
    // ==========================================
    final envs = await Environment.db.find(session);
    if (envs.isEmpty) {
      print('Seeding Environments...');
      await Environment.db.insert(session, [
        Environment(
          name: 'Production',
          description: 'Live production environment',
          region: 'us-east-1',
          isActive: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          config: '{"minInstances": 2, "maxInstances": 10, "cpuTarget": 60}',
        ),
        Environment(
          name: 'Staging',
          description: 'Pre-production staging area',
          region: 'us-west-2',
          isActive: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          config: '{"minInstances": 1, "maxInstances": 2, "cpuTarget": 80}',
        ),
        Environment(
          name: 'Development',
          description: 'Local development environment',
          region: 'eu-central-1',
          isActive: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          config: '{"minInstances": 1, "maxInstances": 1, "cpuTarget": 90}',
        ),
      ]);
    }

    // ==========================================
    // 3. System Settings
    // ==========================================
    final settings = await SystemSetting.db.find(session);
    if (settings.isEmpty) {
      print('Seeding System Settings...');
      await SystemSetting.db.insert(session, [
        SystemSetting(
          key: 'maintenance_mode',
          value: 'false',
          category: 'General',
          isSecret: false,
          description: 'Enable system-wide maintenance mode',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        SystemSetting(
          key: 'log_retention_days',
          value: '30',
          category: 'Storage',
          isSecret: false,
          description: 'Days to retain audit logs',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        SystemSetting(
          key: 'enable_beta_features',
          value: 'true',
          category: 'General',
          isSecret: false,
          description: 'Access to beta features',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        SystemSetting(
          key: 'max_concurrent_jobs',
          value: '50',
          category: 'Performance',
          isSecret: false,
          description: 'Max concurrent background jobs',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        SystemSetting(
          key: 'openai_api_key',
          value: 'sk-xxxxxxxx',
          category: 'Integrations',
          isSecret: true,
          description: 'API Key for AI Insights',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ]);
    }

    // ==========================================
    // 4. Integrations
    // ==========================================
    final integrations = await Integration.db.find(session);
    if (integrations.isEmpty) {
      print('Seeding Integrations...');
      await Integration.db.insert(session, [
        Integration(
          name: 'GitHub',
          type: 'vcs',
          provider: 'github',
          isEnabled: true,
          config: '{"repo": "serverpod/sentinel"}',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        Integration(
          name: 'Slack',
          type: 'messaging',
          provider: 'slack',
          isEnabled: true,
          config: '{"channel": "#ops-alerts"}',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        Integration(
          name: 'Datadog',
          type: 'monitoring',
          provider: 'datadog',
          isEnabled: false,
          config: '{}',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ]);
    }

    // ==========================================
    // 5. Services & HealthSignals & Rules & Incidents
    // ==========================================
    var services = await Service.db.find(session);
    if (services.isEmpty) {
      print('Seeding Services...');
      services = await Service.db.insert(session, [
        Service(
          name: 'Authentication Service',
          description: 'Core identity provider',
          status: ServiceStatus.OPERATIONAL,
          tier: ServiceTier.TIER_1,
          tags: ['auth', 'core', 'security'],
          createdAt: DateTime.now().subtract(Duration(days: 45)),
          updatedAt: DateTime.now(),
          ownerId: ownerId,
        ),
        Service(
          name: 'Payment Gateway',
          description: 'Stripe integration wrapper',
          status: ServiceStatus.DEGRADED,
          tier: ServiceTier.TIER_1,
          tags: ['payments', 'external'],
          createdAt: DateTime.now().subtract(Duration(days: 30)),
          updatedAt: DateTime.now(),
          ownerId: ownerId,
        ),
        Service(
          name: 'Notification Engine',
          description: 'Email and Push delivery',
          status: ServiceStatus.OPERATIONAL,
          tier: ServiceTier.TIER_2,
          tags: ['comms', 'async'],
          createdAt: DateTime.now().subtract(Duration(days: 20)),
          updatedAt: DateTime.now(),
          ownerId: ownerId,
        ),
        Service(
          name: 'Search Indexer',
          description: 'ElasticSearch sync worker',
          status: ServiceStatus.MAINTENANCE,
          tier: ServiceTier.TIER_3,
          tags: ['search', 'worker'],
          createdAt: DateTime.now().subtract(Duration(days: 60)),
          updatedAt: DateTime.now(),
          ownerId: ownerId,
        ),
        Service(
          name: 'Image Processor',
          description: 'Resize and optimize user uploads',
          status: ServiceStatus.OPERATIONAL,
          tier: ServiceTier.TIER_2,
          tags: ['media', 'compute-heavy'],
          createdAt: DateTime.now().subtract(Duration(days: 10)),
          updatedAt: DateTime.now(),
          ownerId: ownerId,
        ),
      ]);
    }

    // ==========================================
    // 5b. Playbooks
    // ==========================================
    var playbooks = await Playbook.db.find(session);
    if (playbooks.isNotEmpty) {
      print('Clearing existing Playbooks to ensure correct schema...');
      await Playbook.db.delete(session, playbooks);
      playbooks = [];
    }

    if (playbooks.isEmpty) {
      print('Seeding Playbooks...');

      final restartSteps = [
        {
          "id": "notify_ops",
          "name": "Notify Channel",
          "type": "notification",
          "config": {
            "channel": "#ops-alerts",
            "message": "Restarting service...",
          },
          "order": 1,
        },
        {
          "id": "drain_node",
          "name": "Drain Connections",
          "type": "script",
          "config": {"command": "kubectl drain node-1"},
          "order": 2,
          "depends_on": ["notify_ops"],
        },
        {
          "id": "restart_pod",
          "name": "Restart Pod",
          "type": "script",
          "config": {"command": "kubectl rollout restart deployment/svc"},
          "order": 3,
          "depends_on": ["drain_node"],
        },
      ];

      final scaleSteps = [
        {
          "id": "req_approval",
          "name": "Approval Request",
          "type": "notification",
          "config": {"user": "manager", "message": "Requesting scale up"},
          "order": 1,
        },
        {
          "id": "prov_node",
          "name": "Provision Node",
          "type": "webhook",
          "config": {
            "url": "https://api.cloud.com/provision",
            "method": "POST",
          },
          "order": 2,
          "depends_on": ["req_approval"],
        },
      ];

      await Playbook.db.insert(session, [
        Playbook(
          name: 'Restart Service',
          description: 'Safely restarts a service pod via K8s',
          type: PlaybookType.AUTOMATED,
          content: jsonEncode({"steps": restartSteps}),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        Playbook(
          name: 'Scale Up Cluster',
          description: 'Adds nodes to the cluster',
          type: PlaybookType.AUTOMATED,
          content: jsonEncode({"steps": scaleSteps}),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ]);
    }

    // Seed signals and rules
    for (var service in services) {
      // Check for signals
      var signals = await HealthSignal.db.find(
        session,
        where: (t) => t.serviceId.equals(service.id!),
      );
      if (signals.isEmpty) {
        print('Seeding HealthSignals for ${service.name}...');
        // Latency Signal
        await HealthSignal.db.insertRow(
          session,
          HealthSignal(
            serviceId: service.id!,
            name: 'API Latency',
            identifier: 'p99_latency',
            type: SignalType.METRIC,
            isHealthy: true,
            currentValue: 120,
            unit: 'ms',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        );
        // Error Rate Signal
        await HealthSignal.db.insertRow(
          session,
          HealthSignal(
            serviceId: service.id!,
            name: 'Error Rate',
            identifier: 'error_rate',
            type: SignalType.METRIC,
            isHealthy: true,
            currentValue: 0.1,
            unit: '%',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        );
      }
      signals = await HealthSignal.db.find(
        session,
        where: (t) => t.serviceId.equals(service.id!),
      );

      // Check for Rules
      var rules = await Rule.db.find(
        session,
        where: (t) => t.serviceId.equals(service.id!),
      );
      if (rules.isEmpty && signals.isNotEmpty) {
        print('Seeding Default Rules for ${service.name}...');
        var signal = signals.first;
        await Rule.db.insertRow(
          session,
          Rule(
            name: 'High Latency Alert',
            serviceId: service.id!,
            signalId: signal.id!,
            condition: 'p99_latency > 500',
            severity: IncidentSeverity.HIGH,
            durationSeconds: 300,
            enabled: true,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        );
      }
    }

    // Seed Incidents for Services
    final incidentsToCheck = await Incident.db.find(session, limit: 1);
    if (incidentsToCheck.isEmpty) {
      print('Seeding Incidents...');
      for (var service in services) {
        // Get a rule to link to
        var rule = await Rule.db.findFirstRow(
          session,
          where: (t) => t.serviceId.equals(service.id!),
        );
        if (rule == null) continue; // Should have rules now

        // Active incident for degraded services
        if (service.status == ServiceStatus.DEGRADED) {
          await Incident.db.insertRow(
            session,
            Incident(
              title: 'High API Latency',
              summary: 'P99 latency exceeded 500ms for 5 minutes.',
              serviceId: service.id!,
              ruleId: rule.id!,
              commanderId: ownerId,
              status: IncidentStatus.OPEN,
              severity: IncidentSeverity.HIGH,
              startedAt: DateTime.now().subtract(Duration(minutes: 45)),
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            ),
          );
        }

        // Past resolved incidents
        int historyCount = 2 + rand.nextInt(3);
        for (int i = 0; i < historyCount; i++) {
          await Incident.db.insertRow(
            session,
            Incident(
              title: 'Routine Health Check Failure',
              summary: 'Missed 3 consecutive heartbeats.',
              serviceId: service.id!,
              ruleId: rule.id!,
              commanderId: ownerId,
              status: IncidentStatus.RESOLVED,
              severity: IncidentSeverity.LOW,
              startedAt: DateTime.now().subtract(
                Duration(days: i + 1, hours: rand.nextInt(5)),
              ),
              resolvedAt: DateTime.now().subtract(
                Duration(days: i + 1, hours: rand.nextInt(5) - 1),
              ),
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            ),
          );
        }
      }
    }

    // ==========================================
    // 6. Audit Logs
    // ==========================================
    final auditLogs = await AuditLog.db.find(session, limit: 1);
    if (auditLogs.isEmpty) {
      print('Seeding Audit Logs...');
      final actions = [
        'CREATE',
        'UPDATE',
        'DELETE',
        'LOGIN',
        'LOGOUT',
        'SCALE_UP',
      ];
      final types = ['Service', 'Incident', 'User', 'Environment', 'Setting'];

      for (int i = 0; i < 20; i++) {
        await AuditLog.db.insertRow(
          session,
          AuditLog(
            actorId: ownerId,
            action: actions[rand.nextInt(actions.length)],
            entityType: types[rand.nextInt(types.length)],
            entityId: rand.nextInt(100),
            changes: i % 3 == 0 ? '{"prev": "A", "new": "B"}' : null,
            ipAddress: '192.168.1.${rand.nextInt(255)}',
            createdAt: DateTime.now().subtract(
              Duration(hours: i, minutes: rand.nextInt(60)),
            ),
          ),
        );
      }
    }

    // ==========================================
    // 7. AI Insights
    // ==========================================
    final insights = await AiInsight.db.find(session, limit: 1);
    if (insights.isEmpty) {
      print('Seeding AI Insights...');
      await AiInsight.db.insert(session, [
        AiInsight(
          type: 'root_cause',
          title: 'Database Connection Pool Exhaustion',
          content:
              'Analysis suggests the recent latency was caused by maxed out DB connections in the primary replica.',
          severity: 'High',
          confidence: 0.95,
          createdAt: DateTime.now(),
        ),
        AiInsight(
          type: 'prediction',
          title: 'Disk Usage Warning',
          content:
              'At current growth rate (500MB/hr), the logs partition will fill up in 48 hours.',
          severity: 'Medium',
          metadata: 'Service: Logger-v1',
          confidence: 0.88,
          createdAt: DateTime.now(),
        ),
        AiInsight(
          type: 'suggestion',
          title: 'Optimize Index on Users Table',
          content:
              'Query ID #412 on table `users` is performing full table scans. Adding an index on `email` is recommended.',
          severity: 'Low',
          confidence: 0.99,
          createdAt: DateTime.now(),
        ),
        AiInsight(
          type: 'anomaly',
          title: 'Unusual Login Pattern',
          content:
              'Detected successful logins from 3 distinct geographical regions for admin user within 5 minutes.',
          severity: 'Critical',
          confidence: 0.92,
          createdAt: DateTime.now(),
        ),
      ]);
    }

    print('Seeding complete!');
  } catch (e, stack) {
    print('Seeding failed: $e');
    print(stack);
  } finally {
    await session.close();
    await pod.shutdown();
  }
}
