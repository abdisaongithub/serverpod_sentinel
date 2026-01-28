---
sidebar_position: 7
---

# UI & Design System

The Sentinel Dashboard is designed for high-performance operations. It balances extreme data density with a modern, high-fidelity user experience.

## 🎨 The "Fluid-Utility" Aesthetic

Sentinel uses a custom design system that prioritizes clarity and speed without sacrificing modernity.

### Typography & Hierarchy
- **Manrope:** Used for high-impact headlines and metrics.
- **Inter:** Optimized for readability in high-density data tables and logs.

### Visual Cues
- **Status Pulsars:** Real-time health is indicated by animated, glowing neon pulsars. A pulsing red glow instantly draws attention to critical outages.
- **Elevation System:** A 4-tier shadow and translucency system (using `BackdropFilter`) creates a clear layer hierarchy, separating controls from content.

---

## ⚡ Unified State Handling

Sentinel implements a standardized way of managing data loading and errors via the `SentinelStateView` architecture.
- **Skeleton Shimmers:** Every screen uses layout-aware shimmers during data fetching to provide an immediate "perceived speed" boost.
- **Graceful Errors:** Standardized error views with automatic retry logic for network and websocket failures.
- **Connectivity Awareness:** A non-intrusive banner appears when the user is offline, and the system automatically resumes streaming when the connection is restored.

---

## 🛠️ Command Center UX

### Spotlight Search (CMD+K)
The "Sentinel Spotlight" provides instant access to the entire platform.
- **Global Navigation:** Jump to any service or incident by typing its name.
- **Keyboard Friendly:** Designed to allow SREs to navigate the entire app without leaving the keyboard.

### Collapsible Shell
- **Dynamic Real Estate:** The sidebar can be collapsed into a "Thin" mode (icons only) with a fluid animation, maximizing the space available for complex metric charts and incident timelines.
- **War Room Layout:** The incident detail screen uses a connected vertical timeline, providing a clear narrative of how an incident progressed from detection to fix.
