import 'dart:convert';
import 'package:test/test.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:serverpod_sentinel_server/src/endpoints/report_endpoint.dart';
import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('ReportEndpoint', (sessionBuilder, endpoints) {
    var ownerId = 0;
    var serviceId = 0;

    test('Health Report Generation Flow', () async {
      final session = sessionBuilder.build();
      try {
        // 0. Seed User
        final userInfo = UserInfo(
          userIdentifier: 'report_test_user_${Uuid().v4()}',
          userName: 'Report Tester',
          fullName: 'Report Tester',
          email: 'report_test_${Uuid().v4()}@example.com',
          created: DateTime.now(),
          scopeNames: [],
          blocked: false,
        );
        final createdUserInfo = await UserInfo.db.insertRow(session, userInfo);

        final opsUser = OpsUser(
          userInfoId: createdUserInfo.id!,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        final createdOpsUser = await OpsUser.db.insertRow(session, opsUser);
        ownerId = createdOpsUser.id!;

        // 1. Seed Service (needed for health report to have data)
        final service = Service(
          name: 'Reportable Service',
          ownerId: ownerId,
          tags: ['test', 'report'],
          status: ServiceStatus.OPERATIONAL,
          tier: ServiceTier.TIER_1,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        final createdService = await Service.db.insertRow(session, service);
        serviceId = createdService.id!;

        // 2. Seed Rule (needed for dummy incident creation if logic triggers)
        final rule = Rule(
          serviceId: serviceId,
          signalId: 1, // Dummy, assumed existing or not FK checked strictly in test env if not seeded? 
          // Wait, signalId is FK to health_signal. We need a signal.
          // Let's create a signal first.
          name: 'Test Rule',
          condition: 'cpu > 90',
          durationSeconds: 60,
          severity: IncidentSeverity.HIGH,
          enabled: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        // We need a signal first
        final signal = HealthSignal(
          serviceId: serviceId,
          name: 'CPU',
          identifier: 'cpu',
          type: SignalType.METRIC,
          isHealthy: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        final createdSignal = await HealthSignal.db.insertRow(session, signal);
        
        rule.signalId = createdSignal.id!;
        await Rule.db.insertRow(session, rule);


        // 3. Generate Report
        final reportEndpoint = ReportEndpoint();
        final reportData = await reportEndpoint.generateHealthReport(session);
        
        expect(reportData, isNotEmpty);
        expect(reportData.containsKey('summary'), isTrue);
        expect(reportData['summary']['totalServices'], greaterThanOrEqualTo(1));

        // 4. Save Report (Global / Incident ID 0)
        // This exercises the logic I added to create a dummy incident
        final snapshot = await reportEndpoint.saveGeneratedReport(
          session,
          reportData: reportData,
          incidentId: 0, 
          generatedById: ownerId,
        );

        expect(snapshot.id, isNotNull);
        expect(snapshot.incidentId, isNotNull);
        expect(snapshot.incidentId, isNot(0)); // Should have been reassigned
        expect(snapshot.generatedById, ownerId);
        
        // Verify content
        final savedData = jsonDecode(snapshot.content);
        expect(savedData['summary']['totalServices'], reportData['summary']['totalServices']);

        // 5. Verify Dummy Incident Created (Optional, implicit by incidentId != 0)
        final incident = await Incident.db.findById(session, snapshot.incidentId);
        expect(incident, isNotNull);
        // If it was a new dummy incident, check title
        if (incident?.title == 'System Reports Placeholder') {
           print('Verified: Dummy incident created for report.');
        } else {
           print('Verified: Attached to existing incident #${incident?.id}');
        }

      } finally {
        await session.close();
      }
    });
  });
}
