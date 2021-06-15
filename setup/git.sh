#!/bin/bash

# Assuming running from root dir
source ./utils.sh

# Will prompt if not installed
git --version

if [ -f "$HOME/.gitconfig" ]; then
  echo "Your gitconfig file is already setup"
else
  cp ./files/.gitconfig "$HOME/.gitconfig"
  echo "The ./files/.gitconfig file was copied to $HOME/.gitconfig. Override email or any value as needed"
fi