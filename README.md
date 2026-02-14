# NmapPortView 

![Python](https://img.shields.io/badge/Python-3.x-blue?style=for-the-badge&logo=python)
![Bash](https://img.shields.io/badge/Script-Bash-green?style=for-the-badge&logo=gnu-bash)
![Version](https://img.shields.io/badge/Version-0.01-yellow?style=for-the-badge)

Made by Tigre8002

**NmapPortView** is a Python-based automation tool designed to streamline workflows during penetration testing and CTFs. Its primary objective is to eliminate the manual effort spent copying port numbers or converting reports, allowing for a faster and more efficient transition from scanning to exploitation.

## 🚀 Main Features

* **⚡ Smart Extraction (`-c`)**:
    * Parses Nmap grepable output (`-oG`).
    * Automatically detects IP addresses and protocols.
    * Displays a visual terminal summary with color-coded port states (Open/Closed).
    * **Automatic Clipboard**:Extracts only open port numbers as a comma-separated list (e.g., ``22,80,443``) and copies them to your clipboard, ready for your next scan.

* **📄 Report Conversion(`-xF`)**:
    * Transforms Nmap XML files (`-oX`) into aesthetic and readable HTML reports.
    * Utilizes`xsltproc` for the backend conversion.
    * Generates a temporary file in `/tmp/` to keep your environment clean.
    * **Quick Link: Automatically copies the` file://... path` to the clipboard so you only have to `Ctrl+V` into your browser.

## 📋 Installer Compatibility

The `install.sh` script automatically manages dependencies (`xsltproc`) on the following distributions:

| Operating System | Package  Manager | Status |
|-------------------|--------------------|--------|
| **Debian / Kali / Ubuntu / Pop!_OS** | `apt` | ✅  |
| **Arch / Manjaro** | `pacman` | ✅  |
| **Fedora / CentOS / RHEL** | `dnf` | ✅  |
| **Alpine Linux** | `apk` | ✅  |
| **macOS** | `brew` | ✅  |

## 🛠️ Installation
- Note: You must have pyperclip installed.

1.  **Clone :**
    ```bash
    git clone [https://github.com/Tigre8002/nmapPortView.git](https://github.com/Tigre8002/nmapPortView.git)
    cd nmapPortView
    ```

2.  **Run the installer:**
 Grant execution permissions to the script and run it. The script will automatically install Python and system dependencies, then move the tool to /`usr/local/bin`
    ```bash
    chmod +x install.sh
    ./install.sh
    ```
    *(Put Y)*.

## 📖 Usage Guide

Once installed, you can invoke `nmapPortView` from any path in your terminal.


### 1. Working with Ports (Mode Grepable)
Extracts open ports from a file generated with `nmap -oG`.


![til](https://github.com/Tigre8002/nmapPortView/blob/main/Assets/Copy.gif)

```bash
# 1. File grepable
nmap -p- --min-rate 5000 -oG allPorts 192.168.1.10

# 2. Extracts ports
nmapPortView -c allPorts

Output -->
--- Results for 192.168.1.10 ---
[TCP]
  Port 135: open
  Port 139: open
  Port 445: open
  Port 902: open
  Port 912: open
  Port 5040: open
  Port 49665: open
  Port 49668: open
  Port 49669: open
  Port 57621: open
  Port 60831: open
  Port 60832: open
  Port 64165: open

[+]-It has a copy to the clipboard with the ports.
```

### 2. Works with ports (Mode XML)
![til](https://github.com/Tigre8002/nmapPortView/blob/main/Assets/XMLGif.gif)

Extract open ports from a file generated with nmap -oX:1
```bash
# 1. XML File
nmap -p- --min-rate 5000 -oX allPorts 192.168.1.10

# 2. Extract ports to web
nmapPortView -xF allPorts

Output: 
Link --> file:///tmp/508301/508301.html
[!]-The link has been copied. Paste it into your browser.
```
