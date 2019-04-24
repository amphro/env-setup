#!/bin/bash

# Assuming running from root dir
source ./utils.sh

statusmsg Setup 'Intalling fuzzy search'

brew install fzf

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install
