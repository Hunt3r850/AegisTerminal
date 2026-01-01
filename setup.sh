#!/bin/bash

# ============================================================================
# AegisTerminal - Installation & Dependency Manager
# Version: 1.7 Stable (Robust Edition)
# Purpose: Automated installation of all dependencies for AegisTerminal suite
# ============================================================================

# Color definitions for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Banner
echo -e "${CYAN}"
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                  AegisTerminal Installation Wizard             ║"
echo "║                    Version 1.7 - Robust Release               ║"
╚════════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
  echo -e "${RED}[!] Error: This script must be run as root (sudo ./setup.sh)${NC}"
  exit 1
fi

echo -e "${YELLOW}[*] Starting AegisTerminal installation...${NC}\n"

# Function to install a package with error handling
install_pkg() {
    local pkg=$1
    echo -ne "${BLUE}    [*] Installing $pkg... ${NC}"
    if apt-get install -y "$pkg" > /dev/null 2>&1; then
        echo -e "${GREEN}[OK]${NC}"
        return 0
    else
        echo -e "${RED}[FAILED]${NC}"
        return 1
    fi
}

# Update system package lists
echo -e "${YELLOW}[*] Step 1/5: Updating system package lists...${NC}"
if apt-get update -y; then
  echo -e "${GREEN}[+] Package lists updated successfully${NC}\n"
else
  echo -e "${YELLOW}[!] Warning: Failed to update package lists. Continuing anyway...${NC}\n"
fi

# Install core dependencies one by one for robustness
echo -e "${YELLOW}[*] Step 2/5: Installing core dependencies...${NC}"
CORE_DEPS=("git" "curl" "wget" "net-tools" "macchanger" "nmap" "aircrack-ng" "hydra" "python3" "python3-pip" "ruby-full" "build-essential" "libcurl4-openssl-dev" "libxml2" "libxml2-dev" "libxslt1-dev" "ruby-dev")

FAILED_CORE=()
for pkg in "${CORE_DEPS[@]}"; do
    if ! install_pkg "$pkg"; then
        FAILED_CORE+=("$pkg")
    fi
done

if [ ${#FAILED_CORE[@]} -eq 0 ]; then
    echo -e "${GREEN}[+] All core dependencies installed successfully${NC}\n"
else
    echo -e "${YELLOW}[!] Warning: Some core dependencies failed to install: ${FAILED_CORE[*]}${NC}"
    echo -e "${YELLOW}    Check your internet connection or repositories.${NC}\n"
fi

# Install Social Engineering Toolkit (SET)
echo -e "${YELLOW}[*] Step 3/5: Installing Social Engineering Toolkit (SET)...${NC}"
if ! command -v setoolkit &> /dev/null; then
    if ! install_pkg "setoolkit"; then
        echo -e "${YELLOW}    [*] Attempting alternative installation for setoolkit...${NC}"
        if [ ! -d "/opt/setoolkit" ]; then
            cd /opt
            git clone https://github.com/trustedsec/social-engineer-toolkit.git setoolkit > /dev/null 2>&1
            cd setoolkit
            python3 setup.py install > /dev/null 2>&1
            echo -e "${GREEN}[+] setoolkit installed from source${NC}"
        fi
    fi
else
    echo -e "${GREEN}[+] setoolkit is already installed${NC}"
fi
echo ""

# Install Mobile Auditing Tools (Android)
echo -e "${YELLOW}[*] Step 4/5: Installing Mobile Auditing Tools...${NC}"
MOBILE_DEPS=("aapt" "apktool" "android-tools-adb")

for pkg in "${MOBILE_DEPS[@]}"; do
    if ! install_pkg "$pkg"; then
        if [ "$pkg" == "apktool" ]; then
            echo -e "${YELLOW}    [*] Attempting manual apktool installation...${NC}"
            mkdir -p /opt/apktool
            cd /opt/apktool
            wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.7.0.jar -O apktool.jar > /dev/null 2>&1
            wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool -O apktool > /dev/null 2>&1
            chmod +x apktool
            ln -sf /opt/apktool/apktool /usr/local/bin/apktool
            echo -e "${GREEN}[+] apktool installed manually${NC}"
        fi
    fi
done
echo ""

# Install Web Vulnerability Scanning Tools
echo -e "${YELLOW}[*] Step 5/5: Installing Web Vulnerability Scanning Tools...${NC}"

# Install Nikto
if ! command -v nikto &> /dev/null; then
    install_pkg "nikto"
else
    echo -e "${GREEN}[+] Nikto is already installed${NC}"
fi

# Install WPScan via Ruby Gems
echo -ne "${BLUE}    [*] Installing WPScan via Ruby Gems... ${NC}"
if ! command -v wpscan &> /dev/null; then
    if gem install wpscan > /dev/null 2>&1; then
        echo -e "${GREEN}[OK]${NC}"
    else
        echo -e "${RED}[FAILED]${NC}"
    fi
else
    echo -e "${GREEN}[ALREADY INSTALLED]${NC}"
fi

echo ""

# Set file permissions
echo -e "${YELLOW}[*] Setting file permissions...${NC}"
cd /home/ubuntu/AegisTerminal # Ensure we are in the right directory
chmod +x aegis.sh > /dev/null 2>&1
chmod -R +x modules/ > /dev/null 2>&1
echo -e "${GREEN}[+] Permissions set successfully${NC}\n"

# Create global command symlink
echo -e "${YELLOW}[*] Creating global command 'aegis'...${NC}"
ln -sf $(pwd)/aegis.sh /usr/local/bin/aegis > /dev/null 2>&1
if [ -L /usr/local/bin/aegis ]; then
    echo -e "${GREEN}[+] Global command 'aegis' created successfully${NC}\n"
else
    echo -e "${RED}[!] Failed to create global command${NC}"
fi

# Verify installations
echo -e "${CYAN}[*] Verifying installations...${NC}\n"

TOOLS=("nmap" "airmon-ng" "hydra" "nikto" "wpscan" "setoolkit" "aapt" "apktool")
INSTALLED=0
MISSING=0

for tool in "${TOOLS[@]}"; do
    if command -v $tool &> /dev/null; then
        echo -e "${GREEN}[✓] $tool${NC}"
        ((INSTALLED++))
    else
        echo -e "${YELLOW}[✗] $tool (not found)${NC}"
        ((MISSING++))
    fi
done

echo ""

# Final summary
echo -e "${CYAN}╔════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║                   Installation Complete!                       ║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════════════════════════╝${NC}\n"

echo -e "${GREEN}[+] AegisTerminal has been installed!${NC}"
echo -e "${GREEN}[+] Tools verified: $INSTALLED installed, $MISSING missing${NC}\n"

echo -e "${YELLOW}[*] To start using AegisTerminal, simply type:${NC}"
echo -e "${CYAN}    aegis${NC}\n"

exit 0
