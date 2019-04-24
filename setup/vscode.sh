#!/bin/bash

# Assuming running from root dir
source ./utils.sh

if which code; then
  statusmsg Setup "VS Code installed. Checking user settings."
  if [ -f "$HOME/Library/Application Support/Code/User/settings.json" ]; then
    echo "Do you wish to override the VS code usersettings file with the ./files/settings.json defaults?"
    select yn in "Yes" "No"; do
        case $yn in
            Yes ) cp ./files/settings.json "$HOME/Library/Application Support/Code/User/settings.json"; break;;
            No ) break;;
        esac
    done
  else
    cp ./files/settings.json "$HOME/Library/Application Support/Code/User/settings.json"
  fi
else
  statuserr "VS Code is not installed or added to the path"
  statuserr "    Install it via https://code.visualstudio.com or add it to your path with the VS code palette command  \"Install 'code' command in PATH\"" 
fi
