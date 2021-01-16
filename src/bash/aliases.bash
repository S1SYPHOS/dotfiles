#!/usr/bin/env bash

##################
#  BASH ALIASES  #
##################

## BASICS ##

# Allow aliases to be with sudo
alias sudo="sudo "

# Ask if really, really sure to ..
alias cp="cp -vi" # .. copy
alias mv="mv -vi" # .. move
alias rm="rm -vI" # .. burn

# Human-readable disk commands
alias du="du -kh"
alias df="df -kTh"
alias dd="dd status=progress"
alias free="free -h --giga"

# Listing files
alias l="ls -CF --color"
alias la="ls -A --color"
alias ll="ls -alF --color"

# Replace previous aliases in case `exa` is installed
# See https://github.com/ogham/exa
if command -v exa &> /dev/null; then
    alias l="ls"
    alias ls="exa --git --color=automatic"
    alias ll="exa --git --color=automatic --all --long"
    alias la="exa --git --color=automatic --all --long --binary --group --header"
fi

# Replace `cat` in case `bat` is installed
# See https://github.com/sharkdp/bat
if command -v bat &> /dev/null; then
    alias cat="bat"
fi


## NAVIGATION ##

# Many dots, so levels, wow
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias cd..="cd .."

# Shortcuts
alias c="clear"
alias g="git"
alias h="history"
alias p="cd ~/Documents/projects"
alias :q="exit"


## USEFUL ##

# Update symlinks of dotfiles
alias dotbot="bash ~/.dotfiles/install.sh"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Quick ranking filter
alias rank="sort | uniq -c | sort -n"

# TODO: mktar, mkzip, ..
alias mk7z="7z a -r -t7z -m0=lzma2 -mx=9 -myx=9 -mqs=on -ms=on"

# Copy & paste
alias pbcopy='xclip -selection clipboard' && \
alias pbpaste='xclip -selection clipboard -o'

# Copy public key to clipboard
alias pubkey="pbcopy ~/.ssh/id_rsa.pub | echo '=> Public key copied to pasteboard.'"


## SOFTWARE ##

# Beat it
if command -v podman &> /dev/null; then
    alias docker="podman"
fi

# Replace SSH
# (1) .. with mosh (if present)
if command -v mosh &> /dev/null; then
    alias ssh="mosh"
# (2) .. with SSH kitten (if using Kitty)
elif [ "$TERM" = "xterm-kitty" ]; then
    alias ssh="kitty +kitten ssh"
fi

# Replace ps with procs (if present)
if command -v procs &> /dev/null; then
    alias ps="procs"
fi


## HARDWARE ##

alias motherboard="dmidecode -t 2 | less"
alias cpu="dmidecode -t 4 | less"
alias memory="dmidecode -t 17 | less"
alias cdrom="wodim --devices"


## JUST FOR FUN ##

# Lock the screen (when going AFK) - For locking the screen, use "SUPER+L"
alias afk="sudo systemctl suspend"

# Thinking of http://xkcd.com/530/ - Linux version @mathiasbynens alias
alias stfu="amixer -q sset Master 0%"
alias pumpitup="amixer -q sset Master 100%"
