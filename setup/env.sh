#!/bin/bash

## Common variables and aliases and sets them in the RC file to be 
## loaded in the shell's environment

# Assuming running from root dir
source ./utils.sh

LOCAL_NODE_PATH='export PATH=./node_modules/.bin/:$PATH'
ADDED_ZSH_COMMENT="# Added by https://github.com/amphro/env-setup"

if ! grep -q "$ADDED_ZSH_COMMENT" "$RC_FILE"; then
  statusmsg Setup "adding custom prompt, path, and other env to $RC_FILE"
  echo "# --------------------------------------------------------" >> "$RC_FILE"
  echo "$ADDED_ZSH_COMMENT" >> "$RC_FILE"
  echo "#   from $(pwd)" >> "$RC_FILE"
  echo "# --------------------------------------------------------" >> "$RC_FILE"
  echo "$LOCAL_NODE_PATH" >> "$RC_FILE"
  echo "DEFAULT_USER=$USER" >> "$RC_FILE"
  echo '' >> "$RC_FILE"
  echo 'prompt_time() {' >> "$RC_FILE"
  echo '  prompt_segment "green" "black" " $(date +%H:%M:%S) "' >> "$RC_FILE"
  echo '}' >> "$RC_FILE"
  echo 'PROMPT_SEGMENT_POSITION=2 PROMPT_SEGMENT_NAME="prompt_time"' >> "$RC_FILE"
  echo 'AGNOSTER_PROMPT_SEGMENTS=("${AGNOSTER_PROMPT_SEGMENTS[@]:0:$PROMPT_SEGMENT_POSITION-1}" "$PROMPT_SEGMENT_NAME" "${AGNOSTER_PROMPT_SEGMENTS[@]:$PROMPT_SEGMENT_POSITION-1}")' >> "$RC_FILE"
  echo 'unset PROMPT_SEGMENT_POSITION PROMPT_SEGMENT_NAME' >> "$RC_FILE"
  echo '' >> "$RC_FILE"
  echo 'export GPG_TTY=$(tty)' >> "$RC_FILE"
  echo '' >> "$RC_FILE"
  if ! grep -q "NVM_DIR" "$RC_FILE"; then
    echo '# Extracted from nvm install as of 6/2/2020 - it may need to be updated at some point in the future' >> "$RC_FILE"
    echo 'export NVM_DIR="$HOME/.nvm"' >> "$RC_FILE"
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' >> "$RC_FILE"
    echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' >> "$RC_FILE"
  fi
  echo "# --------------------------------------------------------" >> "$RC_FILE"
fi
