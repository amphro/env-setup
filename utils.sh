#!/bin/bash

RC_FILE="$HOME/.zshrc"

statusmsg () {
   printf "\e[44;37m \e[1m$1\e[21m ⌁ $2... \e[0m\n"
}

statuserr () {
   printf "\e[41;97m \e[1mError\e[21m ⌁ $1 \e[0m\n"
}
