#!/bin/bash

# Funciones de utilidad de sistema

change_mac() {
    local interface=$1
    echo -e "${YELLOW}[*] Cambiando MAC para $interface...${NC}"
    ifconfig $interface down
    macchanger -r $interface
    ifconfig $interface up
    echo -e "${GREEN}[+] MAC cambiada con éxito.${NC}"
}

show_network_info() {
    echo -e "${BLUE}--- Información de Red ---${NC}"
    echo -e "${YELLOW}IP Privada:${NC} $(hostname -I)"
    echo -e "${YELLOW}IP Pública:${NC} $(curl -s https://ifconfig.me)"
    echo -e "${YELLOW}Interfaces:${NC}"
    ip link show | grep -E "^[0-9]+: " | cut -d: -f2
}
