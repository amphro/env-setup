#!/bin/bash

# Assuming running from root dir
source ./utils.sh

if which fzf; then
  statusmsg Setup "fuzzy is already installed"
else
  statusmsg Setup 'Installing fuzzy search'

  brew install fzf
fi

if ! grep -qF 'source <(fzf --zsh)' "$RC_FILE" 2>/dev/null; then
  statusmsg Setup "adding fzf shell integration to $RC_FILE"
  echo 'source <(fzf --zsh)' >> "$RC_FILE"
fi
