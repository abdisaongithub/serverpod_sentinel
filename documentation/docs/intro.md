---
sidebar_position: 1
---

# Introduction

**Serverpod Sentinel** is an AI-powered, enterprise-grade incident management and system monitoring platform built on the robust [Serverpod](https://serverpod.dev) framework and [Flutter](https://flutter.dev).

It provides a unified interface for tracking service health, managing incidents, and automating remediation via intelligent, self-healing playbooks.

## 🚀 Key Features

- **🛡️ Hardened Security**: Granular RBAC with 25+ distinct permissions, AES-256-GCM encryption at rest for secrets, and TOTP-based Multi-Factor Authentication.
- **🧠 AI-Powered Operations**: Automated Root Cause Analysis (RCA) using GPT-4o or Gemini, correlating telemetry spikes with recent configuration changes in audit logs.
- **🏗️ Resilient Architecture**: Multi-level caching (Local L1 + Redis L2), distributed advisory locks for cluster-aware background jobs, and circuit breakers for external service integrations.
- **⚙️ Autonomous Remediation**: "Closed-loop" self-healing policies that automatically trigger playbooks based on system events, reducing Mean Time to Resolve (MTTR).
- **📊 Interactive Observability**: Real-time streaming metrics via WebSockets with statistical anomaly detection (Z-Score) and Service Level Objective (SLO) tracking.
- **🔌 Extensible Platform**: Scoped API key management and signed outgoing webhooks (HMAC-SHA256) for seamless integration with Slack, Jira, and custom CI/CD pipelines.

## The Sentinel Philosophy

We believe that monitoring should be **active**, not just passive. 

Traditional tools tell you when something is broken. **Sentinel** tells you *why* it's broken and offers the **Playbooks** to fix it instantly. By hosting it yourself on Serverpod, you keep full control of your telemetry data and remediation logic.

## Project Structure

Sentinel is composed of four primary modules:

1.  **Backend (Server)**: The hardened powerhouse handling logic, data persistence (Postgres), AI analysis, and orchestration.
2.  **Dashboard (Flutter)**: A high-fidelity, real-time interface featuring a "Fluid-Utility" design system and a command palette (CMD+K).
3.  **Client (Dart)**: The generated protocol layer enabling type-safe communication between all components.
4.  **Agent (CLI)**: A lightweight monitoring agent that runs on remote infrastructure to ingest signals and execute remote tasks.
