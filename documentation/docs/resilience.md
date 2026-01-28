---
sidebar_position: 6
---

# Resilience & Scalability

Sentinel is built to remain operational even when the infrastructure it monitors is under extreme stress. It uses modern distributed system patterns to ensure high availability and horizontal scaling.

## 🏗️ Horizontal Scaling

### Redis Distributed Layer
Sentinel uses **Redis** as a global coordinator.
- **Session Synchronization:** Ensures users stay logged in across multiple server instances.
- **Real-time Pub/Sub:** WebSocket updates (metrics/alerts) are broadcast via Redis to all connected clients, regardless of which server node they are connected to.
- **Distributed Caching:** Prevents "database thundering herd" scenarios by caching frequently requested service data.

---

## 🛡️ Fault Tolerance

### Circuit Breakers
To prevent slow third-party services (like Slack or Jira) from exhausting server resources, Sentinel implements **Circuit Breakers**.
- **Fail Fast:** If an external API starts failing, the breaker opens, and subsequent requests are rejected immediately with a cached or fallback response.
- **Auto-Recovery:** The system periodically attempts a "half-open" request to see if the service has recovered.

### Distributed Locking
Sentinel uses **PostgreSQL Advisory Locks** to coordinate background maintenance tasks in a cluster.
- **Data Retention:** Jobs like purging old telemetry only run on one server instance at a time.
- **Job Integrity:** Ensures that automated remediations or chaos experiments are not triggered multiple times for the same event.

---

## 🚄 High Performance Caching

- **L1 Cache (In-Memory):** Microsecond-latency access for static system settings and platform configuration.
- **L2 Cache (Global):** Millisecond-latency access via Redis for dynamic service health and real-time aggregates.
- **Cache-Aside Pattern:** Automatically invalidates cached data on updates to ensure consistency.

---

## ☣️ Chaos Engineering
Sentinel includes a built-in **Chaos Engine** to help you test and verify your resilience.
- **Scheduled Faults:** Plan latency injections or process kills during business hours.
- **Experiment Tracking:** Monitor how your automated playbooks and AI insights react to simulated failures.
