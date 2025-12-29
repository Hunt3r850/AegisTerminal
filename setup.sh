#!/bin/bash

# AegisTerminal - Installation & Dependency Manager

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}[*] AegisTerminal Installation Wizard${NC}"

# Check root
if [ "$EUID" -ne 0 ]; then 
  echo -e "${RED}[!] Error: Please run as root (sudo ./setup.sh)${NC}"
  exit 1
fi

# Update System
echo -e "${YELLOW}[*] Updating package lists...${NC}"
apt-get update -y

# Core Dependencies
echo -e "${YELLOW}[*] Installing core dependencies...${NC}"
# Se añade metasploit-framework a la lista de dependencias
apt-get install -y git curl wget net-tools macchanger nmap aircrack-ng hydra metasploit-framework python3 python3-pip ruby-full build-essential libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev

# Web Vulnerability Tools
echo -e "${YELLOW}[*] Installing Web Vulnerability Tools (Nikto & WPScan)...${NC}"

# Nikto
if ! command -v nikto &> /dev/null; then
    apt-get install -y nikto
fi

# WPScan (via Ruby Gems)
if ! command -v wpscan &> /dev/null; then
    gem install wpscan
fi

# Permissions
echo -e "${YELLOW}[*] Setting permissions...${NC}"
chmod +x aegis.sh
chmod -R +x modules/

# Global Command
echo -e "${YELLOW}[*] Creating global command 'aegis'...${NC}"
ln -sf $(pwd)/aegis.sh /usr/local/bin/aegis

echo -e "${GREEN}[+] AegisTerminal installed successfully!${NC}"
echo -e "${GREEN}[+] Type 'aegis' to start the shield.${NC}"
