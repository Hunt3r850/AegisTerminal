#!/bin/bash

# AegisTerminal - Social Engineering & Mobile Auditing Module

run_set_toolkit() {
    echo -e "${YELLOW}[*] Launching Social-Engineer Toolkit (SET)...${NC}"
    if command -v setoolkit &> /dev/null; then
        setoolkit
    else
        echo -e "${RED}[!] SET is not installed. Please run setup.sh first.${NC}"
    fi
}

mobile_audit_basic() {
    local target_apk=$1
    echo -e "${YELLOW}[*] Performing basic analysis on: $target_apk${NC}"
    # Basic info using aapt if available
    if command -v aapt &> /dev/null; then
        aapt dump badging "$target_apk" | grep -E 'package|sdkVersion|targetSdkVersion'
    else
        echo -e "${RED}[!] aapt not found. Basic info limited.${NC}"
    fi
}

mobile_audit_deep() {
    local target_apk=$1
    echo -e "${YELLOW}[*] Performing deep analysis (Decompiling) on: $target_apk${NC}"
    if command -v apktool &> /dev/null; then
        apktool d "$target_apk" -o "${target_apk}_decompiled"
        echo -e "${GREEN}[+] Decompiled to: ${target_apk}_decompiled${NC}"
    else
        echo -e "${RED}[!] apktool not found. Deep analysis failed.${NC}"
    fi
}
