# Frontend Implementation Gaps

This document outlines the gaps between backend capabilities and frontend implementation. It identifies screens that are missing endpoint integrations and endpoints that lack corresponding UI screens.

## 1. Screens Made but Missing Endpoints (Mock/Static Data)

These screens exist in the codebase but currently rely on hardcoded data or placeholder logic instead of calling available backend endpoints.

### **ServiceDetailScreen (`lib/screens/registry/service_detail_screen.dart`)**
*   **Gap**: The "Live Health Metrics" section (CPU, RAM, Error Rate, Net I/O) uses hardcoded static values (e.g., `'45%'`).
*   **Missing Integration**: Needs to fetch real-time or historical metrics.
*   **Recommendation**:
    *   Implement `TelemetryEndpoint.getSignals(serviceId)` to fetch raw signals.
    *   Or update `ServiceEndpoint` to provide `getServiceMetrics(serviceId)` similar to the global `getSystemMetrics`.
    *   Subscribe to `StreamSubscriptionType.SERVICE_METRICS` via `StreamingEndpoint`.

### **InstallAgentScreen (`lib/screens/onboarding/install_agent_screen.dart`)**
*   **Gap**: The "Listening for agent connection..." UI is purely visual (`_PulsingDot`). It does not actually poll for agent status or listen to a stream.
*   **Missing Integration**: `AgentEndpoint.pollTask` (or a new `checkConnection` method) or `StreamSubscriptionType.GLOBAL_SERVICE_UPDATES` to detect when the new agent sends a heartbeat.
*   **Recommendation**: Implement a polling mechanism or stream listener that updates the UI when the agent successfully connects (heartbeat received).

### **IntegrationsManagerScreen (`lib/screens/settings/integrations_manager_screen.dart`)**
*   **Gap**: The "Connect" logic uses a generic toggle. There is no UI flow to specific provider OAuth/Auth flows (GitHub, Slack, etc.).
*   **Gap**: `testConnection` is implemented in `SettingsProvider` but not exposed in the UI (no "Test" button).
*   **Recommendation**: Add a "Test Connection" button for enabled integrations.

## 2. Implemented Endpoints but Missing Screens

These backend endpoints are fully implemented and available but have no dedicated UI screens to utilize them.

### **Reports**
*   **Endpoint**: `ReportEndpoint.generateHealthReport`
*   **Gap**: While `ReportsProvider` exposes this, there is no screen allowing a user to generate, view, or download a "Service Health Report" specifically.
*   **Status**: `IncidentReportScreen` exists, but a dedicated `HealthReportScreen` or a tab within `ReportsScreen` is missing.

### **System Settings (Advanced)**
*   **Endpoint**: `SystemSettingsEndpoint.bulkUpdate`, `delete`
*   **Gap**: The `SystemSettingsScreen` handles specific toggles (like Guardrails), but there is no "Advanced" or "Raw" editor to view/edit/delete arbitrary system settings keys, which would be useful for admins.

### **Audit Logs (Detail View)**
*   **Endpoint**: `AuditLogEndpoint.get`
*   **Gap**: `AuditLogScreen` lists logs (`list`), but there appears to be no detail view (`get`) when clicking on a log entry to see the full JSON diff or metadata.

### **Environment Management**
*   **Endpoint**: `EnvironmentEndpoint.delete`
*   **Gap**: `EnvironmentSettingsScreen` allows creating and updating, but likely lacks a "Delete" flow (often requires a confirmation modal and safety checks).

## 3. Not Integrated / Partial Integrations

### **Telemetry Data Visualization**
*   **Gap**: `TelemetryEndpoint.getSignals` is not used.
*   **Impact**: Users cannot see the raw health signals (metrics) defined for a service in a list or chart format, beyond the mocked "Live Metrics" card.

### **Agent Management**
*   **Gap**: `AgentEndpoint` (Task management) is unused.
*   **Impact**: There is no "Agent Console" to see running tasks, command output, or status of the agent itself (version, uptime, etc.) beyond basic service status.

## 4. Prioritized To-Do List

1.  **[High] Real Service Metrics**: Connect `ServiceDetailScreen` to `StreamingEndpoint` or `TelemetryEndpoint` to show real CPU/RAM data.
2.  **[High] Agent Installation Feedback**: Make `InstallAgentScreen` listen for actual agent heartbeat.
3.  **[Medium] Report Generation UI**: Add UI for generating and viewing Service Health Reports.
4.  **[Medium] Audit Log Details**: Add a drill-down view for audit logs.
5.  **[Low] Raw Settings Editor**: Add an admin view for raw system settings.
