#!/bin/bash

# AegisTerminal - Network Reconnaissance Module (Nmap)

run_stealth_scan() {
    local target=$1
    echo -e "${YELLOW}[*] Starting Nmap Stealth Scan (-sS) on: $target${NC}"
    nmap -sS -T4 "$target"
}

run_version_scan() {
    local target=$1
    echo -e "${YELLOW}[*] Starting Nmap Service Version Detection (-sV) on: $target${NC}"
    nmap -sV -T4 "$target"
}

run_full_scan() {
    local target=$1
    echo -e "${YELLOW}[*] Starting Nmap Full Aggressive Scan (-A) on: $target${NC}"
    nmap -A -T4 "$target"
}
