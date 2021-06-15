#!/bin/bash

# Assuming running from root dir
source ./utils.sh

if which nvm; then
  statusmsg Setup "nvm is already installed"
else
  statusmsg Setup 'Installing nvm v0.38.0'

  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

  # Use latest
  nvm install node
  nvm use node
fi
