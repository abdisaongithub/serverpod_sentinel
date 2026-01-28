# Serverpod Sentinel

**Serverpod Sentinel** is an enterprise-grade monitoring and incident management platform. It provides real-time observability, AI-powered root cause analysis, and autonomous remediation for complex distributed systems.

Built with **Serverpod** (Backend) and **Flutter** (Frontend), Sentinel is designed for high-scale, high-security engineering environments.

---

## 🚀 Key Features

- **🛡️ Enterprise Security:** Granular RBAC (25+ permissions), AES-256-GCM encryption at rest, and TOTP-based Multi-Factor Authentication (MFA).
- **🧠 AI-Powered Operations:** Automated Root Cause Analysis (RCA) using LLMs (GPT-4o/Gemini) and statistical anomaly detection (Z-Score).
- **🏗️ Resilient Infrastructure:** Multi-level caching (In-memory L1 + Redis L2), Distributed Advisory Locks, and Circuit Breakers for external integrations.
- **⚙️ Autonomous Remediation:** "Closed-loop" self-healing policies that automatically trigger playbooks based on system events.
- **🌐 Global Reach:** Multi-region aware monitoring with support for regional data pinning and compliance.
- **🔌 Extensible Ecosystem:** Scoped API keys, signed webhooks (HMAC-SHA256), and a foundation for third-party marketplace plugins.

---

## 📖 Documentation

The project documentation is organized into three main sections:

### 1. [Technical Roadmap & Plans](./docs/)
- [Production Roadmap](./docs/PRODUCTION_ROADMAP.md) - The 5-phase journey to enterprise readiness.
- [Disaster Recovery Plan](./docs/DISASTER_RECOVERY_PLAN.md) - Procedures for high availability and failover.
- [Security Model](./docs/PHASE_1_SECURITY_IDENTITY_COMPLIANCE.md) - Details on RBAC and Encryption implementation.

### 2. [Live Progress Tracking](./PROGRESS.md)
Check the [Progress Report](./PROGRESS.md) for the latest implementation status of all backend and frontend features.

### 3. [Docusaurus Documentation Site](./documentation/)
Comprehensive architecture diagrams, installation guides, and API references are available in the `/documentation` directory. To run locally:
```bash
cd documentation
npm install
npm run start
```

---

## 🛠️ Project Structure

- `serverpod_sentinel_server/`: The Serverpod backend (Hardened & Scalable).
- `serverpod_sentinel_client/`: The generated Dart client package.
- `serverpod_sentinel_flutter/`: The Flutter frontend (Modernized Fluid-Utility UI).
- `sentinel_agent/`: The lightweight monitoring agent for remote services.
- `scripts/`: Utility scripts for database seeding and deployment.

---

## 🚦 Getting Started

### Prerequisites
- Flutter SDK (Latest Stable)
- Dart SDK
- Docker (for PostgreSQL and Redis)
- Serverpod CLI

### Local Setup
1. **Start the Database:**
   ```bash
   docker-compose up -d
   ```
2. **Initialize the Backend:**
   ```bash
   cd serverpod_sentinel_server
   dart pub get
   # Seed roles and admin user
   dart bin/seed_data.dart --config development
   # Start the server
   dart bin/main.dart --config development
   ```
3. **Run the Flutter Dashboard:**
   ```bash
   cd serverpod_sentinel_flutter
   flutter pub get
   flutter run -d chrome # Or your preferred device
   ```

---

## 🛡️ Security Note
Serverpod Sentinel enforces strict security defaults. Ensure you rotate the `masterEncryptionKey` in `config/passwords.yaml` before deploying to a production environment.

---

## 🤝 Contributing
Please review the [Production Roadmap](./docs/PRODUCTION_ROADMAP.md) before submitting pull requests.

Built with ❤️ by the Serverpod Sentinel Team.
