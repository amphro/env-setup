#!/bin/bash

## Common variables and aliases and sets them in the RC file to be 
## loaded in the shell's environment

# Assuming running from root dir
source ./utils.sh

LOCAL_NODE_PATH='export PATH=./node_modules/.bin/:$PATH'
if ! grep -q "$LOCAL_NODE_PATH" "$RC_FILE"; then
  statusmsg Setup "adding local node_module/.bin to PATH"
  echo "$LOCAL_NODE_PATH" >> "$RC_FILE"
fi