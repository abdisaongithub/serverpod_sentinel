# Serverpod Sentinel - Next Steps & Roadmap

## 1. Current Status (Completed)
We have successfully implemented the core frontend structure and integrated it with the Serverpod backend. Key achievements include:
- **Authentication**: Full login/signup flow using Serverpod Auth.
- **Dashboard**: Live "Activity Feed" powered by `AuditLogEndpoint` and real-time status widgets.
- **Incident Management**: Functional incident tracking, creation (manual dialog), and status updates.
- **Service Registry**: Service listing, filtering by status/tier, and manual service registration.
- **Team Management**: Real-time fetching of team members and roles from the backend.
- **Automation**: Playbook execution UI linked to backend execution stubs.

---

## 2. Phase 1: Telemetry & Agent (High Priority)
The next critical phase is bridging the gap between the UI and real infrastructure.

- [ ] **Sentinel Agent (`sentinel_agent`):**
    - Finalize the Dart CLI agent to collect real system metrics (CPU, RAM, Disk).
    - Implement log file tailing and forwarding to the server.
    - Secure the agent-server communication using API keys.
- [ ] **Data Ingestion:**
    - Update `TelemetryEndpoint` to efficiently store incoming time-series data.
    - Implement data retention policies (e.g., aggregate old data, purge after 30 days).
- [ ] **Visualization:**
    - Replace hardcoded chart data in `EnvironmentSettingsScreen` and `DashboardScreen` with live data streams.
    - Implement the `StreamingEndpoint` to push real-time metric updates to the frontend via websockets.

## 3. Phase 2: Backend Logic Implementation
Currently, several endpoints are returning mock data or stubs. We need to implement the actual logic.

- [ ] **AI Integration (`AiInsightsEndpoint`):**
    - Connect to an LLM provider (e.g., OpenAI, Gemini, or a local model) to process incident logs.
    - Implement RAG (Retrieval-Augmented Generation) to give the AI context about the specific service architecture.
- [ ] **Playbook Runner (`PlaybookEndpoint`):**
    - Implement the actual execution engine. This needs to be a secure, sandboxed environment (e.g., running scripts in isolated Docker containers).
    - Capture stdout/stderr from these scripts and stream them back to the `PlaybookExecutionScreen`.
- [ ] **Notifications (`NotificationEndpoint`):**
    - Integrate with real providers:
        - **Email**: SMTP or SendGrid/AWS SES.
        - **Slack/Discord**: Webhook integration for incident alerts.
        - **Push**: Firebase Cloud Messaging (FCM) for mobile alerts.

## 4. Phase 3: Hardening & Security
Ensure the system is production-ready and secure.

- [ ] **RBAC Enforcement:**
    - Audit all endpoints to ensure `SessionManager.signedInUser` has the correct scopes/permissions before performing sensitive actions (like `delete` or `execute`).
    - Enforce "Viewer" vs "Admin" vs "Operator" roles strictly on the backend.
- [ ] **Input Validation:**
    - Add robust server-side validation for all "Create" dialogs (Service name formats, Incident payloads).
- [ ] **Audit Logging:**
    - Ensure *every* state-changing action (create, update, delete, execute) generates an `AuditLog` entry (we have covered many, but need 100% coverage).

## 5. Phase 4: Deployment & DevOps
Preparing the platform for self-hosting.

- [ ] **Dockerization:**
    - Create/Update `Dockerfile` for the Serverpod server.
    - Create a `docker-compose.yml` that spins up Postgres, Redis (for caching), and the Serverpod server together.
- [ ] **Web Client Build:**
    - Configure the Flutter web build process and nginx/apache serving for the frontend.
- [ ] **CI/CD:**
    - Setup GitHub Actions to run tests (`flutter test`) and linting on every PR.
