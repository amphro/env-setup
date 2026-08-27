#!/bin/bash

# Assuming running from root dir
source ./utils.sh

# oh-my-zsh only exports $ZSH once it's sourced into an interactive shell,
# which hasn't happened yet on a fresh machine, so set it ourselves.
export ZSH="$HOME/.oh-my-zsh"

if [ -d "$ZSH" ]; then
  statusmsg Setup "oh-my-zsh is already installed"
else
  statusmsg Setup "installing oh-my-zsh"
  # KEEP_ZSHRC=yes: we wire $RC_FILE up ourselves below, since the installer's
  # zshrc handling is unreliable when run non-interactively from this script.
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if ! brew list --cask font-hack-nerd-font >/dev/null 2>&1; then
  statusmsg Setup "installing Nerd Font"
  brew install --cask font-hack-nerd-font
fi

# agnoster ships as a built-in oh-my-zsh theme, no separate download needed

if ! grep -qF 'source $ZSH/oh-my-zsh.sh' "$RC_FILE" 2>/dev/null; then
  statusmsg Setup "wiring oh-my-zsh into $RC_FILE"
  TMP_FILE="$(mktemp)"
  {
    echo "export ZSH=\"$ZSH\""
    echo 'ZSH_THEME="agnoster"'
    echo 'plugins=(git)'
    echo 'source $ZSH/oh-my-zsh.sh'
    echo ''
    cat "$RC_FILE" 2>/dev/null
  } > "$TMP_FILE"
  mv "$TMP_FILE" "$RC_FILE"
fi

statusmsg Setup "setting theme"
if grep -q '^ZSH_THEME=' "$RC_FILE"; then
  sed -i '' -E 's/^ZSH_THEME="[a-zA-Z_-]+"/ZSH_THEME="agnoster"/g' "$RC_FILE"
else
  echo 'ZSH_THEME="agnoster"' >> "$RC_FILE"
fi
