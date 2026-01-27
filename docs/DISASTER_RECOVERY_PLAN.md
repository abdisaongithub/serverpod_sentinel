# Disaster Recovery & Resilience Plan (Phase 2)

This document outlines the procedures for ensuring the Sentinel platform's availability and data integrity in the event of major infrastructure failures.

## 1. Multi-AZ Deployment Strategy
- **Application Layer:** Serverpod instances should be deployed across at least 3 Availability Zones (AZs) using a container orchestrator (e.g., Kubernetes EKS/GKE).
- **Load Balancing:** Use a Global Accelerator or Route53 Latency-based routing to distribute traffic.
- **Health Checks:** `/health` and `/sentinel_health/ping` endpoints must be used by the load balancer for automated target deregistration.

## 2. Database Resilience (PostgreSQL)
- **Primary-Standby:** Deploy a Primary instance with synchronous standby in a secondary AZ.
- **Read Replicas:** Scale horizontally using at least 2 read replicas for heavy analytical queries (reports, dashboard aggregates).
- **Point-in-Time Recovery (PITR):** 
    - Daily full snapshots.
    - WAL (Write Ahead Log) archiving every 5 minutes to S3/GCS.
    - Retention: 35 days.

## 3. Distributed Cache Resilience (Redis)
- **Cluster Mode:** Deploy Redis in Cluster Mode with at least 3 primary nodes and 3 replicas.
- **Eviction Policy:** `allkeys-lru` to ensure the most recent telemetry remains available during memory pressure.

## 4. Backup & Restoration Procedures
### Automated Backups
- Database: Automated via RDS/CloudSQL.
- Configuration: Terraform state and `passwords.yaml` (encrypted in Secret Manager).

### Recovery Steps
1. **Zonal Failure:** Automatic failover of Load Balancer and Kubernetes nodes.
2. **Regional Failure:** 
    - Trigger Terraform apply in the DR region.
    - Restore latest RDS snapshot (Target RTO: 2 hours).
    - Update DNS CNAME to the new regional load balancer.

## 5. Circuit Breaker Configuration
- **External APIs:** Threshold set to 5 failures / 1 minute.
- **Fallbacks:** 
    - Slack Down -> Log to internal audit trail.
    - AI API Down -> Return "RCA Unavailable" instead of 500 error.
