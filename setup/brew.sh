#!/bin/bash

# Assuming running from root dir
source ./utils.sh

if which brew; then
  statusmsg Setup "brew is already installed"
else
  statusmsg Setup 'Intalling brew'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi