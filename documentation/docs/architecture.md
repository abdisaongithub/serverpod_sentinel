---
sidebar_position: 3
---

# Architecture

Serverpod Sentinel is designed for low latency and high reliability. It uses a hub-and-spoke model where the central Server communicates with distributed Agents.

## Components

### 1. Central Server (`serverpod_sentinel_server`)
- Built with **Dart** and **Serverpod**.
- Manages the **Postgres** database (time-series telemetry and incident logs).
- Uses **Redis** for pub/sub messaging and caching.
- Handles AI correlation logic and Playbook orchestration.

### 2. Sentinel Agent (`sentinel_agent`)
- A lightweight, native binary compiled from Dart.
- Runs on any monitored host (Linux/Windows).
- **Telemetry**: Collects CPU, RAM, and disk metrics every few seconds.
- **Log Scraping**: Scans application logs for errors in real-time.
- **Task Execution**: Pulls "Pending Tasks" from the server to run remediation commands.

### 3. Real-time Flutter UI (`serverpod_sentinel_flutter`)
- Built with **Flutter Web**.
- Uses **WebSockets** (via Serverpod Streaming) to receive live updates on service status and metrics.
- Optimized for desktop management.

## Communication Flow

1.  **Ingestion**: Agents send telemetry batches to the `TelemetryEndpoint` via encrypted HTTP calls.
2.  **Streaming**: The Server broadcasts status changes to the Flutter UI using `session.messages.postMessage`.
3.  **Remediation**: 
    - User triggers a Playbook in the UI.
    - Server creates an `AgentTask`.
    - Agent polls the task, executes it, and reports back `stdout`/`stderr`.
    - Server updates the UI with live progress.

## Security

- **Agent Authentication**: Every agent uses a unique `ServiceToken` to authenticate.
- **RBAC**: User actions are guarded by Serverpod scopes (Viewer, Operator, Admin).
- **Audit Logs**: Every critical action (restarts, deployments, config changes) is recorded in the immutable Audit Log.
