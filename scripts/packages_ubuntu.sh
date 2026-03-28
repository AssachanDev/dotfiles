#!/bin/bash
# Install packages on Ubuntu / Debian

install_packages_ubuntu() {
    header "Installing packages (Ubuntu/Debian)"

    sudo apt update -qq

    local packages=(
        build-essential
        git
        python3
        python3-pip
        zsh
        neovim
        kitty
        fzf
        ripgrep
        eza
        fd-find
        duf
        tree
        tmux
        btop
        bat
        docker.io
    )

    sudo apt install -y "${packages[@]}"
    success "Base packages installed"

    # zoxide — not always in apt repos
    if ! has zoxide; then
        info "Installing zoxide..."
        curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
    fi

    # atuin — not in apt repos
    if ! has atuin; then
        info "Installing atuin..."
        curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh | sh
    fi

    # yazi — not in apt repos
    if ! has yazi; then
        info "Installing yazi..."
        curl -sSfL https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-musl.zip -o /tmp/yazi.zip
        unzip -q /tmp/yazi.zip -d /tmp/yazi-bin
        sudo mv /tmp/yazi-bin/yazi-x86_64-unknown-linux-musl/yazi /usr/local/bin/yazi
        rm -rf /tmp/yazi.zip /tmp/yazi-bin
        success "yazi installed"
    fi

    # lazygit — not in apt repos
    if ! has lazygit; then
        info "Installing lazygit..."
        local lg_ver
        lg_ver=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name"' | cut -d'"' -f4 | sed 's/v//')
        curl -sSfL "https://github.com/jesseduffield/lazygit/releases/download/v${lg_ver}/lazygit_${lg_ver}_Linux_x86_64.tar.gz" | tar -xz -C /tmp
        sudo mv /tmp/lazygit /usr/local/bin/lazygit
        success "lazygit installed"
    fi

    # lazydocker — not in apt repos
    if ! has lazydocker; then
        info "Installing lazydocker..."
        curl -sSfL https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
        success "lazydocker installed"
    fi

    # pynvim for neovim python support
    pip3 install --user pynvim --break-system-packages 2>/dev/null || pip3 install --user pynvim

    success "All packages ready"
}
