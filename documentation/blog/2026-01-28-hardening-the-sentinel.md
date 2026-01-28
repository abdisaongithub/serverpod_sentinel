---
slug: hardening-the-sentinel
title: Hardening the Sentinel backend for Enterprise scale
authors: [abdisa]
tags: [security, architecture, backend]
---

Today we are excited to share the details of our Phase 1 and 2 hardening of the Serverpod Sentinel backend. We've moved beyond simple role-based access control to a fully granular, permission-scoped model.

<!-- truncate -->

## Key Security Enhancements

### 1. Granular RBAC
We've implemented over 25 distinct permissions that can be mapped to custom roles. This ensures that a Viewer can see metrics without having the ability to trigger a destructive Playbook.

### 2. AES-256-GCM Encryption
All integration secrets (Slack tokens, PagerDuty keys) are now encrypted at rest. We use the high-performance AES-GCM algorithm with 256-bit keys, managed via a master key that never leaves your environment.

### 3. Distributed Resilience
With the introduction of Redis-backed L2 caching and PostgreSQL advisory locks, Sentinel can now scale horizontally across multiple availability zones while maintaining absolute data integrity for background jobs.

Stay tuned for our upcoming post on AI-driven Root Cause Analysis!
