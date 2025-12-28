#!/bin/bash

# Script de instalación para ManusPentestTool

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}[*] Iniciando instalación de ManusPentestTool...${NC}"

# Verificar si es root
if [ "$EUID" -ne 0 ]; then 
  echo -e "${RED}[!] Por favor, ejecute como root (sudo ./setup.sh)${NC}"
  exit
fi

# Actualizar e instalar dependencias básicas
echo -e "${GREEN}[*] Instalando dependencias...${NC}"
apt-get update
apt-get install -y git curl nmap macchanger aircrack-ng python3 python3-pip

# Dar permisos de ejecución a los scripts
chmod +x manus.sh
chmod -R +x modules/

# Crear enlace simbólico para ejecutar desde cualquier lugar
ln -sf $(pwd)/manus.sh /usr/local/bin/manus

echo -e "${GREEN}[+] Instalación completada.${NC}"
echo -e "${GREEN}[+] Puedes ejecutar la herramienta escribiendo 'manus' en la terminal.${NC}"
