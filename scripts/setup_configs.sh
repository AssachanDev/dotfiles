#!/bin/bash
# Symlink all configs from the repo into the right places

setup_configs() {
    local repo_dir="$1"   # absolute path to repo root
    local cfg="$repo_dir/configs"

    header "Setting up configs"

    # ── Zsh ──────────────────────────────────────────────────────────────
    link_config "$cfg/zsh/zshrc"   "$HOME/.zshrc"
    link_config "$cfg/zsh/p10k.zsh" "$HOME/.p10k.zsh"

    # ── Kitty ────────────────────────────────────────────────────────────
    link_config "$cfg/kitty" "$HOME/.config/kitty"

    # ── Tmux ─────────────────────────────────────────────────────────────
    link_config "$cfg/tmux/.tmux.conf" "$HOME/.tmux.conf"

    # ── Yazi ─────────────────────────────────────────────────────────────
    link_config "$cfg/yazi" "$HOME/.config/yazi"

    # ── Btop ─────────────────────────────────────────────────────────────
    link_config "$cfg/btop" "$HOME/.config/btop"

    success "All configs linked"
}

setup_tpm() {
    header "Installing Tmux Plugin Manager (TPM)"

    local tpm_dir="$HOME/.tmux/plugins/tpm"
    if [ ! -d "$tpm_dir" ]; then
        git clone https://github.com/tmux-plugins/tpm "$tpm_dir"
        success "TPM installed"
        info "Open tmux and press Prefix + I to install plugins"
    else
        info "TPM already present, skipping"
    fi
}

setup_zsh_plugins() {
    header "Installing Zsh plugins"

    local zsh_dir="$HOME/.config/zsh"
    mkdir -p "$zsh_dir"

    declare -A PLUGINS=(
        ["powerlevel10k"]="https://github.com/romkatv/powerlevel10k.git --depth=1"
        ["zsh-autosuggestions"]="https://github.com/zsh-users/zsh-autosuggestions"
        ["zsh-syntax-highlighting"]="https://github.com/zsh-users/zsh-syntax-highlighting.git"
    )

    for plugin in "${!PLUGINS[@]}"; do
        if [ ! -d "$zsh_dir/$plugin" ]; then
            info "Cloning $plugin..."
            git clone ${PLUGINS[$plugin]} "$zsh_dir/$plugin"
            success "$plugin installed"
        else
            info "$plugin already present, skipping"
        fi
    done
}

set_default_shell_zsh() {
    if [ "$SHELL" != "$(which zsh)" ]; then
        header "Setting zsh as default shell"
        chsh -s "$(which zsh)"
        success "Default shell changed to zsh (re-login to apply)"
    fi
}
