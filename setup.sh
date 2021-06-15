#!/bin/bash

# SYSTEM SETUP
./setup/brew.sh

# TERMINAL SETUP
# Install zsh first to make sure we have a zsh file
./setup/zsh.sh
./setup/fuzzy.sh
./setup/env.sh

# TOOL SETUP
./setup/iterm.sh
./setup/vscode.sh