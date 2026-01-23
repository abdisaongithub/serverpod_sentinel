# Sentinel Monitoring Agent

A standalone Dart CLI application that collects system health metrics and pushes them to the Serverpod Sentinel backend in real-time.

## Features
- **Real-time Metrics:** Collects CPU load, Memory usage, and Disk status.
- **Heartbeats:** Sends periodic heartbeats to let the dashboard know the service is alive.
- **Auto-Ingestion:** Uses the Serverpod `Telemetry` endpoint to store and broadcast data.

## Requirements
- Dart SDK 3.0+
- Access to the `serverpod_sentinel_server` (running on localhost:8080 by default).

## Installation

1. Navigate to the agent directory:
   ```bash
   cd sentinel_agent
   ```
2. Install dependencies:
   ```bash
   dart pub get
   ```

## Running the Agent

Start the agent with:
```bash
dart bin/main.dart
```

## Configuration
Open `bin/main.dart` to configure:
- `serverUrl`: The address of your Serverpod server.
- `serviceId`: The ID of the service this agent is monitoring (must exist in the database).
- `interval`: How often to send data (default: 5 seconds).
