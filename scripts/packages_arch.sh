#!/bin/bash
# Install packages on Arch Linux

install_packages_arch() {
    header "Installing packages (Arch)"

    local packages=(
        base-devel
        git
        python
        python-pip
        zsh
        neovim
        kitty
        fzf
        zoxide
        ripgrep
        atuin
        eza
        fd
        duf
        tree
        tmux
        yazi
        lazygit
        btop
        bat
        docker
        lazydocker
    )

    sudo pacman -Sy --needed --noconfirm "${packages[@]}"
    success "Packages installed"

    # pynvim for neovim python support
    pip install --user pynvim --break-system-packages 2>/dev/null || pip install --user pynvim
}
