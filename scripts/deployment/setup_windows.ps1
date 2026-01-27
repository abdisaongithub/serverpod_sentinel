<#
.SYNOPSIS
    Serverpod Sentinel - Production Setup Script (Windows Server)
.DESCRIPTION
    Automates the setup of Docker, Git, Project Cloning, and Nginx for Windows deployment.
    Requires PowerShell 5.1 or newer. Run as Administrator.
#>

$RepoUrl = "https://github.com/abdisaongithub/serverpod_sentinel.git"
$ProjectDir = "C:\serverpod_sentinel"
$DockerComposeFile = "docker-compose.production.yaml"

# Helper Function for Logging
function Write-Log {
    param([string]$Message, [string]$Level = "INFO")
    $Color = switch ($Level) {
        "INFO" { "Green" }
        "WARN" { "Yellow" }
        "ERROR" { "Red" }
        Default { "White" }
    }
    Write-Host "[$Level] $Message" -ForegroundColor $Color
}

# 1. Check Administrator Privileges
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Log "This script must be run as Administrator." "ERROR"
    exit 1
}

# 2. Install Chocolatey (Package Manager)
if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Log "Installing Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    # Reload env vars
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
} else {
    Write-Log "Chocolatey is already installed."
}

# 3. Install Dependencies (Git, Docker)
if (!(Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Log "Installing Git..."
    choco install git -y
}

# 3.2 Install Dart & Flutter SDKs
if (!(Get-Command dart -ErrorAction SilentlyContinue)) {
    Write-Log "Installing Dart SDK..."
    choco install dart-sdk -y
}

if (!(Get-Command flutter -ErrorAction SilentlyContinue)) {
    Write-Log "Installing Flutter SDK..."
    choco install flutter -y
}

if (!(Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Log "Installing Docker Desktop (Standard for Dev/Small deployments)..."
    # Note: On actual Windows Server 2019/2022, you might prefer Docker MsftProvider, but Choco Docker Desktop is easier for hybrid setup.
    # For Production Server Core, use: Install-Module -Name DockerMsftProvider -Repository PSGallery -Force
    choco install docker-desktop -y
    Write-Log "Docker installed. You may need to restart the server and run this script again." "WARN"
}

# 3.5 Install Node.js LTS via NVM & PM2
if (!(Get-Command nvm -ErrorAction SilentlyContinue)) {
    Write-Log "Installing NVM for Windows..."
    choco install nvm -y
    # Reload env vars
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

Write-Log "Installing Node.js LTS..."
nvm install lts
nvm use lts

if (!(Get-Command pm2 -ErrorAction SilentlyContinue)) {
    Write-Log "Installing PM2..."
    npm install -g pm2
    Write-Log "Installing PM2 Windows Startup support..."
    npm install -g pm2-windows-startup
    pm2-startup install
}

function Setup-PM2Ecosystem {
    Write-Log "Creating PM2 ecosystem file..."
    $EcosystemContent = @"
module.exports = {
  apps: [
    {
      name: 'serverpod_sentinel_server',
      cwd: './serverpod_sentinel_server',
      script: './bin/server.exe',
      args: '--apply-migrations --mode production',
      env: {
        NODE_ENV: 'production',
      },
      restart_delay: 3000,
      max_restarts: 10,
    },
    {
      name: 'sentinel_agent',
      cwd: './sentinel_agent',
      script: './bin/agent.exe',
      args: '',
      env: {
        NODE_ENV: 'production',
      },
      restart_delay: 5000,
    },
    {
      name: 'sentinel_docs',
      script: 'npm',
      args: 'run serve -- --port 3000',
      cwd: './documentation',
      env: {
        NODE_ENV: 'production',
      }
    }
  ],
};
"@
    Set-Content -Path "ecosystem.config.js" -Value $EcosystemContent
}

function Build-Project {
    Write-Log "Building project binaries..."
    
    # Client
    Set-Location "$ProjectDir\serverpod_sentinel_client"
    dart pub get

    # Server
    Set-Location "$ProjectDir\serverpod_sentinel_server"
    dart pub get
    if (!(Test-Path bin)) { New-Item -ItemType Directory -Path bin }
    dart compile exe bin/main.dart -o bin/server.exe

    # Agent
    Set-Location "$ProjectDir\sentinel_agent"
    dart pub get
    if (!(Test-Path bin)) { New-Item -ItemType Directory -Path bin }
    dart compile exe bin/main.dart -o bin/agent.exe

    # Flutter Web
    Set-Location "$ProjectDir\serverpod_sentinel_flutter"
    flutter pub get
    flutter build web --release --base-href /
    
    # Documentation
    Set-Location "$ProjectDir\documentation"
    npm install
    npm run build

    Set-Location $ProjectDir
}

# 4. Web Server Selection
$choice = Read-Host "Select Web Server: 1) Nginx (Windows Port) 2) Skip (I'll handle IIS/Other manually)"
if ($choice -eq "1") {
    if (!(Get-Command nginx -ErrorAction SilentlyContinue)) {
        Write-Log "Installing Nginx..."
        choco install nginx -y
        
        $Domain = Read-Host "Enter Domain Name (e.g. localhost or api.example.com)"
        
        # Configure Nginx
        $NginxConf = "C:\tools\nginx\conf\nginx.conf"
        if (Test-Path $NginxConf) {
            $ConfigContent = @"
worker_processes  1;
events {
    worker_connections  1024;
}
http {
    include       mime.types;
    default_type  application/octet-stream;
    sendfile        on;
    keepalive_timeout  65;

    server {
        listen       80;
        server_name  $Domain;

        location / {
            proxy_pass http://127.0.0.1:8080;
            proxy_http_version 1.1;
            proxy_set_header Upgrade `$http_upgrade;
            proxy_set_header Connection "upgrade";
            proxy_set_header Host `$host;
        }

        location /docs {
            alias $ProjectDir\documentation\build;
            index index.html;
            try_files `$uri `$uri/ /docs/index.html;
        }
    }
}
"@
            Set-Content -Path $NginxConf -Value $ConfigContent
            Write-Log "Nginx configured. Starting service..."
            # Nginx on windows via choco often doesn't install a service by default, running directly for demo
            Start-Process "C:\tools\nginx\nginx.exe"
        }
    }
}

# 5. Clone Project
if (Test-Path $ProjectDir) {
    Write-Log "Project directory exists. Pulling latest..."
    Set-Location $ProjectDir
    git pull
} else {
    Write-Log "Cloning project..."
    git clone $RepoUrl $ProjectDir
    Set-Location $ProjectDir
}

Build-Project
Setup-PM2Ecosystem

# 6. Deploy
Write-Log "Starting infrastructure..."
docker compose up -d postgres redis

Write-Log "Starting PM2 processes..."
pm2 start ecosystem.config.js
pm2 save

Write-Log "Deployment complete. Check status with 'pm2 status'" "INFO"
