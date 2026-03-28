<div align="center">

# 🛠️ back-up-tools

**Personal Linux dotfiles & auto-install script**

Clone on a fresh machine → run one command → everything is ready.

![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white)
![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![Shell Script](https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white)

</div>

---

## ⚡ Quick Start

```bash
git clone https://github.com/<your-username>/back-up-tools.git ~/back-up-tools
cd ~/back-up-tools
chmod +x install.sh
./install.sh
```

The script will automatically:

1. 🔍 Detect your distro (Arch or Ubuntu/Debian)
2. 📦 Install all packages via the native package manager
3. 🔌 Install Zsh plugins and TPM (Tmux Plugin Manager)
4. 🔗 Symlink all configs into the correct locations
5. 🐚 Set Zsh as the default shell

---

## 📦 Tools Installed

### CLI Essentials

| Tool | Description |
|------|-------------|
| [git](https://git-scm.com/) | Version control |
| [zsh](https://www.zsh.org/) | Main shell |
| [tmux](https://github.com/tmux/tmux) | Terminal multiplexer |
| [neovim](https://neovim.io/) | Text editor |
| [kitty](https://sw.kovidgoyal.net/kitty/) | GPU-accelerated terminal emulator |

### Modern Unix Tools

| Tool | Replaces | Description |
|------|----------|-------------|
| [eza](https://github.com/eza-community/eza) | `ls` | Modern file listing with icons |
| [bat](https://github.com/sharkdp/bat) | `cat` | Syntax highlighting pager |
| [fd](https://github.com/sharkdp/fd) | `find` | Fast and user-friendly file finder |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | `grep` | Fast recursive content search |
| [duf](https://github.com/muesli/duf) | `df` | Better disk usage overview |
| [tree](https://linux.die.net/man/1/tree) | `tree` | Directory structure as a tree |

### Productivity

| Tool | Description |
|------|-------------|
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finder for files, history, etc. |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smarter `cd` — jumps to frecent directories |
| [atuin](https://github.com/atuinsh/atuin) | Shell history with search and sync |
| [yazi](https://github.com/sxyazi/yazi) | Terminal file manager |
| [lazygit](https://github.com/jesseduffield/lazygit) | Terminal UI for git |
| [btop](https://github.com/aristocratos/btop) | Resource monitor (CPU / mem / net / disk) |

### DevOps

| Tool | Description |
|------|-------------|
| [docker](https://www.docker.com/) | Container runtime |
| [lazydocker](https://github.com/jesseduffield/lazydocker) | Terminal UI for Docker |

### Zsh Plugins

| Plugin | Description |
|--------|-------------|
| [Powerlevel10k](https://github.com/romkatv/powerlevel10k) | Fast and customizable Zsh prompt theme |
| [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) | Fish-like command suggestions |
| [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) | Syntax highlighting in the shell |

---

## ⚙️ Configs Included

<details>
<summary><b>🐚 Zsh</b> — <code>configs/zsh/</code></summary>

<br>

- `zshrc` — main Zsh config
- `p10k.zsh` — Powerlevel10k prompt config

**Aliases:**

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

</details>

<details>
<summary><b>🐱 Kitty</b> — <code>configs/kitty/</code></summary>

<br>

- `kitty.conf` — main terminal config
- `current-theme.conf` — Catppuccin Mocha color theme

| Setting | Value |
|---------|-------|
| Font | JetBrainsMono Nerd Font |
| Font size | 12 |
| Background opacity | 0.85 |
| Cursor shape | Beam |
| Tab bar style | Powerline (slanted) |

> [!NOTE]
> Requires **JetBrainsMono Nerd Font** — install via:
> ```bash
> # Arch
> sudo pacman -S ttf-jetbrains-mono-nerd
> # Ubuntu
> sudo apt install fonts-jetbrains-mono
> ```

| Keybinding | Action |
|------------|--------|
| `Ctrl+Shift+T` | New tab in current directory |
| `Ctrl+Shift+Enter` | New window in current directory |

</details>

<details>
<summary><b>📟 Tmux</b> — <code>configs/tmux/</code></summary>

<br>

- `.tmux.conf` — main tmux config

> [!IMPORTANT]
> Prefix key has been changed from `Ctrl+B` → **`Ctrl+Space`**

**Plugins (via [TPM](https://github.com/tmux-plugins/tpm)):**

| Plugin | Description |
|--------|-------------|
| [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible) | Sensible default settings |
| [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) | Save and restore sessions |
| [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum) | Auto-save sessions continuously |
| [tmux-yank](https://github.com/tmux-plugins/tmux-yank) | Copy to system clipboard |
| [tmux-open](https://github.com/tmux-plugins/tmux-open) | Open files/URLs from tmux |
| [tmux-fzf](https://github.com/sainnhe/tmux-fzf) | Manage tmux with fzf |
| [catppuccin/tmux](https://github.com/catppuccin/tmux) | Catppuccin Mocha theme |

After install, open tmux and press **`Ctrl+Space + I`** to install plugins.

**Pane navigation** (shared with Neovim via [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)):

| Key | Action |
|-----|--------|
| `Ctrl+H` | Move to left pane |
| `Ctrl+J` | Move to bottom pane |
| `Ctrl+K` | Move to top pane |
| `Ctrl+L` | Move to right pane |

</details>

<details>
<summary><b>🗂️ Yazi</b> — <code>configs/yazi/</code></summary>

<br>

- `yazi.toml` — file manager config

| Setting | Value |
|---------|-------|
| Show hidden files | enabled |
| Default editor | `nvim` |

</details>

<details>
<summary><b>📊 Btop</b> — <code>configs/btop/</code></summary>

<br>

- `btop.conf` — main config
- `themes/caelestia.theme` — custom color theme

| Setting | Value |
|---------|-------|
| Theme | caelestia (included) |
| Background | transparent |
| Graph style | braille (high resolution) |

</details>

<details>
<summary><b>🦥 Lazygit</b></summary>

<br>

No custom config — uses default settings.

</details>

<details>
<summary><b>🦇 Bat</b></summary>

<br>

No config file — works out of the box with syntax highlighting.

> [!NOTE]
> On Ubuntu/Debian, `bat` is installed as `batcat`. Add this alias if needed:
> ```bash
> alias bat='batcat'
> ```

</details>

---

## 📝 Neovim

Neovim is installed by this script but **no config is included here**.
Config lives in a separate repo → [AssachanDev/nvim](https://github.com/AssachanDev/nvim)

---

## 📁 Project Structure

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
