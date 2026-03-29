#!/bin/bash
# ============================================================
#  check_tools.sh — verify all tools are working correctly
# ============================================================

PASS=0
FAIL=0
WARN=0

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BOLD='\033[1m'
RESET='\033[0m'

ok()   { echo -e "  ${GREEN}[OK]${RESET}   $1"; ((PASS++)); }
fail() { echo -e "  ${RED}[FAIL]${RESET} $1"; ((FAIL++)); }
warn() { echo -e "  ${YELLOW}[WARN]${RESET} $1"; ((WARN++)); }
header() { echo -e "\n${BOLD}==> $1${RESET}"; }

check_cmd() {
    local cmd="$1"
    local display="${2:-$cmd}"
    if command -v "$cmd" &>/dev/null; then
        ok "$display → $(command -v "$cmd")"
        return 0
    else
        fail "$display — not found"
        return 1
    fi
}

check_version() {
    local cmd="$1"
    local flag="${2:---version}"
    local display="${3:-$cmd}"
    if command -v "$cmd" &>/dev/null; then
        local ver
        ver=$("$cmd" $flag 2>&1 | head -1)
        ok "$display — $ver"
    else
        fail "$display — not found"
    fi
}

# ── CLI Essentials ────────────────────────────────────────────
header "CLI Essentials"
check_version git "--version"
check_version zsh "--version"
check_version nvim "--version" "neovim"
check_version tmux "-V"
check_version python3 "--version"

# ── Modern Unix Tools ─────────────────────────────────────────
header "Modern Unix Tools"
check_version eza "--version"
check_version rg "--version" "ripgrep"
check_version fzf "--version"
check_version duf "--version"
check_version tree "--version"
check_version btop "--version"

# bat / batcat (Ubuntu installs as batcat)
if command -v bat &>/dev/null; then
    check_version bat "--version"
elif command -v batcat &>/dev/null; then
    ok "bat → $(command -v batcat)  (aliased as batcat on Ubuntu)"
else
    fail "bat — not found"
fi

# fd / fdfind (Ubuntu installs as fdfind)
if command -v fd &>/dev/null; then
    check_version fd "--version"
elif command -v fdfind &>/dev/null; then
    ok "fd → $(command -v fdfind)  (aliased as fdfind on Ubuntu)"
else
    fail "fd — not found"
fi

# ── Productivity ──────────────────────────────────────────────
header "Productivity"
check_version zoxide "--version"
check_version atuin "--version"
check_version yazi "--version"
check_version lazygit "--version"

# ── DevOps ────────────────────────────────────────────────────
header "DevOps"
check_version docker "--version"
check_cmd lazydocker

# ── Zsh Plugins ───────────────────────────────────────────────
header "Zsh Plugins"
[ -d "$HOME/.oh-my-zsh" ] \
    && ok "oh-my-zsh → $HOME/.oh-my-zsh" \
    || fail "oh-my-zsh — not found"

[ -d "$HOME/.config/zsh/powerlevel10k" ] \
    && ok "powerlevel10k → $HOME/.config/zsh/powerlevel10k" \
    || fail "powerlevel10k — not found"

[ -d "$HOME/.config/zsh/zsh-autosuggestions" ] \
    && ok "zsh-autosuggestions → $HOME/.config/zsh/zsh-autosuggestions" \
    || fail "zsh-autosuggestions — not found"

[ -d "$HOME/.config/zsh/zsh-syntax-highlighting" ] \
    && ok "zsh-syntax-highlighting → $HOME/.config/zsh/zsh-syntax-highlighting" \
    || fail "zsh-syntax-highlighting — not found"

# ── Configs ───────────────────────────────────────────────────
header "Configs (symlinks)"
check_link() {
    local path="$1"
    local label="$2"
    if [ -L "$path" ]; then
        ok "$label → $(readlink -f "$path")"
    elif [ -e "$path" ]; then
        warn "$label — exists but not a symlink"
    else
        fail "$label — not found"
    fi
}

check_link "$HOME/.zshrc"           ".zshrc"
check_link "$HOME/.p10k.zsh"        ".p10k.zsh"
check_link "$HOME/.tmux.conf"       ".tmux.conf"
check_link "$HOME/.config/kitty"    "kitty config"
check_link "$HOME/.config/yazi"     "yazi config"
check_link "$HOME/.config/btop"     "btop config"

[ -d "$HOME/.tmux/plugins/tpm" ] \
    && ok "TPM → $HOME/.tmux/plugins/tpm" \
    || fail "TPM — not found (run install.sh)"

# ── Summary ───────────────────────────────────────────────────
echo ""
echo -e "${BOLD}────────────────────────────────────${RESET}"
echo -e "  ${GREEN}Passed${RESET}  : $PASS"
[ $WARN -gt 0 ] && echo -e "  ${YELLOW}Warnings${RESET}: $WARN"
[ $FAIL -gt 0 ] && echo -e "  ${RED}Failed${RESET}  : $FAIL"
echo -e "${BOLD}────────────────────────────────────${RESET}"

[ $FAIL -eq 0 ] && echo -e "\n${GREEN}${BOLD}All tools OK!${RESET}" || echo -e "\n${RED}${BOLD}Some tools missing — re-run install.sh${RESET}"
