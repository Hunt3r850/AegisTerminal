#!/bin/bash

# AegisTerminal - Wireless Auditing Module (Aircrack-ng Suite)

enable_monitor_mode() {
    local interface=$1
    echo -e "${YELLOW}[*] Enabling monitor mode on $interface...${NC}"
    airmon-ng start "$interface"
}

disable_monitor_mode() {
    local interface=$1
    echo -e "${YELLOW}[*] Disabling monitor mode on $interface...${NC}"
    airmon-ng stop "$interface"
}

scan_networks() {
    local interface=$1
    echo -e "${YELLOW}[*] Scanning for networks on $interface (Press Ctrl+C to stop)...${NC}"
    airodump-ng "$interface"
}

capture_handshake() {
    local interface=$1
    local bssid=$2
    local channel=$3
    local output=$4
    echo -e "${YELLOW}[*] Capturing handshake for $bssid on channel $channel...${NC}"
    airodump-ng --bssid "$bssid" -c "$channel" -w "$output" "$interface"
}
