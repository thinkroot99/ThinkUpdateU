#!/bin/bash

##########################################################################################################################
# Script: ThinkUpdateU
# Autor: ThinkRoot
# Versiune: 1.1

# Descriere:
#   Acest script permite actualizarea pachetelor DEB, Flatpak și Snap pe un sistem Ubuntu. Puteți alege să actualizați fiecare tip de pachet în mod individual sau să actualizați toate pachetele deodată. 

# Utilizare
# 1. Deschide terminalul și navighează în directorul în care ai salvat scriptul.
# 2. Acordă permisiuni de executare pentru script folosind comanda: chmod +x ThinkUpdateU.sh.
# 3. Rulează scriptul folosind comanda: ./ThinkUpdateU.sh.
##########################################################################################################################

# Funcție pentru a afișa meniul
show_menu() {
    clear
    echo "--------------------------------------------------------"
    echo "Actualizare aplicații"
    echo "--------------------------------------------------------"
    echo "1. Actualizare pachete DEB"
    echo "2. Actualizare pachete Flatpak"
    echo "3. Actualizare pachete Snap"
    echo "4. Actualizare toate pachetele"
    echo "5. Ieșire"
    echo "--------------------------------------------------------"
    read -p "Introduceți opțiunea (1/2/3/4/5): " option
}

# Funcție pentru a actualiza pachetele DEB
update_deb_packages() {
    echo "--------------------------------------------------------"
    echo "Actualizare pachetelor DEB..."
    sudo apt update
    sudo apt full-upgrade -y
    echo "Actualizarea pachetelor DEB a fost finalizată."
    if [ "$1" != "nopause" ]; then
        read -p "Apăsați Enter pentru a continua..."
    fi
}

# Funcție pentru a actualiza pachetele Flatpak
update_flatpak_packages() {
    echo "--------------------------------------------------------"
    echo "Actualizare pachetelor Flatpak..."
    flatpak update -y
    echo "Actualizarea pachetelor Flatpak a fost finalizată."
    if [ "$1" != "nopause" ]; then
        read -p "Apăsați Enter pentru a continua..."
    fi
}

# Funcție pentru a actualiza pachetele Snap
update_snap_packages() {
    echo "--------------------------------------------------------"
    echo "Actualizare pachetelor Snap..."
    sudo snap refresh
    echo "Actualizarea pachetelor Snap a fost finalizată."
    if [ "$1" != "nopause" ]; then
        read -p "Apăsați Enter pentru a continua..."
    fi
}

# Funcție pentru a actualiza toate tipurile de pachete
update_all_packages() {
    update_deb_packages nopause
    update_flatpak_packages nopause
    update_snap_packages nopause
    read -p "Actualizarea tuturor pachetelor a fost finalizată. Apăsați Enter pentru a continua..."
}

while true; do
    show_menu
    case "$option" in
        1)
            update_deb_packages
            ;;
        2)
            update_flatpak_packages
            ;;
        3)
            update_snap_packages
            ;;
        4)
            update_all_packages
            ;;
        5)
            echo "Ieșire din script. La revedere!"
            exit
            ;;
        *)
            echo "Opțiune invalidă. Vă rugăm să introduceți o opțiune validă (1/2/3/4/5)."
            read -p "Apăsați Enter pentru a continua..."
            ;;
    esac
done
