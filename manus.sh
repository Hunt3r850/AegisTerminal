#!/bin/bash

# ManusPentestTool - Suite de Automatización para Hacking Ético
# Inspirado en lscript

# Colores para la interfaz
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Función para mostrar el banner
show_banner() {
    clear
    echo -e "${BLUE}"
    echo "  __  __                         _____           _            _ "
    echo " |  \/  |                       |  __ \         | |          | |"
    echo " | \  / | __ _ _ __  _   _ ___  | |__) |__ _ __ | |_ ___  ___| |"
    echo " | |\/| |/ _\` | '_ \| | | / __| |  ___/ _ \ '_ \| __/ _ \/ __| |"
    echo " | |  | | (_| | | | | |_| \__ \ | |  |  __/ | | | ||  __/\__ \_|"
    echo " |_|  |_|\__,_|_| |_|\__,_|___/ |_|   \___|_| |_|\__\___||___(_)"
    echo -e "${NC}"
    echo -e "${YELLOW}      Suite de Automatización para Hacking Ético - v1.0${NC}"
    echo " --------------------------------------------------------------"
}

# Función de menú principal
main_menu() {
    show_banner
    echo -e "${GREEN}1)${NC} Gestión de Sistema y Red (MAC, IP, Interfaces)"
    echo -e "${GREEN}2)${NC} Auditoría WiFi (Handshake, WPS, Escaneo)"
    echo -e "${GREEN}3)${NC} Herramientas Web (Nmap, SQLMap)"
    echo -e "${GREEN}4)${NC} Explotación (Metasploit, Payloads)"
    echo -e "${GREEN}5)${NC} Actualizar Herramienta"
    echo -e "${GREEN}0)${NC} Salir"
    echo ""
    read -p "Seleccione una opción: " choice

    case $choice in
        1) system_menu ;;
        2) wifi_menu ;;
        3) web_menu ;;
        4) exploit_menu ;;
        5) echo "Buscando actualizaciones..."; sleep 2; main_menu ;;
        0) exit 0 ;;
        *) echo -e "${RED}Opción inválida${NC}"; sleep 1; main_menu ;;
    esac
}

# Submenús (Placeholders por ahora)
system_menu() {
    show_banner
    echo -e "${BLUE}--- Gestión de Sistema y Red ---${NC}"
    echo "1) Cambiar dirección MAC"
    echo "2) Ver información de red"
    echo "3) Activar Modo Monitor"
    echo "0) Volver"
    read -p "Seleccione: " sys_choice
    case $sys_choice in
        0) main_menu ;;
        *) echo "Funcionalidad en desarrollo..."; sleep 1; system_menu ;;
    esac
}

wifi_menu() {
    show_banner
    echo -e "${BLUE}--- Auditoría WiFi ---${NC}"
    echo "1) Escanear redes cercanas"
    echo "2) Capturar Handshake"
    echo "0) Volver"
    read -p "Seleccione: " wifi_choice
    case $wifi_choice in
        0) main_menu ;;
        *) echo "Funcionalidad en desarrollo..."; sleep 1; wifi_menu ;;
    esac
}

web_menu() {
    show_banner
    echo -e "${BLUE}--- Herramientas Web ---${NC}"
    echo "1) Escaneo Nmap rápido"
    echo "2) Lanzar SQLMap"
    echo "0) Volver"
    read -p "Seleccione: " web_choice
    case $web_choice in
        0) main_menu ;;
        *) echo "Funcionalidad en desarrollo..."; sleep 1; web_menu ;;
    esac
}

exploit_menu() {
    show_banner
    echo -e "${BLUE}--- Explotación ---${NC}"
    echo "1) Generar Payload (msfvenom)"
    echo "2) Configurar Listener"
    echo "0) Volver"
    read -p "Seleccione: " exp_choice
    case $exp_choice in
        0) main_menu ;;
        *) echo "Funcionalidad en desarrollo..."; sleep 1; exploit_menu ;;
    esac
}

# Ejecutar menú principal
main_menu
