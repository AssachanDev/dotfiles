#!/bin/bash
# Detect the current Linux distro and export DISTRO / PKG_MANAGER

detect_distro() {
    if [ -f /etc/arch-release ]; then
        DISTRO="arch"
        PKG_MANAGER="pacman"
    elif [ -f /etc/debian_version ]; then
        # Distinguish Ubuntu from plain Debian
        if grep -qi "ubuntu" /etc/os-release 2>/dev/null; then
            DISTRO="ubuntu"
        else
            DISTRO="debian"
        fi
        PKG_MANAGER="apt"
    else
        DISTRO="unknown"
        PKG_MANAGER="unknown"
    fi

    export DISTRO PKG_MANAGER
}
