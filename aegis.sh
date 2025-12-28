#!/bin/bash

# AegisTerminal - Advanced Pentesting & Security Suite
# Author: Manus AI

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

# Banner
show_banner() {
    clear
    echo -e "${CYAN}"
    echo "    ___              _      _____                   _             _ "
    echo "   / _ \            (_)    |_   _|                 (_)           | |"
    echo "  / /_\ \ ___  __ _  _  ___  | | ___ _ __ _ __ ___  _ _ __   __ _| |"
    echo "  |  _  |/ _ \/ _\` || |/ __| | |/ _ \ '__| '_ \` _ \| | '_ \ / _\` | |"
    echo "  | | | |  __/ (_| || |\__ \ | |  __/ |  | | | | | | | | | | (_| | |"
    echo "  \_| |_/\___|\__, ||_||___/ \_/\___|_|  |_| |_| |_|_|_| |_|\__,_|_|"
    echo "               __/ |                                                "
    echo "              |___/                                                 "
    echo -e "${NC}"
    echo -e "${PURPLE}      [ AegisTerminal v1.2 - The Shield of Security ]${NC}"
    echo " --------------------------------------------------------------"
}

# Menú Principal
main_menu() {
    show_banner
    echo -e "${GREEN}1)${NC} System & Identity (MAC, IP, Anonymity)"
    echo -e "${GREEN}2)${NC} Wireless Auditing (WiFi, Handshake, WPS)"
    echo -e "${GREEN}3)${NC} Web Vulnerability Scanning (Nikto, WPScan)"
    echo -e "${GREEN}4)${NC} Brute Force Attacks (Hydra - SSH, FTP)"
    echo -e "${GREEN}5)${NC} Network Reconnaissance (Nmap, Discovery)"
    echo -e "${GREEN}6)${NC} Exploitation Framework (Metasploit, Payloads)"
    echo -e "${GREEN}7)${NC} Update AegisTerminal"
    echo -e "${GREEN}0)${NC} Exit"
    echo ""
    read -p "Aegis > " choice

    case $choice in
        1) system_menu ;;
        2) wifi_menu ;;
        3) web_vulnerability_menu ;;
        4) brute_force_menu ;;
        5) network_menu ;;
        6) exploit_menu ;;
        7) update_tool ;;
        0) exit 0 ;;
        *) echo -e "${RED}[!] Invalid option${NC}"; sleep 1; main_menu ;;
    esac
}

# Módulo Brute Force (Nuevo)
brute_force_menu() {
    show_banner
    echo -e "${BLUE}--- Brute Force Attacks (Hydra) ---${NC}"
    echo -e "1) SSH Brute Force"
    echo -e "2) FTP Brute Force"
    echo -e "0) Back"
    echo ""
    read -p "Aegis/Brute > " brute_choice
    case $brute_choice in
        1|2)
            read -p "Enter target IP/Host: " target
            read -p "Enter path to User List: " user_list
            read -p "Enter path to Password List: " pass_list
            
            if [[ "$brute_choice" == "1" ]]; then
                hydra -L "$user_list" -P "$pass_list" ssh://"$target" -t 4 -V
            else
                hydra -L "$user_list" -P "$pass_list" ftp://"$target" -t 4 -V
            fi
            read -p "Press enter to continue..."
            brute_force_menu
            ;;
        0) main_menu ;;
        *) brute_force_menu ;;
    esac
}

# Módulo Web
web_vulnerability_menu() {
    show_banner
    echo -e "${BLUE}--- Web Vulnerability Scanning ---${NC}"
    echo -e "1) General Scan (Nikto)"
    echo -e "2) WordPress Scan (WPScan)"
    echo -e "0) Back"
    echo ""
    read -p "Aegis/Web > " web_choice
    case $web_choice in
        1) 
            read -p "Enter target URL (e.g., http://example.com): " target
            nikto -h "$target"
            read -p "Press enter to continue..."
            web_vulnerability_menu
            ;;
        2)
            read -p "Enter WordPress URL: " wp_target
            wpscan --url "$wp_target" --enumerate vp,vt,u
            read -p "Press enter to continue..."
            web_vulnerability_menu
            ;;
        0) main_menu ;;
        *) web_vulnerability_menu ;;
    esac
}

# Módulo Sistema
system_menu() {
    show_banner
    echo -e "${BLUE}--- System & Identity ---${NC}"
    echo "1) Randomize MAC Address"
    echo "2) Show Network Info"
    echo "0) Back"
    read -p "Aegis/System > " sys_choice
    case $sys_choice in
        1) 
            read -p "Enter interface (e.g., eth0, wlan0): " iface
            ifconfig $iface down && macchanger -r $iface && ifconfig $iface up
            read -p "Press enter..."
            system_menu
            ;;
        2) 
            echo -e "${YELLOW}Private IP:${NC} $(hostname -I)"
            echo -e "${YELLOW}Public IP:${NC} $(curl -s https://ifconfig.me)"
            read -p "Press enter..."
            system_menu
            ;;
        0) main_menu ;;
    esac
}

wifi_menu() { show_banner; echo "WiFi Module - Under Construction"; sleep 1; main_menu; }
network_menu() { show_banner; echo "Network Module - Under Construction"; sleep 1; main_menu; }
exploit_menu() { show_banner; echo "Exploit Module - Under Construction"; sleep 1; main_menu; }
update_tool() { echo "Checking for updates..."; sleep 1; main_menu; }

# Start
main_menu
