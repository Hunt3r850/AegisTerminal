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
| **Wireless Auditing** | *Módulo en desarrollo* | `aircrack-ng`, `reaver` (futuro) |
| **Network Recon** | *Módulo en desarrollo* | `Nmap` (futuro) |
| **Exploitation** | *Módulo en desarrollo* | `msfvenom`, `Metasploit` (futuro) |

## 💻 Instalación (Kali Linux Recomendado)

**AegisTerminal** está diseñado para funcionar en **Kali Linux** o cualquier distribución basada en Debian con las herramientas de seguridad preinstaladas. El script `setup.sh` se encarga de instalar automáticamente todas las dependencias necesarias, incluyendo `Nikto`, `WPScan` y **Hydra**.

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

   El script instalará dependencias como `git`, `curl`, `nmap`, `macchanger`, `aircrack-ng`, `ruby`, `Nikto`, `WPScan` y **Hydra**.

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

**Ejemplo de uso:**

1.  Inicie AegisTerminal: `aegis`
2.  Seleccione la opción **1) System & Identity**.
3.  Para cambiar la MAC, seleccione **1) Randomize MAC Address**.
4.  Cuando se le solicite, ingrese el nombre de la interfaz (ej. `eth0` o `wlan0`).

### 2. Web Vulnerability Scanning

Este módulo integra herramientas líderes para el escaneo de vulnerabilidades web.

| Opción | Herramienta | Descripción |
| :--- | :--- | :--- |
| **1) General Scan** | Nikto | Realiza un escaneo exhaustivo de servidores web en busca de archivos peligrosos, CGIs obsoletos y problemas de configuración. |
| **2) WordPress Scan** | WPScan | Escaneo específico para sitios WordPress, buscando vulnerabilidades en el core, plugins y temas. |

**Ejemplo de uso (Escaneo con Nikto):**

1.  Inicie AegisTerminal: `aegis`
2.  Seleccione la opción **3) Web Vulnerability Scanning**.
3.  Seleccione **1) General Scan (Nikto)**.
4.  Cuando se le solicite, ingrese la URL objetivo (ej. `http://testphp.vulnweb.com`).

### 3. Brute Force Attacks

Este módulo utiliza **Hydra** para realizar ataques de fuerza bruta contra servicios de red.

| Opción | Servicio | Descripción |
| :--- | :--- | :--- |
| **1) SSH Brute Force** | SSH | Intenta iniciar sesión en un servidor SSH utilizando listas de usuarios y contraseñas. |
| **2) FTP Brute Force** | FTP | Intenta iniciar sesión en un servidor FTP utilizando listas de usuarios y contraseñas. |

**Ejemplo de uso (Ataque SSH):**

1.  Inicie AegisTerminal: `aegis`
2.  Seleccione la opción **4) Brute Force Attacks**.
3.  Seleccione **1) SSH Brute Force**.
4.  Ingrese la IP del objetivo, la ruta a su lista de usuarios (`-L`) y la ruta a su lista de contraseñas (`-P`).

    *Ruta de ejemplo para lista de usuarios:* `/usr/share/wordlists/metasploit/unix_users.txt`
    *Ruta de ejemplo para lista de contraseñas:* `/usr/share/wordlists/rockyou.txt`

## ⚠️ Descargo de Responsabilidad

**AegisTerminal es una herramienta de seguridad diseñada EXCLUSIVAMENTE para fines educativos y pruebas de penetración autorizadas.**

El uso de esta herramienta para acceder o dañar sistemas sin el permiso explícito y por escrito del propietario es ilegal y viola los principios del hacking ético. El desarrollador no se hace responsable del mal uso o de cualquier daño causado por esta herramienta. **¡Practique siempre el hacking ético!**

## 📄 Licencia

Este proyecto está bajo la Licencia **GPL-3.0**. Consulte el archivo `LICENSE` para más detalles.
