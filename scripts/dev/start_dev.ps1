# Serverpod Sentinel - Development Start Script (Windows)
# This script starts the full stack in development mode.

$ProjectRoot = Get-Location

# 0. Kill existing processes on standard ports (8080, 8081, 8082, 3000)
$Ports = @(8080, 8081, 8082, 3000)
Write-Host ">>> Checking for existing processes on ports $($Ports -join ', ')..." -ForegroundColor Yellow

foreach ($Port in $Ports) {
    $Connection = Get-NetTCPConnection -LocalPort $Port -ErrorAction SilentlyContinue
    if ($Connection) {
        $TargetPid = $Connection.OwningProcess | Select-Object -Unique
        Write-Host "Killing process $TargetPid running on port $Port" -ForegroundColor Red
        Stop-Process -Id $TargetPid -Force -ErrorAction SilentlyContinue
    }
}

# 1. Start Docker Dependencies (Postgres & Redis)
Write-Host ">>> Checking Docker status..." -ForegroundColor Cyan
docker info > $null 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Docker is not running or unreachable. Please start Docker Desktop." -ForegroundColor Red
    exit 1
}

Write-Host ">>> Starting Docker containers..." -ForegroundColor Cyan
Set-Location "$ProjectRoot\serverpod_sentinel_server"
docker compose up -d

# 2. Run Serverpod Generate
Write-Host ">>> Regenerating Serverpod code..." -ForegroundColor Cyan
# Using the full path to serverpod.bat if possible, or assuming it's in path
$ServerpodPath = "$env:LOCALAPPDATA\Pub\Cache\bin\serverpod.bat"
if (Test-Path $ServerpodPath) {
    & $ServerpodPath generate
} else {
    serverpod generate
}

# 3. Start Serverpod Server
Write-Host ">>> Launching Serverpod Server in a new window..." -ForegroundColor Green
Start-Process powershell -ArgumentList "-NoExit", "-Command", "Set-Location '$ProjectRoot\serverpod_sentinel_server'; dart run bin/main.dart --apply-migrations" -WindowStyle Normal

# 4. Start Sentinel Agent
Write-Host ">>> Launching Sentinel Agent in a new window..." -ForegroundColor Green
Start-Process powershell -ArgumentList "-NoExit", "-Command", "Set-Location '$ProjectRoot\sentinel_agent'; dart run bin/main.dart" -WindowStyle Normal

# 5. Start Documentation Server
Write-Host ">>> Launching Documentation Server in a new window..." -ForegroundColor Green
Start-Process powershell -ArgumentList "-NoExit", "-Command", "Set-Location '$ProjectRoot\documentation'; npm run start" -WindowStyle Normal

# 6. Start Flutter Web App
Write-Host ">>> Launching Flutter Web App..." -ForegroundColor Cyan
Set-Location "$ProjectRoot\serverpod_sentinel_flutter"
flutter run -d chrome

Set-Location $ProjectRoot
