#!/bin/bash

# Assuming running from root dir
source ./utils.sh

if which nvm; then
  statusmsg Setup "nvm is already installed"
else
  statusmsg Setup 'Installing nvm v0.40.7'

  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.7/install.sh | bash

  # the installer only defines the nvm function in new shells, load it here too
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

  # Use latest
  nvm install node
  nvm use node
fi
