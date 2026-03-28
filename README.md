# back-up-tools

My personal Linux dotfiles and auto-install script. Clone this repo on a fresh machine, run one command, and everything is ready.

**Supports:** Arch Linux · Ubuntu / Debian

---

## Quick Start

```bash
git clone https://github.com/<your-username>/back-up-tools.git ~/back-up-tools
cd ~/back-up-tools
chmod +x install.sh
./install.sh
```

The script will:
1. Auto-detect your distro (Arch or Ubuntu/Debian)
2. Install all packages via the native package manager
3. Install Zsh plugins and TPM (Tmux Plugin Manager)
4. Symlink all configs into the correct locations
5. Set Zsh as the default shell

---

## Tools Installed

| Tool | Description |
|------|-------------|
| [zsh](https://www.zsh.org/) | Main shell |
| [neovim](https://neovim.io/) | Text editor |
| [kitty](https://sw.kovidgoyal.net/kitty/) | GPU-accelerated terminal emulator |
| [tmux](https://github.com/tmux/tmux) | Terminal multiplexer |
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finder for files, history, etc. |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smarter `cd` — jumps to frecent directories |
| [atuin](https://github.com/atuinsh/atuin) | Shell history with search and sync |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | Fast recursive file content search (`rg`) |
| [eza](https://github.com/eza-community/eza) | Modern replacement for `ls` |
| [fd](https://github.com/sharkdp/fd) | Fast and user-friendly `find` replacement |
| [duf](https://github.com/muesli/duf) | Better `df` — disk usage overview |
| [tree](https://linux.die.net/man/1/tree) | Display directory structure as a tree |
| [yazi](https://github.com/sxyazi/yazi) | Terminal file manager |
| [lazygit](https://github.com/jesseduffield/lazygit) | Terminal UI for git |
| [lazydocker](https://github.com/jesseduffield/lazydocker) | Terminal UI for Docker |
| [btop](https://github.com/aristocratos/btop) | Resource monitor (CPU/mem/net/disk) |
| [bat](https://github.com/sharkdp/bat) | `cat` with syntax highlighting |
| [docker](https://www.docker.com/) | Container runtime |
| [git](https://git-scm.com/) | Version control |

### Zsh Plugins

| Plugin | Description |
|--------|-------------|
| [Powerlevel10k](https://github.com/romkatv/powerlevel10k) | Fast and customizable Zsh prompt theme |
| [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) | Fish-like command suggestions |
| [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) | Syntax highlighting in the shell |

---

## Configs Included

### Zsh (`configs/zsh/`)

- `zshrc` — main Zsh config
- `p10k.zsh` — Powerlevel10k prompt config

**Notable aliases:**

```zsh
alias cd='z'           # zoxide instead of cd
alias ls='eza --icons'
alias ll='eza -lh --icons'
alias la='eza -a --icons'
alias tree='eza --tree --icons'
alias nv='nvim'
alias yz='yazi'
alias rg='rg --smart-case'
```

---

### Kitty (`configs/kitty/`)

- `kitty.conf` — main terminal config
- `current-theme.conf` — Catppuccin Mocha color theme

**Notable settings:**

| Setting | Value |
|---------|-------|
| Font | JetBrainsMono Nerd Font |
| Font size | 12 |
| Background opacity | 0.85 (requires a compositor) |
| Cursor shape | Beam |
| Tab bar style | Powerline (slanted) |

> **Note:** Requires **JetBrainsMono Nerd Font** to be installed.
> Download from [nerdfonts.com](https://www.nerdfonts.com/) or install via package manager:
> ```bash
> # Arch
> sudo pacman -S ttf-jetbrains-mono-nerd
> # Ubuntu
> sudo apt install fonts-jetbrains-mono
> ```

**Custom keybindings:**

| Key | Action |
|-----|--------|
| `Ctrl+Shift+T` | New tab in current directory |
| `Ctrl+Shift+Enter` | New window in current directory |

---

### Tmux (`configs/tmux/`)

- `.tmux.conf` — main tmux config

> **Important:** The prefix key has been changed from the default `Ctrl+B` to **`Ctrl+Space`**.

**Plugins (managed via [TPM](https://github.com/tmux-plugins/tpm)):**

| Plugin | Description |
|--------|-------------|
| [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible) | Sensible default settings |
| [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) | Save and restore tmux sessions |
| [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum) | Auto-save sessions continuously |
| [tmux-yank](https://github.com/tmux-plugins/tmux-yank) | Copy to system clipboard |
| [tmux-open](https://github.com/tmux-plugins/tmux-open) | Open files/URLs from tmux |
| [tmux-fzf](https://github.com/sainnhe/tmux-fzf) | Manage tmux with fzf |
| [catppuccin/tmux](https://github.com/catppuccin/tmux) | Catppuccin Mocha theme |

**After the install script runs, install tmux plugins:**

```
tmux
# then press: Ctrl+Space + I   (capital i)
```

**Pane navigation (vim-tmux-navigator style):**

| Key | Action |
|-----|--------|
| `Ctrl+H` | Move to left pane |
| `Ctrl+J` | Move to bottom pane |
| `Ctrl+K` | Move to top pane |
| `Ctrl+L` | Move to right pane |

> These keybindings are shared with Neovim via [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator), allowing seamless navigation between tmux panes and Neovim splits using the same keys.

---

### Yazi (`configs/yazi/`)

- `yazi.toml` — file manager config

**Notable settings:**

| Setting | Value |
|---------|-------|
| Show hidden files | enabled |
| Default editor | `nvim` |

---

### Btop (`configs/btop/`)

- `btop.conf` — main config
- `themes/caelestia.theme` — custom color theme

**Notable settings:**

| Setting | Value |
|---------|-------|
| Theme | caelestia |
| Background transparency | enabled |
| Graph symbol | braille |
| Vim keys | disabled (use arrow keys) |

---

### Lazygit

No custom config included — uses default settings.

---

### Bat

No config file included. `bat` works out of the box with syntax highlighting.

> **Ubuntu note:** On Ubuntu/Debian, `bat` is installed as `batcat`. Add this alias manually if needed:
> ```bash
> alias bat='batcat'
> ```

---

## Neovim

Neovim is installed by this script but **no config is included here**.
My Neovim config lives in a separate repository — clone it independently if needed.

---

## Project Structure

```
back-up-tools/
├── install.sh              # Main entry point
├── scripts/
│   ├── utils.sh            # Logging helpers, link_config()
│   ├── detect_distro.sh    # Auto-detect Arch / Ubuntu / Debian
│   ├── packages_arch.sh    # Arch package list
│   ├── packages_ubuntu.sh  # Ubuntu/Debian package list
│   └── setup_configs.sh    # Symlink configs + install plugins
└── configs/
    ├── zsh/
    ├── kitty/
    ├── tmux/
    ├── yazi/
    └── btop/
```
