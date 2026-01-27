---
sidebar_position: 1
---

# Introduction

**Serverpod Sentinel** is an AI-powered, self-hosted incident management and system monitoring platform built on the robust [Serverpod](https://serverpod.dev) framework.

It provides a unified interface for tracking service health, managing incidents, and automating remediation via intelligent playbooks.

## Key Features

- **Real-time Monitoring**: Track CPU, Memory, and custom health signals across your entire infrastructure.
- **AI-Driven Insights**: Correlate metrics and audit logs to identify root causes automatically.
- **Automated Playbooks**: Execute multi-step remediation scripts (SSH, Webhooks, etc.) with optional approval gates.
- **Incident Lifecycle**: Manage the full lifecycle from detection to resolution with a focus on speed and transparency.
- **Team Collaboration**: Role-based access control (RBAC) to ensure only authorized personnel can trigger critical actions.

## The Sentinel Philosophy

We believe that monitoring should be **active**, not just passive. 

Traditional tools tell you when something is broken. **Sentinel** tells you *why* it's broken and offers the **Playbooks** to fix it instantly. By hosting it yourself, you keep control of your telemetry data and remediation logic.

## Project Structure

Sentinel is composed of four main modules:

1.  **Server**: The backend powerhouse handling logic, data persistence (Postgres), and AI integration.
2.  **Flutter Web UI**: A high-performance, real-time dashboard for operators and admins.
3.  **Client**: The generated protocol layer that enables seamless communication.
4.  **Sentinel Agent**: A lightweight Dart CLI tool that runs on your servers to collect data and execute tasks.
