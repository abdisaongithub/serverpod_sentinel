#!/bin/bash

# Serverpod Sentinel - Production Setup Script (Linux)
# Supports Ubuntu/Debian and CentOS/RHEL

set -e

# Configuration
REPO_URL="https://github.com/abdisaongithub/serverpod_sentinel.git"
PROJECT_DIR="serverpod_sentinel"
DOCKER_COMPOSE_FILE="docker-compose.production.yaml"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# 1. Check OS
log_info "Checking Operating System..."
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
    log_info "Detected OS: $OS $VER"
else
    log_error "Unsupported OS. Could not detect /etc/os-release."
    exit 1
fi

# 2. Check Prerequisites (Root)
if [[ $EUID -ne 0 ]]; then
   log_error "This script must be run as root."
   exit 1
fi

# 3. Install Docker & Docker Compose
install_docker() {
    log_info "Installing Docker..."
    if command -v docker &> /dev/null; then
        log_info "Docker is already installed."
    else
        curl -fsSL https://get.docker.com -o get-docker.sh
        sh get-docker.sh
        rm get-docker.sh
        log_info "Docker installed successfully."
    fi

    # Enable Docker service
    systemctl enable docker
    systemctl start docker
}

install_git() {
    log_info "Checking Git..."
    if command -v git &> /dev/null; then
        log_info "Git is already installed."
    else
        log_info "Installing Git..."
        if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
            apt-get update && apt-get install -y git curl wget unzip
        elif [[ "$ID" == "centos" || "$ID" == "rhel" || "$ID" == "fedora" ]]; then
            yum install -y git curl wget unzip
        else
            log_warn "Could not determine package manager. Please install Git manually."
        fi
    fi
}

# 3.2 Install Dart & Flutter SDKs
install_dart_flutter() {
    log_info "Installing Dart & Flutter SDKs..."
    
    # Install Dart
    if command -v dart &> /dev/null; then
        log_info "Dart is already installed."
    else
        log_info "Downloading Dart SDK..."
        wget https://storage.googleapis.com/dart-archive/channels/stable/release/latest/sdk/dartsdk-linux-x64-release.zip -O /tmp/dart-sdk.zip
        unzip -q /tmp/dart-sdk.zip -d /opt
        rm /tmp/dart-sdk.zip
        ln -sf /opt/dart-sdk/bin/dart /usr/local/bin/dart
    fi

    # Install Flutter
    if command -v flutter &> /dev/null; then
        log_info "Flutter is already installed."
    else
        log_info "Downloading Flutter SDK..."
        wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.27.1-stable.tar.xz -O /tmp/flutter.tar.xz
        tar xf /tmp/flutter.tar.xz -C /opt
        rm /tmp/flutter.tar.xz
        ln -sf /opt/flutter/bin/flutter /usr/local/bin/flutter
        # Fix permissions for the shared opt folder
        chmod -R 777 /opt/flutter
    fi
    
    log_info "Dart version: $(dart --version)"
    log_info "Flutter version: $(flutter --version)"
}

# 3.5 Install Node.js LTS via NVM & PM2
install_node_pm2() {
    log_info "Installing Node.js LTS via NVM..."
    
    # NVM installation
    if [ ! -d "$HOME/.nvm" ]; then
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    fi
    
    # Load NVM
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    
    nvm install --lts
    nvm use --lts
    
    log_info "Node.js version: $(node -v)"
    
    log_info "Installing PM2 globally..."
    npm install -g pm2
    
    log_info "Configuring PM2 startup..."
    pm2 startup | tail -n 1 | bash
}

setup_pm2_ecosystem() {
    log_info "Creating PM2 ecosystem file..."
    cat > ecosystem.config.js <<EOF
module.exports = {
  apps: [
    {
      name: 'serverpod_sentinel_server',
      cwd: './serverpod_sentinel_server',
      script: './bin/server',
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
      script: './bin/agent',
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
EOF
}

build_project() {
    log_info "Building project binaries and web assets..."
    
    # Client
    log_info "Building Client..."
    cd serverpod_sentinel_client
    dart pub get
    cd ..

    # Server
    log_info "Building Server..."
    cd serverpod_sentinel_server
    dart pub get
    mkdir -p bin
    dart compile exe bin/main.dart -o bin/server
    cd ..

    # Agent
    log_info "Building Agent..."
    cd sentinel_agent
    dart pub get
    mkdir -p bin
    dart compile exe bin/main.dart -o bin/agent
    cd ..

    # Flutter Web
    log_info "Building Flutter Web UI..."
    cd serverpod_sentinel_flutter
    flutter pub get
    flutter build web --release --base-href /
    
    # Move web build to server's web folder
    mkdir -p ../serverpod_sentinel_server/web
    cp -R build/web/* ../serverpod_sentinel_server/web/
    cd ..

    # Documentation (Docusaurus)
    log_info "Building Documentation..."
    cd documentation
    npm install
    npm run build
    cd ..
}

# 4. Web Server Selection & Installation
setup_webserver() {
    echo ""
    echo "------------------------------------------------"
    echo "Select a Web Server to act as Reverse Proxy:"
    echo "1) Nginx (Recommended)"
    echo "2) Apache"
    echo "3) Skip Web Server Setup (I will handle it myself)"
    echo "------------------------------------------------"
    read -p "Enter choice [1-3]: " webserver_choice

    case $webserver_choice in
        1)
            setup_nginx
            ;;
        2)
            setup_apache
            ;;
        3)
            log_info "Skipping web server setup."
            ;;
        *)
            log_error "Invalid choice. Skipping web server setup."
            ;;
    esac
}

setup_nginx() {
    log_info "Installing Nginx..."
    if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
        apt-get install -y nginx certbot python3-certbot-nginx
    elif [[ "$ID" == "centos" || "$ID" == "rhel" ]]; then
        yum install -y nginx certbot python3-certbot-nginx
    fi

    read -p "Enter Domain Name (e.g., api.example.com): " domain_name

    # Create Nginx Config
    cat > /etc/nginx/sites-available/$domain_name <<EOF
server {
    listen 80;
    server_name $domain_name;

    # Main application (Proxy to Serverpod)
    location / {
        proxy_pass http://localhost:8080;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    }

    # Documentation (Static Files)
    location /docs {
        alias $(pwd)/documentation/build;
        index index.html;
        try_files \$uri \$uri/ /docs/index.html;
    }

    # Web Serverpod (Insight/Web)
    location /web {
        proxy_pass http://localhost:8082;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
    }
}
EOF

    # Enable site (Debian/Ubuntu specific structure, adjust for RHEL if needed)
    if [ -d /etc/nginx/sites-enabled ]; then
        ln -sf /etc/nginx/sites-available/$domain_name /etc/nginx/sites-enabled/
        rm -f /etc/nginx/sites-enabled/default
    else
        # RHEL/CentOS often uses conf.d
        mv /etc/nginx/sites-available/$domain_name /etc/nginx/conf.d/$domain_name.conf
    fi

    log_info "Testing Nginx configuration..."
    nginx -t

    log_info "Reloading Nginx..."
    systemctl reload nginx

    # SSL Setup
    echo ""
    read -p "Do you want to setup SSL with Let's Encrypt? (y/n): " setup_ssl
    if [[ "$setup_ssl" == "y" || "$setup_ssl" == "Y" ]]; then
        certbot --nginx -d $domain_name
    fi
}

setup_apache() {
    log_info "Installing Apache..."
    if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
        apt-get install -y apache2 certbot python3-certbot-apache
        a2enmod proxy
        a2enmod proxy_http
        a2enmod proxy_wstunnel
    elif [[ "$ID" == "centos" || "$ID" == "rhel" ]]; then
        yum install -y httpd certbot python3-certbot-apache
    fi

    read -p "Enter Domain Name (e.g., api.example.com): " domain_name

    # Create Apache Config
    cat > /etc/apache2/sites-available/$domain_name.conf <<EOF
<VirtualHost *:80>
    ServerName $domain_name

    ProxyPreserveHost On
    ProxyPass / http://localhost:8080/
    ProxyPassReverse / http://localhost:8080/

    # WebSocket Support
    RewriteEngine on
    RewriteCond %{HTTP:Upgrade} websocket [NC]
    RewriteCond %{HTTP:Connection} upgrade [NC]
    RewriteRule ^/?(.*) "ws://localhost:8080/\$1" [P,L]
</VirtualHost>
EOF

    if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
        a2ensite $domain_name.conf
        systemctl reload apache2
    else
        # CentOS config location might vary
        cp /etc/apache2/sites-available/$domain_name.conf /etc/httpd/conf.d/
        systemctl restart httpd
    fi

    # SSL Setup
    echo ""
    read -p "Do you want to setup SSL with Let's Encrypt? (y/n): " setup_ssl
    if [[ "$setup_ssl" == "y" || "$setup_ssl" == "Y" ]]; then
        certbot --apache -d $domain_name
    fi
}

# 5. Clone Project
setup_project() {
    if [ -d "$PROJECT_DIR" ]; then
        log_info "Project directory '$PROJECT_DIR' already exists. Pulling latest changes..."
        cd "$PROJECT_DIR"
        git pull
    else
        log_info "Cloning project from $REPO_URL..."
        git clone "$REPO_URL" "$PROJECT_DIR"
        cd "$PROJECT_DIR"
    fi
}

# 6. Deploy
deploy() {
    log_info "Starting infrastructure via Docker Compose..."
    
    # We only need Postgres and Redis from Docker now
    # We'll create a minimal compose file if it doesn't exist or use the existing one
    # Note: For production, users might want to remove the 'server' block from the yaml
    docker compose -f "$DOCKER_COMPOSE_FILE" up -d postgres redis
    
    log_info "Starting PM2 processes..."
    pm2 start ecosystem.config.js
    pm2 save
    
    log_info "Deployment started successfully!"
    log_info "Check status with: pm2 status"
}

# --- Main Execution ---
install_docker
install_git
install_dart_flutter
install_node_pm2
setup_project
build_project
setup_pm2_ecosystem
setup_webserver
deploy

log_info "Setup Complete!"
