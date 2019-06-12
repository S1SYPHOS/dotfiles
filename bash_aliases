#!/usr/bin/env bash

#############
#  ALIASES  #
#############

###
# NAVIGATION
###

# many dots, so levels, wow
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Shortcuts
alias b="firefox"
alias c="clear"
alias d="cd ~/Downloads"
alias g="git"
alias h="history"
alias l="ls -lAh --group-directories-first --color"
alias p="cd ~/Documents/projects"
alias w="cd ~/Documents/work"


###
# BASICS
###

# Allow aliases to be with sudo
alias sudo="sudo "

alias du="du -sh ./* | sort -hr"
alias df="df -Tha --total"


# Lock the screen (when going AFK) - For locking the screen, use 'SUPER+L'
alias afk="sudo systemctl suspend"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Thinking of http://xkcd.com/530/ - @mathiasbynensalias
alias stfu="amixer -q sset Master 0%"
alias pumpitup="amixer -q sset Master 100%"

# List ten most popular commands
alias popular="history | awk '{CMD[\$2]++;count++;}END { for (a in CMD)print CMD[a] \" \" CMD[a]/count*100 \"% \" a;}' | grep -v \"./\" | column -c3 -s \" \" -t | sort -nr | nl |  head -n10"

###
# SOFTWARE
###

alias bi="buildah images"
alias bc="buildah containers"
alias etcher="balena-etcher-electron"
