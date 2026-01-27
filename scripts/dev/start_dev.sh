#!/bin/bash

# Serverpod Sentinel - Development Start Script (Linux/Bash)
# This script starts the full stack in development mode.

PROJECT_ROOT=$(pwd)

# Colors
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 0. Kill existing processes on standard ports (8080, 8081, 8082, 3000)
PORTS=(8080 8081 8082 3000)
echo -e "${YELLOW}>>> Checking for existing processes on ports ${PORTS[*]}...${NC}"

for port in "${PORTS[@]}"; do
    PID=$(lsof -ti:"$port")
    if [ -n "$PID" ]; then
        echo -e "${RED}Killing process $PID running on port $port${NC}"
        kill -9 $PID
    fi
done

echo -e "${CYAN}>>> Starting Docker containers...${NC}"
cd "$PROJECT_ROOT/serverpod_sentinel_server"
docker compose up -d

echo -e "${CYAN}>>> Regenerating Serverpod code...${NC}"
# Assuming serverpod is in PATH
serverpod generate

echo -e "${GREEN}>>> Starting Serverpod Server in background...${NC}"
cd "$PROJECT_ROOT/serverpod_sentinel_server"
dart run bin/main.dart --apply-migrations &
SERVER_PID=$!

echo -e "${GREEN}>>> Starting Sentinel Agent in background...${NC}"
cd "$PROJECT_ROOT/sentinel_agent"
dart run bin/main.dart &
AGENT_PID=$!

echo -e "${GREEN}>>> Starting Documentation Server in background...${NC}"
cd "$PROJECT_ROOT/documentation"
npm run start &
DOCS_PID=$!

echo -e "${CYAN}>>> Starting Flutter Web App...${NC}"
cd "$PROJECT_ROOT/serverpod_sentinel_flutter"
flutter run -d chrome

# Cleanup background processes on exit
trap "kill $SERVER_PID $AGENT_PID $DOCS_PID; exit" INT TERM
wait
