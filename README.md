# 🛡️ AegisTerminal: The Shield of Security

## 🌟 Descripción General

**AegisTerminal** es una suite de automatización avanzada diseñada para simplificar y acelerar las tareas de **Pentesting** y **Hacking Ético**. Inspirada en la eficiencia de herramientas como `lscript`, AegisTerminal proporciona una interfaz de línea de comandos (CLI) modular y fácil de usar para gestionar herramientas de red, realizar escaneos de vulnerabilidades web y automatizar procesos de seguridad.

El nombre **Aegis** (del griego antiguo *Aigis*, que significa "escudo") refleja el propósito de la herramienta: actuar como un escudo para el profesional de seguridad, automatizando las tareas repetitivas para que pueda centrarse en la estrategia y el análisis.

## ⚙️ Características Principales

| Categoría | Funcionalidades Implementadas | Herramientas Utilizadas |
| :--- | :--- | :--- |
| **System & Identity** | Cambio de dirección MAC, visualización de IP pública/privada. | `macchanger`, `ifconfig`, `curl` |
| **Wireless Auditing** | Modo Monitor, Escaneo de Redes, Captura de Handshakes WPA/WPA2. | `aircrack-ng` suite |
| **Web Scanning** | Escaneo general de vulnerabilidades web, escaneo específico de WordPress. | `Nikto`, `WPScan` |
| **Brute Force** | Ataques de fuerza bruta para servicios SSH y FTP. | `Hydra` |
| **Network Recon** | Escaneo de puertos avanzado (Stealth, Versión, Agresivo). | `Nmap` |
| **Exploitation** | Generación de Payloads con `msfvenom` y configuración de Listeners con `msfconsole`. | `Metasploit Framework` |
| **Social Engineering** | Lanzamiento de la suite Social-Engineer Toolkit (SET) para ataques de ingeniería social. | `setoolkit` |
| **Mobile Auditing** | Análisis básico y profundo (descompilación) de archivos APK. | `aapt`, `apktool` |

## 💻 Instalación (Kali Linux Recomendado)

**AegisTerminal** está diseñado para funcionar en **Kali Linux** o cualquier distribución basada en Debian con las herramientas de seguridad preinstaladas. El script `setup.sh` se encarga de instalar automáticamente todas las dependencias necesarias.

### Pasos de Instalación

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

   El script instalará automáticamente todas las dependencias necesarias, incluyendo:
   - **Herramientas de Red:** `nmap`, `aircrack-ng`, `macchanger`
   - **Herramientas de Escaneo Web:** `nikto`, `wpscan`
   - **Herramientas de Fuerza Bruta:** `hydra`
   - **Framework de Explotación:** `metasploit-framework`
   - **Ingeniería Social:** `setoolkit`
   - **Auditoría Móvil:** `aapt`, `apktool`
   - **Dependencias de Desarrollo:** `python3`, `ruby`, `build-essential`, librerías de desarrollo

3. **Verificar la Instalación:**
   ```bash
   aegis --help
   # o simplemente
   aegis
   ```

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

**Ejemplo de Uso:**
```bash
aegis
# Seleccionar: 1) System & Identity
# Seleccionar: 1) Randomize MAC Address
# Ingresar interfaz: eth0
```

### 2. Wireless Auditing

Este módulo utiliza la suite **aircrack-ng** para la auditoría de redes inalámbricas.

| Opción | Herramienta | Descripción |
| :--- | :--- | :--- |
| **1) Enable Monitor Mode** | `airmon-ng start` | Pone la interfaz inalámbrica en modo monitor. |
| **2) Disable Monitor Mode** | `airmon-ng stop` | Devuelve la interfaz a modo gestionado. |
| **3) Scan Networks** | `airodump-ng` | Escanea redes cercanas para obtener BSSID, canal y clientes. |
| **4) Capture Handshake** | `airodump-ng` | Captura el handshake WPA/WPA2 de un punto de acceso específico. |

**Ejemplo de Uso (Escaneo de Redes):**
```bash
aegis
# Seleccionar: 2) Wireless Auditing
# Seleccionar: 3) Scan Networks
# Ingresar interfaz: wlan0
# El script mostrará las redes disponibles en tiempo real
```

### 3. Web Vulnerability Scanning

Este módulo integra herramientas líderes para el escaneo de vulnerabilidades web.

| Opción | Herramienta | Descripción |
| :--- | :--- | :--- |
| **1) General Scan** | Nikto | Realiza un escaneo exhaustivo de servidores web en busca de archivos peligrosos, CGIs obsoletos y problemas de configuración. |
| **2) WordPress Scan** | WPScan | Escaneo específico para sitios WordPress, buscando vulnerabilidades en el core, plugins y temas. |

**Ejemplo de Uso (Escaneo General):**
```bash
aegis
# Seleccionar: 3) Web Scanning
# Seleccionar: 1) General Scan
# Ingresar URL: http://target.com
# Nikto realizará el escaneo y mostrará los resultados
```

**Ejemplo de Uso (Escaneo WordPress):**
```bash
aegis
# Seleccionar: 3) Web Scanning
# Seleccionar: 2) WordPress Scan
# Ingresar URL: http://target.com
# WPScan buscará plugins y temas vulnerables
```

### 4. Brute Force Attacks

Este módulo utiliza **Hydra** para realizar ataques de fuerza bruta contra servicios de red.

| Opción | Servicio | Descripción |
| :--- | :--- | :--- |
| **1) SSH Brute Force** | SSH | Intenta iniciar sesión en un servidor SSH utilizando listas de usuarios y contraseñas. |
| **2) FTP Brute Force** | FTP | Intenta iniciar sesión en un servidor FTP utilizando listas de usuarios y contraseñas. |

**Ejemplo de Uso (SSH Brute Force):**
```bash
aegis
# Seleccionar: 4) Brute Force
# Seleccionar: 1) SSH Brute Force
# Ingresar IP del objetivo: 192.168.1.100
# Ingresar ruta de wordlist de usuarios: /usr/share/wordlists/users.txt
# Ingresar ruta de wordlist de contraseñas: /usr/share/wordlists/rockyou.txt
# Hydra comenzará el ataque
```

### 5. Network Reconnaissance

Este módulo automatiza escaneos avanzados de **Nmap** para el reconocimiento de red.

| Opción | Comando Nmap | Descripción |
| :--- | :--- | :--- |
| **1) Stealth Scan** | `nmap -sS` | Realiza un escaneo TCP SYN (sigiloso) para evitar el registro completo de la conexión. |
| **2) Service Version Detection** | `nmap -sV` | Intenta determinar la versión del servicio que se ejecuta en los puertos abiertos. |
| **3) Aggressive Scan** | `nmap -A` | Activa la detección de SO, la detección de versiones, el escaneo de scripts y el traceroute. |

**Ejemplo de Uso (Stealth Scan):**
```bash
aegis
# Seleccionar: 5) Network Reconnaissance
# Seleccionar: 1) Stealth Scan
# Ingresar IP o rango: 192.168.1.0/24
# Nmap realizará un escaneo sigiloso
```

### 6. Exploitation Framework

Este módulo automatiza la generación de payloads y la configuración de listeners con **Metasploit**.

| Opción | Herramienta | Descripción |
| :--- | :--- | :--- |
| **1) Generate Payload** | `msfvenom` | Crea un payload de Meterpreter para Windows, Linux o Android. |
| **2) Start Multi-Handler** | `msfconsole` | Configura y lanza un listener para recibir la conexión inversa del payload. |

**Ejemplo de Uso (Generar Payload):**
```bash
aegis
# Seleccionar: 6) Exploitation
# Seleccionar: 1) Generate Payload
# Seleccionar tipo: 1) Windows
# Ingresar LHOST (tu IP): 192.168.1.50
# Ingresar LPORT (puerto): 4444
# Ingresar ruta de salida: /home/user/payload.exe
# msfvenom generará el payload
```

**Ejemplo de Uso (Listener):**
```bash
aegis
# Seleccionar: 6) Exploitation
# Seleccionar: 2) Start Multi-Handler
# Ingresar LHOST: 192.168.1.50
# Ingresar LPORT: 4444
# msfconsole se abrirá esperando conexiones
```

### 7. Social Engineering (SET)

Este módulo lanza la suite **Social-Engineer Toolkit (SET)**, una herramienta líder para la simulación de ataques de ingeniería social.

| Opción | Herramienta | Descripción |
| :--- | :--- | :--- |
| **1) Launch Social-Engineer Toolkit (SET)** | `setoolkit` | Inicia el menú interactivo de SET para crear ataques como spear-phishing, clonación de sitios web y más. |

**Ejemplo de Uso (Phishing Ético):**
```bash
aegis
# Seleccionar: 7) Social Engineering
# Seleccionar: 1) Launch Social-Engineer Toolkit (SET)
# Dentro de SET, seleccionar: 1) Social-Engineering Attacks
# Seleccionar: 2) Website Attack Vectors
# Seleccionar: 3) Credential Harvester Attack Method
# Seleccionar: 2) Site Cloner
# Ingresar la IP de su máquina (LHOST): 192.168.1.50
# Ingresar la URL del sitio web que desea clonar: https://www.facebook.com
# SET clonará el sitio y levantará un servidor web esperando que la víctima ingrese sus credenciales
```

**Nota Importante:** Este tipo de ataques solo deben realizarse en entornos de prueba autorizados y con consentimiento explícito del propietario de la infraestructura.

### 8. Mobile Auditing

Este módulo facilita el análisis de aplicaciones Android (APK) para auditorías de seguridad.

| Opción | Herramienta | Descripción |
| :--- | :--- | :--- |
| **1) Basic APK Analysis** | `aapt` | Muestra información básica del paquete, permisos y versiones SDK. |
| **2) Deep APK Analysis** | `apktool` | Descompila el archivo APK en código Smali y recursos para un análisis profundo. |

**Ejemplo de Uso (Análisis Básico):**
```bash
aegis
# Seleccionar: 8) Mobile Auditing
# Seleccionar: 1) Basic APK Analysis
# Ingresar ruta del APK: /home/user/app.apk
# aapt mostrará información como:
#   - Nombre del paquete
#   - Versión
#   - Permisos solicitados
#   - Versiones de SDK soportadas
```

**Ejemplo de Uso (Análisis Profundo):**
```bash
aegis
# Seleccionar: 8) Mobile Auditing
# Seleccionar: 2) Deep APK Analysis
# Ingresar ruta del APK: /home/user/app.apk
# apktool descompilará el APK en un directorio llamado "app"
# Podrá revisar:
#   - Código Smali (bytecode de Android)
#   - Archivos de recursos (strings, layouts, etc.)
#   - Archivos de configuración (AndroidManifest.xml)
```

## 📊 Presentación de Diapositivas

Se ha generado una **presentación profesional de 10 diapositivas** que resume todas las capacidades de **AegisTerminal**. La presentación utiliza una estética "Terminal Noir" con colores de alto contraste (#121212, #00FF41, #E0E0E0, #FF3333) y está diseñada para ser utilizada en demostraciones, capacitaciones o presentaciones técnicas.

### Contenido de la Presentación

1. **Portada:** Introducción a AegisTerminal y su propósito.
2. **Introducción y Filosofía:** Concepto central y filosofía de automatización.
3. **Reconocimiento de Red:** Gestión de identidad y escaneos avanzados con Nmap.
4. **Auditoría Inalámbrica:** Capacidades de la suite aircrack-ng.
5. **Escaneo Web Estratégico:** Nikto y WPScan para auditorías web.
6. **Fuerza Bruta y Explotación:** Hydra y Metasploit Framework.
7. **Ingeniería Social:** SET Toolkit para ataques basados en el factor humano.
8. **Auditoría Móvil:** Análisis de aplicaciones Android.
9. **Instalación y Escalabilidad:** Proceso de despliegue y arquitectura modular.
10. **Conclusión:** Resumen y compromiso ético.

### Acceder a la Presentación

Para visualizar la presentación de diapositivas, utilice el siguiente enlace:

```
manus-slides://CMGeYavOioXlLye0C7tb6l
```

O acceda directamente desde el directorio del proyecto:

```bash
cd /home/ubuntu/AegisTerminal/slides_project
# Abra cualquiera de los archivos HTML en su navegador
```

## 🔧 Estructura del Proyecto

```
AegisTerminal/
├── aegis.sh                    # Script principal con menú interactivo
├── setup.sh                    # Script de instalación y gestión de dependencias
├── README.md                   # Documentación completa
├── modules/
│   ├── system_utils.sh         # Módulo de gestión de identidad
│   ├── wireless_auditing.sh    # Módulo de auditoría inalámbrica
│   ├── web_scanner.sh          # Módulo de escaneo web
│   ├── brute_force.sh          # Módulo de fuerza bruta
│   ├── network_recon.sh        # Módulo de reconocimiento de red
│   ├── exploitation.sh         # Módulo de explotación
│   └── social_mobile.sh        # Módulo de ingeniería social y auditoría móvil
├── assets/                     # Imágenes y recursos para la presentación
└── slides_project/             # Presentación de diapositivas HTML
    ├── slide_1_portada.html
    ├── slide_2_introduccion.html
    ├── slide_3_reconocimiento.html
    ├── slide_4_wireless.html
    ├── slide_5_web_scanning.html
    ├── slide_6_explotacion.html
    ├── slide_7_social_engineering.html
    ├── slide_8_mobile_auditing.html
    ├── slide_9_instalacion.html
    └── slide_10_conclusion.html
```

## ⚠️ Descargo de Responsabilidad

**AegisTerminal es una herramienta de seguridad diseñada EXCLUSIVAMENTE para fines educativos y pruebas de penetración autorizadas.**

El uso de esta herramienta para acceder o dañar sistemas sin el permiso explícito y por escrito del propietario es ilegal y viola los principios del hacking ético. El desarrollador no se hace responsable del mal uso o de cualquier daño causado por esta herramienta. **¡Practique siempre el hacking ético!**

## 📄 Licencia

Este proyecto está bajo la Licencia **GPL-3.0**. Consulte el archivo `LICENSE` para más detalles.

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Si desea mejorar **AegisTerminal**, siéntase libre de hacer un fork del repositorio, realizar cambios y enviar un pull request.

## 📧 Contacto

Para preguntas, sugerencias o reportes de errores, abra un issue en el repositorio de GitHub.

---

**Versión:** 1.6 Stable  
**Última Actualización:** Diciembre 2025  
**Desarrollado por:** Manus AI
