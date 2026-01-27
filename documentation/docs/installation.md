---
sidebar_position: 2
---

# Installation Guide

Serverpod Sentinel supports both Linux and Windows Server environments.

## Prerequisites

Before starting, ensure you have the following installed:
- **Docker** and **Docker Compose**
- **Git**
- **Node.js LTS** (for the documentation and PM2)

## Automated Setup (Recommended)

We provide automated scripts to handle the installation of SDKs (Dart, Flutter, Node), cloning the repository, building binaries, and configuring the reverse proxy.

### Linux (Ubuntu/Debian/CentOS)

Run the following command as root:

```bash
sudo bash scripts/deployment/setup_linux.sh
```

### Windows Server

Run the following script in PowerShell as Administrator:

```powershell
.\scripts\deployment\setup_windows.ps1
```

## What the Script Does

1.  **Installs SDKs**: Installs Dart, Flutter, and Node.js if missing.
2.  **Infrastructure**: Starts Postgres (with pgvector) and Redis via Docker Compose.
3.  **Builds Binaries**: Compiles the Server and Agent into native executables for maximum performance.
4.  **Process Management**: Sets up PM2 to manage the backend processes and ensures they start on boot.
5.  **Reverse Proxy**: Installs and configures Nginx to serve the Flutter Web UI and Documentation.
6.  **SSL**: Optionally sets up Let's Encrypt certificates.

## Manual Setup

If you prefer a manual setup, follow these steps:

1.  **Clone the Repository**:
    ```bash
    git clone https://github.com/abdisaongithub/serverpod_sentinel.git
    ```
2.  **Start DB**:
    ```bash
    cd serverpod_sentinel/serverpod_sentinel_server
    docker compose up -d
    ```
3.  **Build and Run**:
    Use the `dart compile exe` command to build the server and agent binaries.
