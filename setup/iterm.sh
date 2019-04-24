#!/bin/bash

# Assuming running from root dir
source ./utils.sh

ITERM_PROFILE_DIR="$HOME/Library/Application Support/iTerm2/DynamicProfiles"
ITERM_PROTILE_FILE="$ITERM_PROFILE_DIR/profiles.json"

copyitermprofiles () {
  cp ./files/profiles.json "$ITERM_PROTILE_FILE"
  sed -i -E s#/Users/amphro#/Users/$USER#g "$ITERM_PROTILE_FILE"
 # "Working Directory": "/Users/$USER",
}

if [ -d "$ITERM_PROFILE_DIR" ]; then
  statusmsg Setup "iTerm2 installed. Checking profile."
  if [ -f "$ITERM_PROTILE_FILE" ]; then
    echo "Do you wish to override the iterm profiles file with the ./files/profiles.json defaults?"
    select yn in "Yes" "No"; do
        case $yn in
            Yes ) copyitermprofiles; break;;
            No ) break;;
        esac
    done
  else
    copyitermprofiles
  fi
else
  statuserr "iterm2 v2.9.20140923 and later is not installed"
  statuserr "    Install it via https://www.iterm2.com/" 
fi
