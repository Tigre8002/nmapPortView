#!/bin/bash


#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

echo -n -e "${redColour}[!]-NmapPortView installer, are you sure you want to install it [Y/N]:${endColour}" && read option

install_xsltproc() {
    if ! command -v xsltproc >/dev/null 2>&1; then
        if [ -f /etc/os-release ]; then
            . /etc/os-release
            DISTRO=$ID
        elif [[ "$OSTYPE" == "darwin"* ]]; then
            DISTRO="macos"
        fi

        case "$DISTRO" in
            ubuntu|debian|kali|raspbian|pop)
                sudo apt-get update && sudo apt-get install -y xsltproc ;;
            fedora|centos|rhel|almalinux)
                sudo dnf install -y libxslt ;;
            arch|manjaro)
                sudo pacman -S --noconfirm libxslt ;;
            alpine)
                sudo apk add libxslt ;;
            macos)
                command -v brew >/dev/null 2>&1 && brew install libxslt || return 1 ;;
            *)
                return 1 ;;
        esac
    fi
}

install_tool() {
    if ! command -v nmapPortView >/dev/null 2>&1; then
        if [ -f "./nmapPortView" ]; then
            sudo cp ./nmapPortView /usr/local/bin/
            sudo chmod +x /usr/local/bin/nmapPortView
        else
            return 1
        fi
    fi
}


case $option in
  "Y")
    install_xsltproc
    install_tool
    ;;
  *)
    echo "Error en la instalación"
    exit 1
    ;;
esac

echo -e "\n${greenColour}[!]-Execute ${endColour}${redColour}nmapPortView --help ${endColour}${greenColour}for more information ${endColour}"
