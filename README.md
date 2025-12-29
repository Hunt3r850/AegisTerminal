# 🛡️ AegisTerminal: The Shield of Security

## 🌟 Descripción General

**AegisTerminal** es una suite de automatización avanzada diseñada para simplificar y acelerar las tareas de **Pentesting** y **Hacking Ético**. Inspirada en la eficiencia de herramientas como `lscript`, AegisTerminal proporciona una interfaz de línea de comandos (CLI) modular y fácil de usar para gestionar herramientas de red, realizar escaneos de vulnerabilidades web y automatizar procesos de seguridad.

El nombre **Aegis** (del griego antiguo *Aigis*, que significa "escudo") refleja el propósito de la herramienta: actuar como un escudo para el profesional de seguridad, automatizando las tareas repetitivas para que pueda centrarse en la estrategia y el análisis.

## ⚙️ Características Principales

| Categoría | Funcionalidades Implementadas | Herramientas Utilizadas |
| :--- | :--- | :--- |
| **System & Identity** | Cambio de dirección MAC, visualización de IP pública/privada. | `macchanger`, `ifconfig`, `curl` |
| **Web Scanning** | Escaneo general de vulnerabilidades web, escaneo específico de WordPress. | `Nikto`, `WPScan` |
| **Brute Force** | Ataques de fuerza bruta para servicios SSH y FTP. | `Hydra` |
| **Network Recon** | Escaneo de puertos avanzado (Stealth, Versión, Agresivo). | `Nmap` |
| **Exploitation** | Generación de Payloads con `msfvenom` y configuración de Listeners con `msfconsole`. | `Metasploit Framework` |
| **Wireless Auditing** | *Módulo en desarrollo* | `aircrack-ng`, `reaver` (futuro) |

## 💻 Instalación (Kali Linux Recomendado)

**AegisTerminal** está diseñado para funcionar en **Kali Linux** o cualquier distribución basada en Debian con las herramientas de seguridad preinstaladas. El script `setup.sh` se encarga de instalar automáticamente todas las dependencias necesarias, incluyendo **Metasploit Framework**.

1. **Clonar el Repositorio:**
   ```bash
   git clone https://github.com/Hunt3r850/AegisTerminal.git
   cd AegisTerminal
   ```

2. **Ejecutar el Script de Instalación:**
   Debe ejecutar el script con permisos de superusuario (`root`) para instalar dependencias y crear el enlace simbólico.

   ```bash
   sudo chmod +x setup.sh
   sudo ./setup.sh
   ```

   El script instalará dependencias como `git`, `curl`, `nmap`, `macchanger`, `aircrack-ng`, `ruby`, `Nikto`, `WPScan`, `Hydra` y **Metasploit Framework** (si no está ya instalado).

## ▶️ Uso

Una vez instalado, simplemente escriba `aegis` en su terminal para iniciar la suite:

```bash
aegis
```

Se le presentará un menú interactivo para navegar por las diferentes categorías de herramientas.

## 📝 Ejemplos de Uso por Módulo

A continuación, se detallan los pasos para utilizar las funcionalidades implementadas en la versión actual.

### 1. System & Identity

Este módulo permite gestionar rápidamente la identidad de red.

| Opción | Descripción |
| :--- | :--- |
| **1) Randomize MAC Address** | Cambia la dirección MAC de una interfaz de red especificada a un valor aleatorio. |
| **2) Show Network Info** | Muestra la dirección IP privada y realiza una consulta para obtener la IP pública. |

### 2. Web Vulnerability Scanning

Este módulo integra herramientas líderes para el escaneo de vulnerabilidades web.

| Opción | Herramienta | Descripción |
| :--- | :--- | :--- |
| **1) General Scan** | Nikto | Realiza un escaneo exhaustivo de servidores web en busca de archivos peligrosos, CGIs obsoletos y problemas de configuración. |
| **2) WordPress Scan** | WPScan | Escaneo específico para sitios WordPress, buscando vulnerabilidades en el core, plugins y temas. |

### 3. Brute Force Attacks

Este módulo utiliza **Hydra** para realizar ataques de fuerza bruta contra servicios de red.

| Opción | Servicio | Descripción |
| :--- | :--- | :--- |
| **1) SSH Brute Force** | SSH | Intenta iniciar sesión en un servidor SSH utilizando listas de usuarios y contraseñas. |
| **2) FTP Brute Force** | FTP | Intenta iniciar sesión en un servidor FTP utilizando listas de usuarios y contraseñas. |

### 4. Network Reconnaissance

Este módulo automatiza escaneos avanzados de **Nmap** para el reconocimiento de red.

| Opción | Comando Nmap | Descripción |
| :--- | :--- | :--- |
| **1) Stealth Scan** | `nmap -sS` | Realiza un escaneo TCP SYN (sigiloso) para evitar el registro completo de la conexión. |
| **2) Service Version Detection** | `nmap -sV` | Intenta determinar la versión del servicio que se ejecuta en los puertos abiertos. |
| **3) Aggressive Scan** | `nmap -A` | Activa la detección de SO, la detección de versiones, el escaneo de scripts y el traceroute. |

### 5. Exploitation Framework

Este módulo automatiza la generación de payloads y la configuración de listeners con **Metasploit**.

| Opción | Herramienta | Descripción |
| :--- | :--- | :--- |
| **1) Generate Payload** | `msfvenom` | Crea un payload de Meterpreter para Windows, Linux o Android. |
| **2) Start Multi-Handler** | `msfconsole` | Configura y lanza un listener para recibir la conexión inversa del payload. |

**Ejemplo de Uso (Generación de Payload y Listener):**

Este es un ejemplo clásico de cómo obtener una shell inversa en un sistema objetivo (asumiendo que el payload es entregado y ejecutado por el objetivo).

1.  **Obtener su IP Local (LHOST):** Necesitará su dirección IP en la red local (ej. `192.168.1.10`).
2.  **Generar el Payload:**
    *   Inicie AegisTerminal: `aegis`
    *   Seleccione **5) Exploitation Framework**.
    *   Seleccione **1) Generate Payload**.
    *   Ingrese la plataforma (ej. `1` para Windows), su LHOST, un LPORT (ej. `4444`) y el nombre del archivo (ej. `shell.exe`).
3.  **Configurar el Listener:**
    *   En el mismo menú, seleccione **2) Start Multi-Handler**.
    *   Ingrese el mismo LHOST y LPORT que usó para el payload.
    *   Seleccione el tipo de payload (ej. `1` para Windows).
    *   `msfconsole` se iniciará y esperará la conexión.
4.  **Ejecución:** Una vez que el archivo `shell.exe` sea ejecutado en el sistema objetivo, el listener de Metasploit recibirá la conexión y le proporcionará una sesión de Meterpreter.

## ⚠️ Descargo de Responsabilidad

**AegisTerminal es una herramienta de seguridad diseñada EXCLUSIVAMENTE para fines educativos y pruebas de penetración autorizadas.**

El uso de esta herramienta para acceder o dañar sistemas sin el permiso explícito y por escrito del propietario es ilegal y viola los principios del hacking ético. El desarrollador no se hace responsable del mal uso o de cualquier daño causado por esta herramienta. **¡Practique siempre el hacking ético!**

## 📄 Licencia

Este proyecto está bajo la Licencia **GPL-3.0**. Consulte el archivo `LICENSE` para más detalles.
