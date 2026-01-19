# Flutter Integration Guide

This guide documents the Flutter frontend and provides tasks to integrate it with the Serverpod backend.

---

## Project Overview

**Flutter Path**: `serverpod_sentinel_flutter/`
**Client Package**: `serverpod_sentinel_client`

The app uses:
- Flutter Riverpod for state management
- GoRouter for navigation
- Serverpod client for API communication

---

## Current State Analysis

### Providers Using Mock Data

| Provider | File | Status |
|----------|------|--------|
| `servicesProvider` | `services_provider.dart` | ⚠️ Mock data |
| `healthSummaryProvider` | `services_provider.dart` | ⚠️ Mock data |
| `incidentsProvider` | `incidents_provider.dart` | ⚠️ Mock data |
| `activeIncidentsProvider` | `incidents_provider.dart` | ⚠️ Mock data |
| `incidentStatsProvider` | `incidents_provider.dart` | ⚠️ Mock data |

### Local Model Definitions (Conflicts)

The providers define their own model classes that shadow the generated ones:

- `services_provider.dart` defines local `Service` and `ServiceStatus` classes
- `incidents_provider.dart` defines local `Incident`, `IncidentStatus`, `IncidentSeverity` classes

> [!WARNING]
> These local definitions must be removed and replaced with imports from `serverpod_sentinel_client`.

---

## Integration Tasks

### 1. Fix Provider Imports

#### 1.1 Services Provider
**File**: `lib/providers/services_provider.dart`

**Current Issue**: Uses local `Service` class instead of generated one.

**Fix**:
```dart
// REMOVE local class definitions at bottom of file
// CHANGE provider to use real API:

final servicesProvider = FutureProvider<List<Service>>((ref) async {
  final client = ref.watch(clientProvider);
  return await client.service.list();
});

final healthSummaryProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final client = ref.watch(clientProvider);
  return await client.service.getHealthSummary();
});
```

---

#### 1.2 Incidents Provider
**File**: `lib/providers/incidents_provider.dart`

**Current Issue**: Uses local `Incident` class.

**Fix**:
```dart
// REMOVE local class definitions
// CHANGE providers to use real API:

final incidentsProvider = FutureProvider<List<Incident>>((ref) async {
  final client = ref.watch(clientProvider);
  return await client.incident.list();
});

final activeIncidentsProvider = FutureProvider<List<Incident>>((ref) async {
  final client = ref.watch(clientProvider);
  return await client.incident.list(
    status: IncidentStatus.OPEN,
  );
});

final incidentStatsProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final client = ref.watch(clientProvider);
  return await client.incident.getStats();
});
```

---

### 2. Add Missing Providers

#### 2.1 Playbooks Provider
**File**: `lib/providers/playbooks_provider.dart` [NEW]

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import 'client_provider.dart';

final playbooksProvider = FutureProvider<List<Playbook>>((ref) async {
  final client = ref.watch(clientProvider);
  return await client.playbook.list();
});

final playbookProvider = FutureProvider.family<Playbook?, int>((ref, id) async {
  final client = ref.watch(clientProvider);
  return await client.playbook.get(id);
});

class PlaybookMutation extends StateNotifier<AsyncValue<Playbook?>> {
  final Client _client;
  final Ref _ref;

  PlaybookMutation(this._client, this._ref) : super(const AsyncValue.data(null));

  Future<Playbook?> create(Playbook playbook) async {
    state = const AsyncValue.loading();
    try {
      final created = await _client.playbook.create(playbook);
      _ref.invalidate(playbooksProvider);
      state = AsyncValue.data(created);
      return created;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  Future<void> execute(int playbookId, int incidentId, int initiatorId) async {
    await _client.playbook.execute(playbookId, incidentId, initiatorId);
  }
}

final playbookMutationProvider =
    StateNotifierProvider<PlaybookMutation, AsyncValue<Playbook?>>((ref) {
  final client = ref.watch(clientProvider);
  return PlaybookMutation(client, ref);
});
```

---

#### 2.2 Rules Provider
**File**: `lib/providers/rules_provider.dart` [NEW]

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import 'client_provider.dart';

final rulesProvider = FutureProvider<List<Rule>>((ref) async {
  final client = ref.watch(clientProvider);
  return await client.rule.list();
});

final rulesForServiceProvider =
    FutureProvider.family<List<Rule>, int>((ref, serviceId) async {
  final client = ref.watch(clientProvider);
  return await client.rule.listForService(serviceId);
});

class RuleMutation extends StateNotifier<AsyncValue<Rule?>> {
  final Client _client;
  final Ref _ref;

  RuleMutation(this._client, this._ref) : super(const AsyncValue.data(null));

  Future<Rule?> create(Rule rule) async {
    state = const AsyncValue.loading();
    try {
      final created = await _client.rule.create(rule);
      _ref.invalidate(rulesProvider);
      state = AsyncValue.data(created);
      return created;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  Future<void> toggleEnabled(int id, bool enabled) async {
    await _client.rule.toggleEnabled(id, enabled);
    _ref.invalidate(rulesProvider);
  }
}

final ruleMutationProvider =
    StateNotifierProvider<RuleMutation, AsyncValue<Rule?>>((ref) {
  final client = ref.watch(clientProvider);
  return RuleMutation(client, ref);
});
```

---

#### 2.3 Team Members Provider
**File**: `lib/providers/team_provider.dart` [NEW]

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import 'client_provider.dart';

final teamMembersProvider = FutureProvider<List<OpsUser>>((ref) async {
  final client = ref.watch(clientProvider);
  return await client.user.listTeamMembers();
});

final currentUserProvider = FutureProvider<OpsUser?>((ref) async {
  final client = ref.watch(clientProvider);
  return await client.user.getCurrentUser();
});
```

---

### 3. Screen Integration Tasks

#### 3.1 Dashboard Screen
**File**: `lib/screens/dashboard/dashboard_screen.dart`

**Current**: Uses `healthSummaryProvider` and `activeIncidentsProvider` (both mock)
**Action**: Will work automatically once providers are updated

---

#### 3.2 Service Registry Screen
**File**: `lib/screens/registry/service_registry_screen.dart`

**Action**: Ensure it uses `servicesProvider` correctly.

---

#### 3.3 Incidents Screen
**File**: `lib/screens/incidents/incidents_screen.dart`

**Action**: Ensure it uses `incidentsProvider` and `incidentMutationProvider`.

---

#### 3.4 Playbooks Screen
**File**: `lib/screens/automation/playbooks_screen.dart`

**Current**: Likely has hardcoded data
**Action**: Connect to `playbooksProvider`

---

#### 3.5 Settings Screens

These require new backend endpoints:

| Screen | Backend Dependency |
|--------|-------------------|
| `team_members_screen.dart` | `UserEndpoint.listTeamMembers` ✅ |
| `audit_log_screen.dart` | `AuditLogEndpoint` ❌ (needs creation) |
| `integrations_manager_screen.dart` | `IntegrationEndpoint` ❌ (needs creation) |
| `notification_preferences_screen.dart` | `NotificationPreferencesEndpoint` ❌ |
| `environment_settings_screen.dart` | `EnvironmentEndpoint` ❌ |
| `system_settings_screen.dart` | `SystemSettingsEndpoint` ❌ |
| `configure_rule_screen.dart` | `RuleEndpoint` ✅ |

---

### 4. Error Handling

Add proper error handling to all providers:

```dart
final servicesProvider = FutureProvider<List<Service>>((ref) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.service.list();
  } catch (e) {
    // Log error
    rethrow;
  }
});
```

---

### 5. Loading States

Ensure screens show loading indicators while data loads:

```dart
servicesAsync.when(
  loading: () => const CircularProgressIndicator(),
  error: (e, _) => Text('Error: $e'),
  data: (services) => ServiceList(services: services),
);
```

---

### 6. Real-time Updates

For live data, use streaming:

```dart
// Subscribe to global service updates
final client = ref.watch(clientProvider);
await client.openStreamingConnection();
client.streaming.sendStreamMessage(
  StreamSubscription(type: StreamSubscriptionType.GLOBAL_SERVICE_UPDATES),
);
```

---

## File Changes Summary

### Modified Files
- `lib/providers/services_provider.dart` - Remove mocks, use real API
- `lib/providers/incidents_provider.dart` - Remove mocks, use real API

### New Files
- `lib/providers/playbooks_provider.dart`
- `lib/providers/rules_provider.dart`
- `lib/providers/team_provider.dart`
- `lib/providers/settings_provider.dart` (after backend endpoints ready)

---

## Verification Checklist

- [x] All providers import from `serverpod_sentinel_client`
- [x] No local model class definitions remain in providers
- [ ] App compiles without errors (requires screen updates)
- [ ] Dashboard loads data from backend
- [ ] Incidents screen shows real data
- [ ] Service registry shows real data
- [ ] Team members screen works
- [ ] Error states display correctly

> [!NOTE]
> Screen files (dashboard_screen.dart, incidents_screen.dart) still reference old local model fields
> like `description`, `endpoint`, `responseTime`, `version`. These need to be updated to match the
> generated models from serverpod_sentinel_client.

