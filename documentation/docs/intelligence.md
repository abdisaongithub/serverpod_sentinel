---
sidebar_position: 5
---

# Intelligent Operations

Serverpod Sentinel leverages artificial intelligence and statistical analysis to move your SRE team from reactive firefighting to proactive management.

## 🧠 AI-Powered Analysis

### Automated Root Cause Analysis (RCA)
When an incident is detected, the **Sentinel Brain** (AI Service) automatically performs a deep investigation.
- **Context Gathering:** It pulls relevant metrics from the last 2 hours and correlates them with the latest entries in the **Audit Log**.
- **Change Awareness:** The AI specifically looks for configuration changes or deployments that coincide with metric spikes.
- **Actionable Report:** Instead of a generic alert, you receive a structured JSON report detailing the probable root cause, contributing factors, and prioritized remediation steps.

### Anomaly Detection (Z-Score)
Sentinel doesn't just wait for static threshold breaches. The **Detection Engine** uses real-time statistical modeling:
- **Z-Score Calculation:** It monitors the "standard deviation" of metric streams.
- **Early Warning:** If a metric (like Latency or CPU) deviates significantly from its historical mean, an AI Insight is generated *before* an actual outage occurs.

---

## 📊 Reliability & SLOs

### Service Level Objectives (SLOs)
Define and track the reliability targets that matter most to your business.
- **Availability SLI:** Automatically calculated based on healthy metric points over a rolling 30-day window.
- **Error Budgeting:** Real-time tracking of remaining error budgets. Sentinel will warn you when your team is at risk of violating an SLA.

---

## ⚙️ Autonomous Remediation

### "Closed-Loop" Self-Healing
Reduce MTTR to milliseconds with automated response policies.
- **Event Matching:** Create policies that link specific system events (e.g., `major_outage`) to **Playbooks**.
- **Auto-Execution:** For critical infrastructure, enable `autoExecute` to let Sentinel fix known issues (like service restarts or cache clears) without human intervention.
- **Verification:** After execution, the system monitors the metrics to ensure the fix was successful, logging everything to the incident timeline.
