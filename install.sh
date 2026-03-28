#!/bin/bash
# ============================================================
#  back-up-tools — bootstrap a fresh Linux install
#  Supports: Arch Linux, Ubuntu / Debian
# ============================================================
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ── Load helpers ─────────────────────────────────────────────
source "$REPO_DIR/scripts/utils.sh"
source "$REPO_DIR/scripts/detect_distro.sh"
source "$REPO_DIR/scripts/setup_configs.sh"

# ── Detect distro ────────────────────────────────────────────
detect_distro

echo ""
echo -e "${BOLD}╔══════════════════════════════════════╗${RESET}"
echo -e "${BOLD}║       back-up-tools  installer       ║${RESET}"
echo -e "${BOLD}╚══════════════════════════════════════╝${RESET}"
echo ""
info "Detected distro : ${BOLD}$DISTRO${RESET}"
info "Package manager : ${BOLD}$PKG_MANAGER${RESET}"
echo ""

case "$DISTRO" in
    arch)
        source "$REPO_DIR/scripts/packages_arch.sh"
        install_packages_arch
        ;;
    ubuntu|debian)
        source "$REPO_DIR/scripts/packages_ubuntu.sh"
        install_packages_ubuntu
        ;;
    *)
        error "Unsupported distro: $DISTRO"
        error "Only Arch and Ubuntu/Debian are supported right now."
        exit 1
        ;;
esac

setup_zsh_plugins
setup_tpm
setup_configs "$REPO_DIR"
set_default_shell_zsh

echo ""
echo -e "${GREEN}${BOLD}All done! Please restart your terminal (or log out/in).${RESET}"
