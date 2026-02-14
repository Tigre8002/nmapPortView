# NmapPortView 🦁

![Python](https://img.shields.io/badge/Python-3.x-blue?style=for-the-badge&logo=python)
![Bash](https://img.shields.io/badge/Script-Bash-green?style=for-the-badge&logo=gnu-bash)
![Version](https://img.shields.io/badge/Version-0.01-yellow?style=for-the-badge)

**NmapPortView** es una herramienta de automatización escrita en Python y Bash diseñada para agilizar el flujo de trabajo en pruebas de penetración (Pentesting) y CTFs. Su objetivo principal es reducir el tiempo que pasas copiando puertos manualmente o convirtiendo reportes.

![Vista Previa](imagen.png)

## 🚀 Características Principales

* **⚡ Extracción Inteligente (`-c`)**:
    * Analiza la salida *grepable* de Nmap (`-oG`).
    * [cite_start]Detecta automáticamente direcciones IP y protocolos[cite: 2, 4].
    * [cite_start]Muestra un resumen visual en la terminal con colores para identificar estados (Abierto/Cerrado)[cite: 7].
    * [cite_start]**Portapapeles Automático**: Copia solo los números de los puertos abiertos separados por comas (ej: `22,80,443`), listo para pegar en tu siguiente escaneo[cite: 8].

* **📄 Conversión de Reportes (`-xF`)**:
    * Transforma archivos XML de Nmap (`-oX`) en reportes HTML estéticos y legibles.
    * [cite_start]Utiliza `xsltproc` para la conversión en el backend[cite: 9].
    * [cite_start]Genera un archivo temporal en `/tmp/` para mantener limpio tu entorno[cite: 9].
    * [cite_start]**Enlace Rápido**: Copia automáticamente la ruta `file://...` al portapapeles para que solo tengas que hacer `Ctrl+V` en tu navegador[cite: 9].

* **🐧 Multi-Plataforma**:
    * El instalador detecta tu distribución y configura el entorno automáticamente.

## 📋 Compatibilidad del Instalador

El script `install.sh` gestiona automáticamente las dependencias (`xsltproc`, `pyperclip`) en las siguientes distribuciones:

| Sistema Operativo | Gestor de Paquetes | Estado |
|-------------------|--------------------|--------|
| **Debian / Kali / Ubuntu / Pop!_OS** | `apt` | ✅ Soportado |
| **Arch / Manjaro** | `pacman` | ✅ Soportado |
| **Fedora / CentOS / RHEL** | `dnf` | ✅ Soportado |
| **Alpine Linux** | `apk` | ✅ Soportado |
| **macOS** | `brew` | ✅ Soportado |

## 🛠️ Instalación

1.  **Clona el repositorio:**
    ```bash
    git clone [https://github.com/Tigre8002/nmapPortView.git](https://github.com/Tigre8002/nmapPortView.git)
    cd nmapPortView
    ```

2.  **Ejecuta el instalador automático:**
    Da permisos de ejecución al script y lánzalo. El script instalará las dependencias de Python y del sistema, y moverá la herramienta a `/usr/local/bin`.
    ```bash
    chmod +x install.sh
    ./install.sh
    ```
    *(Pulsa 'Y' cuando el script te pregunte para confirmar la instalación)*.

## 📖 Guía de Uso

Una vez instalado, puedes invocar `nmapPortView` desde cualquier ruta en tu terminal.

### 1. Trabajando con Puertos (Modo Grepable)
Extrae los puertos abiertos de un archivo generado con `nmap -oG`.

```bash
# 1. Generar archivo grepable
nmap -p- --min-rate 5000 -oG allPorts 192.168.1.10

# 2. Extraer puertos
nmapPortView -c allPorts
