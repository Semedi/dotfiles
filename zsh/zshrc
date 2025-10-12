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

# Optional: add user bin directory to PATH
export PATH="$HOME/bin:/usr/local/bin:$PATH"
