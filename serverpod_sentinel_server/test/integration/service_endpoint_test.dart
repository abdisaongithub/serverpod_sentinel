import 'package:test/test.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:serverpod_sentinel_server/src/generated/endpoints.dart';
import 'package:serverpod_sentinel_server/src/endpoints/service_endpoint.dart';
import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('ServiceEndpoint', (sessionBuilder, endpoints) {
    var serviceId = 0;
    var ownerId = 0;

    // setUpAll block removed

    test('Service CRUD Flow', () async {
      // Create a single session for the entire flow to ensure visibility
      final session = sessionBuilder.build();
      try {
        // 0. Seed User
        final userInfo = UserInfo(
          userIdentifier: 'test_user_${Uuid().v4()}',
          userName: 'Test User',
          fullName: 'Test User',
          email: 'test_${Uuid().v4()}@example.com',
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

        // 1. Create Service using direct Endpoint instance
        final serviceEndpoint = ServiceEndpoint();
        final service = Service(
          name: 'Test Service',
          ownerId: ownerId,
          tags: ['test'],
          status: ServiceStatus.OPERATIONAL,
          tier: ServiceTier.TIER_1,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final createdService = await serviceEndpoint.create(
          session,
          service,
        );
        expect(createdService.id, isNotNull);
        expect(createdService.name, 'Test Service');
        serviceId = createdService.id!;

        // 2. Get Service
        var fetchedService = await serviceEndpoint.get(
          session,
          serviceId,
        );
        expect(fetchedService, isNotNull);
        expect(fetchedService!.name, 'Test Service');

        // 3. Update Service
        fetchedService.name = 'Updated Service';
        final updatedService = await serviceEndpoint.update(
          session,
          fetchedService,
        );
        expect(updatedService.name, 'Updated Service');

        // 4. List Services
        final services = await serviceEndpoint.list(session);
        expect(services.length, greaterThanOrEqualTo(1));
        expect(services.any((s) => s.id == serviceId), isTrue);

        // 5. Delete Service
        final deleted = await serviceEndpoint.delete(session, serviceId);
        expect(deleted, isTrue);

        fetchedService = await serviceEndpoint.get(session, serviceId);
        expect(fetchedService, isNull);
      } finally {
        await session.close();
      }
    });
  });
}
