#!/bin/bash

# AegisTerminal - Web Vulnerability Scanner Module

run_nikto() {
    local target=$1
    echo -e "${YELLOW}[*] Starting Nikto scan on: $target${NC}"
    nikto -h "$target"
}

run_wpscan() {
    local target=$1
    echo -e "${YELLOW}[*] Starting WPScan on: $target${NC}"
    wpscan --url "$target" --enumerate vp,vt,u --disable-tls-checks
}
