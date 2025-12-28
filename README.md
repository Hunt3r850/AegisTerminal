# ManusPentestTool: Suite de Automatización para Hacking Ético

## 🛡️ Descripción General

**ManusPentestTool** es una suite de automatización de código abierto diseñada para simplificar y acelerar las tareas comunes de **Pentesting** y **Hacking Ético**. Inspirada en herramientas como `lscript`, esta suite proporciona una interfaz de menú fácil de usar para gestionar herramientas de red, realizar auditorías WiFi y automatizar procesos de explotación.

El objetivo principal es reducir la cantidad de comandos a memorizar y el tiempo dedicado a la configuración inicial, permitiendo al profesional de seguridad centrarse en el análisis y la estrategia.

## ⚙️ Características Principales

| Categoría | Funcionalidades |
| :--- | :--- |
| **Gestión de Sistema** | Cambio rápido de dirección MAC, visualización de IP pública/privada, gestión de interfaces de red. |
| **Auditoría WiFi** | Escaneo de redes, automatización de captura de handshakes WPA/WPA2, activación de modo monitor. |
| **Herramientas Web** | Menús preconfigurados para escaneos con Nmap y automatización de pruebas de inyección SQL con SQLMap. |
| **Explotación** | Generación simplificada de payloads con `msfvenom` y configuración de listeners de Metasploit. |

## 💻 Instalación (Kali Linux Recomendado)

**ManusPentestTool** está diseñado para funcionar de manera óptima en **Kali Linux** o distribuciones basadas en Debian con las herramientas de seguridad preinstaladas.

1. **Clonar el Repositorio:**
   \`\`\`bash
   git clone https://github.com/TU_USUARIO/ManusPentestTool.git
   cd ManusPentestTool
   \`\`\`

2. **Ejecutar el Script de Instalación:**
   Debe ejecutar el script con permisos de superusuario (`root`) para instalar dependencias y crear el enlace simbólico.

   \`\`\`bash
   sudo chmod +x setup.sh
   sudo ./setup.sh
   \`\`\`

   El script instalará las dependencias necesarias (`git`, `curl`, `nmap`, `macchanger`, `aircrack-ng`) y creará un enlace simbólico para que pueda ejecutar la herramienta desde cualquier lugar.

## ▶️ Uso

Una vez instalado, simplemente escriba `manus` en su terminal para iniciar la suite:

\`\`\`bash
manus
\`\`\`

Se le presentará un menú interactivo para navegar por las diferentes categorías de herramientas.

## ⚠️ Descargo de Responsabilidad

**ESTA HERRAMIENTA ES SÓLO PARA FINES EDUCATIVOS Y DE PRUEBAS DE PENETRACIÓN AUTORIZADAS.**

El uso de **ManusPentestTool** para atacar sistemas sin permiso previo y explícito es ilegal y poco ético. El desarrollador no se hace responsable del mal uso o de cualquier daño causado por esta herramienta. **¡Sea legal y ético!**

## 📄 Licencia

Este proyecto está bajo la Licencia **GPL-3.0**. Consulte el archivo `LICENSE` para más detalles.
