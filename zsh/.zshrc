# ------------------------------------------
# Path and Oh-My-Zsh setup
# ------------------------------------------

export ZSH="$HOME/.oh-my-zsh"

# Set your preferred theme; "robbyrussell" is simple, customize as you like
ZSH_THEME="robbyrussell"

# Enable plugins; keep minimal for fast startup
plugins=(git)

# Source Oh-My-Zsh framework
source $ZSH/oh-my-zsh.sh

# ------------------------------------------
# Shell Behavior and Completion Settings
# ------------------------------------------

# Case-insensitive completion (uncomment to enable)
# CASE_SENSITIVE="false"

# Hyphen insensitive completion (allows '-' and '_' interchangeably)
# HYPHEN_INSENSITIVE="true"

# Enable command auto-correction
ENABLE_CORRECTION="true"

# Display waiting dots during completion
COMPLETION_WAITING_DOTS="true"

# Disable marking untracked files dirty to speed up large repos
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Prompt color disabling (if needed)
# DISABLE_LS_COLORS="true"

# Disable automatic terminal title setting (if undesired)
# DISABLE_AUTO_TITLE="true"

# ------------------------------------------
# Environment Variables
# ------------------------------------------

# Set default editor to Neovim
export EDITOR="nvim"

# Node Version Manager (nvm) setup if installed system-wide
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
if [ -s "/usr/share/nvm/nvm.sh" ]; then
  source "/usr/share/nvm/nvm.sh"
  source "/usr/share/nvm/bash_completion"
  source "/usr/share/nvm/init-nvm.sh"
fi

# Custom environment variables

# ------------------------------------------
# Aliases
# ------------------------------------------

# Clipboard aliases using xclip for Linux
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# Editor aliases
alias vi="nvim"

# ------------------------------------------
# User-specific configurations
# ------------------------------------------

# Add any customizations or functions below

# Example: reload zsh configuration
alias reload="source ~/.zshrc"
run-win() {
    echo "🔨 Compilando para Windows..."
    cargo xwin build --target x86_64-pc-windows-msvc

    # --- AUTO-DETECCION START ---
    # Preguntamos a cargo metadata por el nombre del paquete y lo limpiamos
    APP_NAME=$(cargo metadata --no-deps --format-version 1 | jq -r '.packages[0].targets[] | select(.kind[]=="bin") | .name' | head -n 1)

    # Si por alguna razón falla, fallback a 'app' o error
    if [ -z "$APP_NAME" ]; then echo "❌ No pude detectar el nombre del binario"; return 1; fi
    EXE_PATH="target/x86_64-pc-windows-msvc/debug/${APP_NAME}.exe"
    if [ ! -f "$EXE_PATH" ]; then
        echo "❌ Error: No encuentro el ejecutable en: $EXE_PATH"
        echo "   (Verifica que la compilación terminó bien)"
        return 1
    fi

    # Ajusta tu usuario de Windows aquí o usa una variable de entorno
    WIN_USER="sergi"
    WIN_PATH="/mnt/c/Users/${WIN_USER}/Desktop/${APP_NAME}.exe"

    echo "🚀 Copiando ${APP_NAME}.exe a Windows..."
    cp "$EXE_PATH" "$WIN_PATH"

    echo "🎮 Ejecutando..."
    cmd.exe /C "start $WIN_PATH"
}

# PATH
# user bin
export PATH="$HOME/bin:/usr/local/bin:$PATH"

# global npm packages
export PATH="$HOME/.npm-global/bin:$PATH"

# snap packages
export PATH="/snap/bin:$PATH"
