---
slug: autonomous-remediation-v1
title: Closing the loop with Autonomous Remediation
authors: [abdisa]
tags: [ai, automation, sre]
---

Mean Time To Resolve (MTTR) is the most critical metric for any SRE team. Today, we are unveiling our "Closed-Loop" self-healing engine.

<!-- truncate -->

## How it Works

Sentinel doesn't just alert you when a service is down. By combining statistical anomaly detection with our new Remediation Policies, the platform can now take action automatically.

1. **Detection**: Z-Score analysis detects a latency spike.
2. **Analysis**: The AI Brain correlates the spike with a recent config change in the Audit Log.
3. **Execution**: A matching Policy triggers a "Rollback" Playbook.
4. **Verification**: The Agent verifies the rollback restored service health.

This entire process happens in milliseconds, often resolving issues before your customers even notice.

Check out the [Intelligence Documentation](/docs/intelligence) for more details.
