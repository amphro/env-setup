#!/bin/bash

# Assuming running from root dir
source ./utils.sh

if [ -f "$RC_FILE" ]; then
  statusmsg Setup "ohhmyzsh is already installed"
else
  statusmsg Setup "installing zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [ ! -f "$HOME/Library/Fonts/Droid Sans Mono Slashed for Powerline.ttf" ]; then
  statusmsg Setup "installing fonts"
  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts
  ./install.sh
  cd ..
  # clean up the fonts
  rm -rf fonts
fi

if [ ! -f "$ZSH/custom/themes/agnoster.zsh-theme" ]; then
  statusmsg Setup "downloading theme"
  curl https://raw.githubusercontent.com/agnoster/agnoster-zsh-theme/master/agnoster.zsh-theme > $ZSH/custom/themes/agnoster.zsh-theme
fi

statusmsg Setup "setting theme"
sed -i -E s/^ZSH_THEME=\"[a-zA-Z_-]+\"/ZSH_THEME=\"agnoster\"/g "$RC_FILE"

ADDED_ZSH_COMMENT="# Added by https://github.com/amphro/env-setup"
if ! grep -q "$ADDED_ZSH_COMMENT" "$RC_FILE"; then
  statusmsg Setup "adding custom prompt"
  echo "$ADDED_ZSH_COMMENT" >> "$RC_FILE"
  echo "DEFAULT_USER=$USER" >> "$RC_FILE"
  echo 'prompt_time() {' >> "$RC_FILE"
  echo '  prompt_segment "green" "black" " $(date +%H:%M:%S) "' >> "$RC_FILE"
  echo '}' >> "$RC_FILE"
  echo 'PROMPT_SEGMENT_POSITION=2 PROMPT_SEGMENT_NAME="prompt_time"' >> "$RC_FILE"
  echo 'AGNOSTER_PROMPT_SEGMENTS=("${AGNOSTER_PROMPT_SEGMENTS[@]:0:$PROMPT_SEGMENT_POSITION-1}" "$PROMPT_SEGMENT_NAME" "${AGNOSTER_PROMPT_SEGMENTS[@]:$PROMPT_SEGMENT_POSITION-1}")' >> "$RC_FILE"
  echo 'unset PROMPT_SEGMENT_POSITION PROMPT_SEGMENT_NAME' >> "$RC_FILE"
fi
