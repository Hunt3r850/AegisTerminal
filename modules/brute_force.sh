#!/bin/bash

# AegisTerminal - Brute Force Module (Hydra)

run_hydra_ssh() {
    local target=$1
    local user_list=$2
    local pass_list=$3
    echo -e "${YELLOW}[*] Starting Hydra SSH brute force on: $target${NC}"
    hydra -L "$user_list" -P "$pass_list" ssh://"$target" -t 4 -V
}

run_hydra_ftp() {
    local target=$1
    local user_list=$2
    local pass_list=$3
    echo -e "${YELLOW}[*] Starting Hydra FTP brute force on: $target${NC}"
    hydra -L "$user_list" -P "$pass_list" ftp://"$target" -t 4 -V
}
