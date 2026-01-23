# Implementation Plan

Based on the analysis of backend endpoints and frontend screens, this plan outlines the steps required to achieve full integration.

## Phase 1: Critical User Flows (High Priority)

These tasks address gaps in core user flows that currently rely on mock data or lack feedback.

1.  **Agent Installation Feedback Loop**
    *   **Goal**: The `InstallAgentScreen` should automatically detect when an agent connects.
    *   **Action**:
        *   Update `InstallAgentScreen` to subscribe to `StreamSubscriptionType.GLOBAL_SERVICE_UPDATES`.
        *   Listen for `StreamServiceStatus` messages where `newStatus` becomes `OPERATIONAL`.
        *   Show a success message/animation and enable the "Continue" button.

2.  **Live Service Metrics**
    *   **Goal**: `ServiceDetailScreen` should display real data instead of hardcoded strings.
    *   **Action**:
        *   Backend: Ensure `TelemetryEndpoint` or `StreamingEndpoint` broadcasts metric updates.
        *   Frontend: In `ServiceDetailScreen`, subscribe to `StreamSubscriptionType.SERVICE_METRICS`.
        *   Frontend: Map incoming `StreamMetric` data to the `_MetricCard` widgets.

3.  **Incident Reporting**
    *   **Goal**: Allow users to generate and view reports.
    *   **Action**:
        *   Create a UI for `ReportEndpoint.generateHealthReport`.
        *   Ensure `IncidentReportScreen` correctly calls `generateIncidentReport` and displays the results.

## Phase 2: Enhanced Management (Medium Priority)

1.  **Agent Task Management**
    *   **Goal**: Allow admins to send commands to agents.
    *   **Action**:
        *   Create a new `AgentConsoleScreen` or add a tab to `ServiceDetailScreen`.
        *   Integrate `AgentEndpoint.createTask` to send commands.
        *   Integrate `AgentEndpoint.pollTask` (or streaming) to view output.

2.  **Audit Log Details**
    *   **Goal**: View detailed changes in audit logs.
    *   **Action**:
        *   Add a tap handler to `AuditLogScreen` list items.
        *   Create a `AuditLogDetailScreen` or modal that shows the full JSON content/diff.

3.  **Integration Testing**
    *   **Goal**: Verify integrations work.
    *   **Action**:
        *   Add a "Test Connection" button to `IntegrationsManagerScreen`.
        *   Call `IntegrationEndpoint.testConnection` and display the result toast/snackbar.

## Phase 3: Admin Tools (Low Priority)

1.  **Raw System Settings**
    *   **Goal**: Power user configuration.
    *   **Action**:
        *   Add an "Advanced" tab to `SystemSettingsScreen`.
        *   List all settings using `SystemSettingsEndpoint.list`.
        *   Allow editing values directly via `upsert`.

2.  **Telemetry Explorer**
    *   **Goal**: Debugging health signals.
    *   **Action**:
        *   Create a view to list all raw `HealthSignal`s for a service using `TelemetryEndpoint.getSignals`.
