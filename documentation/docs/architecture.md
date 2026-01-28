---
sidebar_position: 3
---

# Architecture

Serverpod Sentinel is designed for extreme reliability, security, and low-latency observability. It follows a multi-tier architecture optimized for high-scale enterprise operations.

## 🏗️ Core Components

### 1. Hardened Backend (`serverpod_sentinel_server`)
The central nervous system of the platform, built on **Serverpod**.
- **Data Persistence:** Uses **PostgreSQL** for relational data and time-series telemetry.
- **Resilience Layer:** 
    - **L1 Cache:** In-memory caching for static configuration.
    - **L2 Cache:** Redis-backed distributed caching for real-time service health.
    - **Circuit Breakers:** Protects the system from cascading failures during external integration calls (Slack, Jira).
- **Orchestration:** Manages Playbook execution and autonomous remediation policies.
- **Security Engine:** Enforces 25+ granular permissions via a custom RBAC engine and encrypts secrets using **AES-256-GCM**.

### 2. Intelligent Sentinel Agent (`sentinel_agent`)
A lightweight, native CLI agent that runs on monitored infrastructure.
- **Heartbeats:** Maintains active connection status with the backend.
- **Signal Ingestion:** Collects and batches system metrics (CPU, RAM, Disk) and custom application health signals.
- **Remote Tasking:** Pulls and executes remediation tasks (SSH scripts, container restarts) defined in Playbooks.

### 3. High-Fidelity Dashboard (`serverpod_sentinel_flutter`)
A modern, real-time management interface built with **Flutter**.
- **Real-time Engine:** Uses **WebSockets** for live metric streaming and incident "War Room" updates.
- **Design System:** Implements a "Fluid-Utility" aesthetic with cinemetic motion and a command palette (CMD+K).
- **State Management:** Unified `SentinelStateView` for consistent loading/error handling.

---

## 🔁 Data & Intelligence Flow

### 1. Telemetry Ingestion & Anomaly Detection
- Agents stream telemetry to the `TelemetryEndpoint`.
- The **Detection Engine** performs real-time **Z-Score analysis** to identify anomalies.
- If a threshold is breached, a **System Alert** is generated.

### 2. AI Root Cause Analysis (RCA)
- When an incident is created, the **Sentinel Brain** correlates:
    - Recent telemetry spikes.
    - Recent **Audit Logs** (e.g., config changes or deployments).
- An LLM (GPT-4o/Gemini) generates a structured RCA report with remediation steps.

### 3. Autonomous Remediation
- The **Self-Healing Service** matches incidents against **Remediation Policies**.
- Matching policies trigger automated **Playbooks**.
- The Agent executes the playbook, and the system verifies the fix, closing the loop.

---

## 🛡️ Hardened Security Model

- **Identity:** TOTP-based Multi-Factor Authentication for all users.
- **Authorization:** Scoped permissions (e.g., `incident_resolve`, `playbook_execute`) instead of flat roles.
- **Communication:** All agent traffic is validated via encrypted `ServiceTokens`.
- **Auditability:** Every system action and user modification is recorded with JSON diffs in the Audit Trail.
