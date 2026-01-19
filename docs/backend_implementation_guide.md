# Backend Implementation Guide

This guide documents the current state of the Serverpod backend and provides implementation tasks to fully support the Flutter frontend.

---

## Project Overview

**Backend Path**: `serverpod_sentinel_server/`
**Client Path**: `serverpod_sentinel_client/`

The backend uses Serverpod 3.2.2 with:
- Email-based authentication via `serverpod_auth_idp_server`
- PostgreSQL database
- Real-time streaming
- FutureCall for background jobs

---

## Existing Endpoints

| Endpoint | Methods | Status |
|----------|---------|--------|
| `ServiceEndpoint` | list, get, create, update, delete, getHealthSummary | ✅ Complete |
| `IncidentEndpoint` | list, get, updateStatus, assignCommander, addTimelineItem, getStats | ✅ Complete |
| `PlaybookEndpoint` | list, get, create, update, delete, execute, getExecution | ✅ Complete |
| `RuleEndpoint` | list, listForService, get, create, update, toggleEnabled, delete | ✅ Complete |
| `UserEndpoint` | getCurrentUser, listTeamMembers, get, update, assignRole, removeRole | ✅ Complete |
| `TelemetryEndpoint` | ingestSignal, ingestBatch, heartbeat, getSignals | ✅ Complete |
| `HealthEndpoint` | ping, check, ready, live | ✅ Complete |
| `StreamingEndpoint` | streamOpened, streamClosed, handleStreamMessage | ✅ Complete |

---

## Protocol Models (Database Tables)

### Service Domain
- `Service` - Core service registry
- `HealthSignal` - Health metrics per service
- `Rule` - Alert rules attached to services

### Incident Domain
- `Incident` - Incident records
- `IncidentTimelineItem` - Timeline entries for incidents

### Automation Domain
- `Playbook` - Automation playbooks
- `PlaybookExecution` - Execution records
- `PlaybookStepExecution` - Step-level execution details

### Security Domain
- `OpsUser` - Application users (linked to `serverpod_auth` `UserInfo`)
- `Role` - User roles
- `UserRole` - User-role mappings
- `AuditLog` - Audit trail
- `ServiceToken` - API tokens for services

### Telemetry Domain
- `TelemetryHeartbeat` - Agent heartbeats
- `TelemetryEvent` - Telemetry events

### Reporting Domain
- `ReportSnapshot` - Report data snapshots

---

## Implementation Tasks

### 1. Settings Endpoints ✅ COMPLETE

The Flutter app has extensive settings screens that require backend support.

#### 1.1 Environment Settings Endpoint ✅
**File**: `lib/src/endpoints/environment_endpoint.dart`

**Methods implemented**:
- `list()` - Get all environments
- `get(int id)` - Get single environment
- `create(Environment env)` - Create new environment
- `update(Environment env)` - Update environment
- `delete(int id)` - Delete environment
- `getActive()` - Get the currently active environment
- `setActive(int id)` - Set active environment

---

#### 1.2 Integration Settings Endpoint ✅
**File**: `lib/src/endpoints/integration_endpoint.dart`

**Methods implemented**:
- `list({String? type})` - Get all integrations (optionally filtered by type)
- `get(int id)` - Get single integration
- `create(Integration integration)` - Create new integration
- `update(Integration integration)` - Update integration
- `delete(int id)` - Delete integration
- `toggleEnabled(int id, bool enabled)` - Toggle integration on/off
- `testConnection(int id)` - Test integration connection
- `sync(int id)` - Sync integration data

---

#### 1.3 Notification Preferences Endpoint ✅
**File**: `lib/src/endpoints/notification_preferences_endpoint.dart`

**Methods implemented**:
- `getForUser(int userId)` - Get user's preferences
- `getOrCreate(int userId, String channel)` - Get or create preference
- `update(NotificationPreference pref)` - Update preference
- `toggleEnabled(int userId, String channel, bool enabled)` - Toggle channel
- `testNotification(int userId, String channel)` - Send test notification
- `getAvailableChannels()` - Get list of available channels

---

#### 1.4 Audit Log Endpoint ✅
**File**: `lib/src/endpoints/audit_log_endpoint.dart`

**Methods implemented**:
- `list({int? actorId, String? action, String? entityType, ...})` - Query logs with filters
- `get(int id)` - Get single log entry
- `getForEntity(String entityType, int entityId)` - Get logs for specific entity
- `getActionTypes()` - Get available action types
- `getEntityTypes()` - Get available entity types
- `create(AuditLog log)` - Create audit log entry

---

#### 1.5 System Settings Endpoint ✅
**File**: `lib/src/endpoints/system_settings_endpoint.dart`

**Methods implemented**:
- `list({String? category})` - Get all settings
- `getByKey(String key)` - Get single setting by key
- `getValue(String key)` - Get setting value only
- `upsert(String key, String value, ...)` - Create or update setting
- `delete(String key)` - Delete setting
- `getCategories()` - Get all categories
- `bulkUpdate(List<SystemSetting> settings)` - Bulk update
- `getPublic()` - Get non-secret settings


---

### 2. Reports Endpoint ✅ COMPLETE

The Flutter app has a reports screen.

**File**: `lib/src/endpoints/report_endpoint.dart`

**Methods implemented**:
- `listSnapshots({int? incidentId, int? generatedById, int? limit, int? offset})` - List saved reports with filters
- `getSnapshot(int id)` - Get saved report snapshot
- `saveSnapshot(ReportSnapshot snapshot)` - Save a report snapshot
- `deleteSnapshot(int id)` - Delete a report snapshot
- `generateIncidentReport({DateTime from, DateTime to, List<int>? serviceIds, List<IncidentSeverity>? severities})` - Generate comprehensive incident report with statistics
- `generateHealthReport({List<int>? serviceIds})` - Generate service health report
- `saveGeneratedReport({required Map reportData, required int incidentId, required int generatedById})` - Save generated report as snapshot


---

### 3. Enhanced Incident Endpoint ✅ COMPLETE

Added methods to the existing `IncidentEndpoint`:

**File**: `lib/src/endpoints/incident_endpoint.dart`

**New methods implemented**:
- `create(Incident incident)` - Create new incident manually with timeline entry and streaming broadcast
- `close(int id)` - Close an incident
- `acknowledge(int id, int userId)` - Acknowledge a single incident
- `acknowledgeAll(int userId)` - Bulk acknowledge all open incidents
- `update(Incident incident)` - Update incident details
- `delete(int id)` - Delete an incident and its timeline items


---

### 4. AI Insights Endpoint ✅ COMPLETE

For the AI Insights screen. Stub implementations returning mock data until real AI integration is added.

**File**: `lib/src/endpoints/ai_insights_endpoint.dart`
**Model**: `lib/src/protocol/ai/ai_insight.spy.yaml`

**Methods implemented**:
- `getInsights({int? serviceId, String? type, int? limit})` - Get AI-generated insights
- `analyzeIncident(int incidentId)` - Generate comprehensive incident analysis with root cause, impact, and recommendations
- `suggestActions(int incidentId)` - Get prioritized suggested actions based on severity
- `predictServiceHealth(int serviceId)` - Generate health predictions with risk scores
- `trainModel()` - Trigger model retraining (stub)
- `getInsightTypes()` - Get available insight types

**AiInsight model fields**:
- `type`: anomaly, prediction, recommendation, analysis, trend, correlation
- `title`, `content`: Display information
- `severity`: info, warning, critical
- `confidence`: 0.0 to 1.0 confidence score
- `serviceId`, `incidentId`: Optional relations


---

### 5. Live Stream Endpoint ✅ COMPLETE

Enhanced streaming for the Live Stream screen.

**File**: `lib/src/endpoints/streaming_endpoint.dart`

**New subscription types added**:
- `SERVICE_METRICS` - Real-time metrics streaming per service
- `SERVICE_LOGS` - Real-time log streaming per service  
- `AI_INSIGHTS` - AI-generated insights streaming
- `ALERTS` - Real-time alert notifications

**New streaming models**:
- `StreamLogEntry` - Log entries with level, message, source, metadata
- `StreamMetric` - Metrics with name, value, unit, labels
- `StreamAlert` - Alerts with title, message, severity, source

**StreamBroadcaster helper class**:
- `broadcastMetric()` - Broadcast metrics to subscribers
- `broadcastLog()` - Broadcast log entries to subscribers
- `broadcastAlert()` - Broadcast alerts to subscribers
- `broadcastAiInsight()` - Broadcast AI insights to subscribers
- `broadcastServiceUpdate()` - Broadcast service status changes


---

## Database Migrations

After adding new protocol models:

```bash
cd serverpod_sentinel_server
serverpod generate
serverpod create-migration
```

---

## Verification Checklist

- [ ] All endpoints compile without errors
- [ ] `serverpod generate` succeeds
- [ ] Migrations apply cleanly
- [ ] Client package updated with new endpoints
- [ ] Basic endpoint tests pass

---

## File Structure

```
lib/src/
├── endpoints/
│   ├── ai_insights_endpoint.dart      [NEW]
│   ├── audit_log_endpoint.dart        [NEW]
│   ├── environment_endpoint.dart      [NEW]
│   ├── health_endpoint.dart           [EXISTS]
│   ├── incident_endpoint.dart         [ENHANCE]
│   ├── integration_endpoint.dart      [NEW]
│   ├── notification_preferences_endpoint.dart [NEW]
│   ├── playbook_endpoint.dart         [EXISTS]
│   ├── report_endpoint.dart           [NEW]
│   ├── rule_endpoint.dart             [EXISTS]
│   ├── service_endpoint.dart          [EXISTS]
│   ├── streaming_endpoint.dart        [EXISTS]
│   ├── system_settings_endpoint.dart  [NEW]
│   ├── telemetry_endpoint.dart        [EXISTS]
│   └── user_endpoint.dart             [EXISTS]
└── protocol/
    ├── settings/
    │   ├── environment.spy.yaml       [NEW]
    │   ├── integration.spy.yaml       [NEW]
    │   ├── notification_preference.spy.yaml [NEW]
    │   └── system_setting.spy.yaml    [NEW]
    └── ai/
        └── ai_insight.spy.yaml        [NEW]
```
