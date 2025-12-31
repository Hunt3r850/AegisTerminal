#!/bin/bash

# ============================================================================
# AegisTerminal - Installation & Dependency Manager
# Version: 1.6 Stable
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
echo "║                    Version 1.6 - Stable Release               ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
  echo -e "${RED}[!] Error: This script must be run as root (sudo ./setup.sh)${NC}"
  exit 1
fi

echo -e "${YELLOW}[*] Starting AegisTerminal installation...${NC}\n"

# Update system package lists
echo -e "${YELLOW}[*] Step 1/5: Updating system package lists...${NC}"
apt-get update -y > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo -e "${GREEN}[+] Package lists updated successfully${NC}\n"
else
  echo -e "${RED}[!] Failed to update package lists${NC}"
  exit 1
fi

# Install core dependencies
echo -e "${YELLOW}[*] Step 2/5: Installing core dependencies...${NC}"
echo -e "${BLUE}    Installing: git, curl, wget, net-tools, macchanger, nmap${NC}"

CORE_DEPS="git curl wget net-tools macchanger nmap aircrack-ng hydra python3 python3-pip ruby-full build-essential libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev"

apt-get install -y $CORE_DEPS > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo -e "${GREEN}[+] Core dependencies installed successfully${NC}\n"
else
  echo -e "${RED}[!] Failed to install core dependencies${NC}"
  exit 1
fi

# Install Social Engineering Toolkit (SET)
echo -e "${YELLOW}[*] Step 3/5: Installing Social Engineering Toolkit (SET)...${NC}"
echo -e "${BLUE}    Checking for setoolkit installation...${NC}"

if ! command -v setoolkit &> /dev/null; then
    echo -e "${YELLOW}    [*] Installing setoolkit from repositories...${NC}"
    apt-get install -y setoolkit > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}[+] setoolkit installed successfully${NC}"
    else
        echo -e "${YELLOW}[!] setoolkit not available in repositories, attempting alternative installation...${NC}"
        # Try installing from source if not in repos
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
echo -e "${BLUE}    Installing: aapt, apktool, android-tools-adb${NC}"

MOBILE_DEPS="aapt apktool android-tools-adb"

apt-get install -y $MOBILE_DEPS > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo -e "${GREEN}[+] Mobile auditing tools installed successfully${NC}\n"
else
  echo -e "${YELLOW}[!] Some mobile tools may not be available in repositories${NC}"
  echo -e "${YELLOW}    Attempting to install aapt and apktool individually...${NC}"
  
  # Try installing aapt separately
  if ! command -v aapt &> /dev/null; then
    apt-get install -y google-android-build-tools-installer > /dev/null 2>&1
    echo -e "${GREEN}[+] aapt installation attempted${NC}"
  else
    echo -e "${GREEN}[+] aapt is already installed${NC}"
  fi
  
  # Try installing apktool separately
  if ! command -v apktool &> /dev/null; then
    echo -e "${YELLOW}    [*] Installing apktool...${NC}"
    apt-get install -y apktool > /dev/null 2>&1
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}[+] apktool installed successfully${NC}"
    else
      echo -e "${YELLOW}[!] Attempting manual apktool installation...${NC}"
      mkdir -p /opt/apktool
      cd /opt/apktool
      wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.7.0.jar > /dev/null 2>&1
      wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool > /dev/null 2>&1
      chmod +x apktool
      ln -sf /opt/apktool/apktool /usr/local/bin/apktool
      echo -e "${GREEN}[+] apktool installed manually${NC}"
    fi
  else
    echo -e "${GREEN}[+] apktool is already installed${NC}"
  fi
  echo ""
fi

# Install Web Vulnerability Scanning Tools
echo -e "${YELLOW}[*] Step 5/5: Installing Web Vulnerability Scanning Tools...${NC}"

# Install Nikto
echo -e "${BLUE}    Installing Nikto...${NC}"
if ! command -v nikto &> /dev/null; then
    apt-get install -y nikto > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}[+] Nikto installed successfully${NC}"
    else
        echo -e "${YELLOW}[!] Nikto installation failed${NC}"
    fi
else
    echo -e "${GREEN}[+] Nikto is already installed${NC}"
fi

# Install WPScan via Ruby Gems
echo -e "${BLUE}    Installing WPScan via Ruby Gems...${NC}"
if ! command -v wpscan &> /dev/null; then
    gem install wpscan > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}[+] WPScan installed successfully${NC}"
    else
        echo -e "${YELLOW}[!] WPScan installation failed${NC}"
    fi
else
    echo -e "${GREEN}[+] WPScan is already installed${NC}"
fi

echo ""

# Set file permissions
echo -e "${YELLOW}[*] Setting file permissions...${NC}"
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
    exit 1
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

echo -e "${GREEN}[+] AegisTerminal has been installed successfully!${NC}"
echo -e "${GREEN}[+] Tools verified: $INSTALLED installed, $MISSING missing${NC}\n"

echo -e "${YELLOW}[*] To start using AegisTerminal, simply type:${NC}"
echo -e "${CYAN}    aegis${NC}\n"

echo -e "${YELLOW}[*] For more information, consult the README.md file.${NC}\n"

echo -e "${BLUE}[i] Version: 1.6 Stable${NC}"
echo -e "${BLUE}[i] Repository: https://github.com/Hunt3r850/AegisTerminal${NC}\n"

exit 0
