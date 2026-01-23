# Backend Endpoint Integration Status

This document details the integration status of all Serverpod endpoints in `serverpod_sentinel_server`.

**Legend:**
*   ✅ **Integrated**: Connected to Frontend Providers/Services.
*   ⚠️ **Partially Integrated**: Some methods are used, others are not.
*   ❌ **Not Integrated**: No usage found in Frontend code.
*   🤖 **Agent API**: Intended for the Sentinel Agent, not primarily for the Frontend.

## 1. AgentEndpoint
*   **Status**: ❌ **Not Integrated** (Frontend) / 🤖 **Agent API**
*   **Purpose**: Manages agent tasks and polling.
*   **Methods:**
    *   `pollTask`: ❌ (Agent use)
    *   `updateTaskStatus`: ❌ (Agent use)
    *   `createTask`: ❌ (Frontend should likely use this for remote execution, but currently unused)

## 2. AiInsightsEndpoint
*   **Status**: ✅ **Integrated**
*   **Purpose**: Provides AI analysis for incidents and services.
*   **Methods:**
    *   `getInsights`: ✅ Used in `AiInsightsProvider`
    *   `getInsightTypes`: ✅ Used in `AiInsightsProvider`
    *   `analyzeIncident`: ✅ Used in `AiInsightsProvider`
    *   `suggestActions`: ✅ Used in `AiInsightsProvider`
    *   `predictServiceHealth`: ✅ Used in `AiInsightsProvider`
    *   `trainModel`: ❌ Stub implementation, unused.

## 3. AlertEndpoint
*   **Status**: ✅ **Integrated**
*   **Purpose**: Fetches recent alerts for dashboard/streaming.
*   **Methods:**
    *   `getRecent`: ✅ Used in `AlertsProvider`, `StreamingProvider`

## 4. AuditLogEndpoint
*   **Status**: ⚠️ **Partially Integrated**
*   **Purpose**: System audit logging.
*   **Methods:**
    *   `list`: ✅ Used in `SettingsProvider`
    *   `get`: ❌
    *   `getForEntity`: ✅ Used in `SettingsProvider`
    *   `getActionTypes`: ❌
    *   `getEntityTypes`: ❌
    *   `create`: ❌ (Typically internal use)

## 5. EnvironmentEndpoint
*   **Status**: ⚠️ **Partially Integrated**
*   **Purpose**: Manages deployment environments (Dev, Prod, etc.).
*   **Methods:**
    *   `list`: ✅ Used in `SettingsProvider`
    *   `get`: ❌
    *   `create`: ✅ Used in `SettingsProvider`
    *   `update`: ✅ Used in `SettingsProvider`
    *   `delete`: ❌
    *   `getActive`: ✅ Used in `SettingsProvider`
    *   `setActive`: ✅ Used in `SettingsProvider`

## 6. HealthEndpoint
*   **Status**: ❌ **Not Integrated** (UI)
*   **Purpose**: K8s/Infrastructure health checks.
*   **Methods:**
    *   `ping`: ❌
    *   `check`: ❌
    *   `ready`: ❌
    *   `live`: ❌

## 7. IncidentEndpoint
*   **Status**: ✅ **Integrated**
*   **Purpose**: Core incident management.
*   **Methods:**
    *   `list`: ✅ Used in `IncidentsProvider`
    *   `get`: ✅ Used in `IncidentsProvider`
    *   `getStats`: ✅ Used in `IncidentsProvider`
    *   `create`: ✅ Used in `IncidentsProvider`
    *   `updateStatus`: ✅ Used in `IncidentsProvider`
    *   `assignCommander`: ✅ Used in `IncidentsProvider`
    *   `addTimelineItem`: ✅ Used in `IncidentsProvider`
    *   `close`: ✅ Used in `IncidentsProvider`
    *   `acknowledge`: ✅ Used in `IncidentsProvider`
    *   `acknowledgeAll`: ✅ Used in `IncidentsProvider`
    *   `update`: ❌ (Generic update unused, specific actions preferred)
    *   `delete`: ✅ Used in `IncidentsProvider`

## 8. IntegrationEndpoint
*   **Status**: ⚠️ **Partially Integrated**
*   **Purpose**: Manages external integrations (GitHub, Slack, etc.).
*   **Methods:**
    *   `list`: ✅ Used in `SettingsProvider`
    *   `get`: ❌
    *   `create`: ✅ Used in `SettingsProvider`
    *   `update`: ❌
    *   `delete`: ❌
    *   `toggleEnabled`: ✅ Used in `SettingsProvider`
    *   `testConnection`: ✅ Used in `SettingsProvider` (but UI usage is minimal)
    *   `sync`: ❌

## 9. NotificationPreferencesEndpoint
*   **Status**: ⚠️ **Partially Integrated**
*   **Purpose**: User notification settings.
*   **Methods:**
    *   `getForUser`: ✅ Used in `SettingsProvider`
    *   `getOrCreate`: ✅ Used in `LocalSettingsProvider`
    *   `update`: ✅ Used in `LocalSettingsProvider`
    *   `toggleEnabled`: ✅ Used in `SettingsProvider`
    *   `getAvailableChannels`: ✅ Used in `SettingsProvider`
    *   `testNotification`: ❌

## 10. PlaybookEndpoint
*   **Status**: ✅ **Integrated**
*   **Purpose**: Automation playbooks.
*   **Methods:**
    *   `list`: ✅ Used in `PlaybooksProvider`
    *   `get`: ✅ Used in `PlaybooksProvider`
    *   `create`: ✅ Used in `PlaybooksProvider`
    *   `update`: ✅ Used in `PlaybooksProvider`
    *   `delete`: ✅ Used in `PlaybooksProvider`
    *   `execute`: ✅ Used in `PlaybooksProvider`
    *   `getExecution`: ✅ Used in `PlaybooksProvider`

## 11. ReportEndpoint
*   **Status**: ⚠️ **Partially Integrated**
*   **Purpose**: PDF/Data reporting.
*   **Methods:**
    *   `listSnapshots`: ✅ Used in `ReportsProvider`
    *   `getSnapshot`: ✅ Used in `ReportsProvider`
    *   `generateIncidentReport`: ✅ Used in `ReportsProvider`
    *   `generateHealthReport`: ✅ Used in `ReportsProvider`
    *   `saveSnapshot`: ✅ Used in `ReportsProvider`
    *   `deleteSnapshot`: ✅ Used in `ReportsProvider`
    *   `saveGeneratedReport`: ❌

## 12. RuleEndpoint
*   **Status**: ✅ **Integrated**
*   **Purpose**: Alerting rules.
*   **Methods:**
    *   `list`: ✅ Used in `RulesProvider`
    *   `listForService`: ✅ Used in `RulesProvider`
    *   `get`: ✅ Used in `RulesProvider`
    *   `create`: ✅ Used in `RulesProvider`
    *   `update`: ✅ Used in `RulesProvider`
    *   `toggleEnabled`: ✅ Used in `RulesProvider`
    *   `delete`: ✅ Used in `RulesProvider`

## 13. ServiceEndpoint
*   **Status**: ⚠️ **Partially Integrated**
*   **Purpose**: Service registry and health.
*   **Methods:**
    *   `list`: ✅ Used in `ServicesProvider`, `StreamingProvider`
    *   `get`: ✅ Used in `ServicesProvider`
    *   `getHealthSummary`: ✅ Used in `ServicesProvider`
    *   `getSystemMetrics`: ✅ Used in `ServicesProvider` (Note: Returns global metrics only)
    *   `create`: ✅ Used in `ServicesProvider`
    *   `update`: ✅ Used in `ServicesProvider`
    *   `delete`: ✅ Used in `ServicesProvider`

## 14. StreamingEndpoint
*   **Status**: ✅ **Integrated**
*   **Purpose**: WebSocket connections.
*   **Methods:**
    *   `handleStreamMessage`: ✅ Implied usage via `StreamingProvider` and client connection.

## 15. SystemSettingsEndpoint
*   **Status**: ⚠️ **Partially Integrated**
*   **Purpose**: Global system configuration.
*   **Methods:**
    *   `list`: ✅ Used in `SettingsProvider`
    *   `getPublic`: ✅ Used in `SettingsProvider`
    *   `upsert`: ✅ Used in `SettingsProvider`
    *   `getByKey`: ❌
    *   `getValue`: ❌
    *   `delete`: ❌
    *   `getCategories`: ❌
    *   `bulkUpdate`: ❌

## 16. TelemetryEndpoint
*   **Status**: ❌ **Not Integrated** (UI) / 🤖 **Agent API**
*   **Purpose**: Ingestion of metrics/signals.
*   **Methods:**
    *   `ingestSignal`: 🤖
    *   `ingestBatch`: 🤖
    *   `heartbeat`: 🤖
    *   `getSignals`: ❌ (Potentially useful for UI Service Details, but not used)

## 17. UserEndpoint
*   **Status**: ✅ **Integrated**
*   **Purpose**: Team and user management.
*   **Methods:**
    *   `getCurrentUser`: ✅ Used in `TeamProvider`
    *   `listTeamMembers`: ✅ Used in `TeamProvider`
    *   `get`: ✅ Used in `TeamProvider`
    *   `update`: ✅ Used in `TeamProvider`
    *   `assignRole`: ✅ Used in `TeamProvider`
    *   `removeRole`: ✅ Used in `TeamProvider`
