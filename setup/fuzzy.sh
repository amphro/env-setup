#!/bin/bash

# Assuming running from root dir
source ./utils.sh

if which fzf; then
  statusmsg Setup "fuzzy is already installed"
else
  statusmsg Setup 'Installing fuzzy search'

  brew install fzf

  # To install useful key bindings and fuzzy completion:
  $(brew --prefix)/opt/fzf/install
fi
