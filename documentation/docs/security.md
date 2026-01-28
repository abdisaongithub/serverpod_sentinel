---
sidebar_position: 4
---

# Security & Compliance

Serverpod Sentinel is engineered for highly regulated and secure engineering environments. It implements a multi-layered security strategy to protect your infrastructure and telemetry data.

## 🛡️ Identity & Access Management (IAM)

### Granular RBAC (25+ Permissions)
Sentinel uses a sophisticated permission-based access control system. Instead of broad roles, every action is governed by specific scopes.
- **Service Management:** `service_create`, `service_edit`, `service_manage_rules`.
- **Incident Control:** `incident_acknowledge`, `incident_resolve`, `incident_manage_timeline`.
- **Automation:** `playbook_execute`, `playbook_manage`.

### Multi-Factor Authentication (MFA)
- **TOTP Support:** Built-in support for Google Authenticator, Authy, and other standard TOTP apps.
- **Encrypted Secrets:** MFA secrets are never stored in plain text; they are encrypted at rest using AES-256.

---

## 🔐 Data Security

### Encryption at Rest (AES-256-GCM)
Sensitive platform data is automatically encrypted before hitting the database using the `EncryptionService`.
- **Integration Secrets:** API keys for Slack, PagerDuty, and other providers are always encrypted.
- **Playbook Variables:** Sensitive environment variables used in automation are protected.

### Redaction Logic
The Sentinel UI automatically redacts sensitive configuration in list views and audit logs to prevent accidental shoulder-surfing or credential leakage in screenshots.

---

## 📋 Audit & Compliance

### Immutable Audit Trail
Every critical action on the platform is logged to an append-only table.
- **Actor Identification:** Tracks which user or API key initiated the action.
- **IP Tracking:** Records the source IP address of the requester.
- **Change Sets:** Stores structured JSON "diffs" (Before/After) for every update.

### Compliance Reporting
Sentinel can generate real-time **Security & Compliance Reports** that audit:
- MFA adoption rates across the team.
- RBAC configuration health.
- Audit log integrity and recent activity.

---

## 📡 Network Security

### Scoped API Keys
- **Dual Security Model:** Platform API keys are stored as SHA-256 hashes for lookup and AES-256 encrypted for management.
- **Least Privilege:** Keys can be scoped to specific permissions (e.g., a "CI/CD Key" might only have `service_edit` permission).

### Agent Authentication
Sentinel Agents use strictly validated `ServiceTokens`. These tokens are short-lived or revocable, ensuring that a compromised agent cannot gain unauthorized access to the broader platform.
