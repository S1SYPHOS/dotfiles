#!/bin/bash

##################
#  BASH EXPORTS  #
##################

## GENERAL SETTINGS ##

# Make Python use UTF-8 encoding for stdin, stdout & stderr output
export PYTHONIOENCODING="UTF-8"


## XDG DIRECORY SETUP ##

XDG_HOME=$HOME/.local
export XDG_CACHE_HOME=$XDG_HOME/var/cache
export XDG_CONFIG_HOME=$XDG_HOME/etc
export XDG_DATA_HOME=$XDG_HOME/share
export XDG_STATE_HOME=$XDG_HOME/var/lib
export XDG_LIB_HOME=$XDG_HOME/lib
export XDG_LOG_HOME=$XDG_HOME/var/log

if [ ! -w "${XDG_RUNTIME_DIR:="/run/user/$UID"}" ]; then
    echo "\$XDG_RUNTIME_DIR ($XDG_RUNTIME_DIR) not writable. Setting to /tmp." >&2
    XDG_RUNTIME_DIR=/tmp
fi
export XDG_RUNTIME_DIR

# For more information, see
# - https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
# - https://wiki.archlinux.org/index.php/XDG_Base_Directory_support
##


## FORCE XDG COMPLIANCE ##

LOCAL_PATH=""

# Bash / less history file
mkdir -p "$XDG_STATE_HOME"/bash
export HISTFILE=$XDG_STATE_HOME/bash/bash_history

mkdir -p "$XDG_STATE_HOME"/less
export LESSHISTFILE="$XDG_STATE_HOME"/less/less_history

# cURL
export CURL_HOME=$XDG_CONFIG_HOME/cURL;

# GnuPG
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg

# Readline settings & bindings
export INPUTRC=$XDG_CONFIG_HOME/readline/inputrc

# Python
export PYTHONUSERBASE=$XDG_LIB_HOME/python;
LOCAL_PATH="$XDG_LIB_HOME/python/bin:$LOCAL_PATH"

# Composer
export COMPOSER_HOME=$XDG_LIB_HOME/php;
LOCAL_PATH="$XDG_LIB_HOME/php/vendor/bin:$LOCAL_PATH"

# NPM
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export NPM_CONFIG_CACHE=$XDG_CACHE_HOME/npm
export NPM_CONFIG_TMP=$XDG_RUNTIME_DIR/npm
LOCAL_PATH="$XDG_LIB_HOME/npm/bin:$LOCAL_PATH"

# RubyGem
export GEM_HOME=$XDG_DATA_HOME/gem
export GEMRC=$XDG_CONFIG_HOME/gem/gemrc;
export GEM_SPEC_CACHE=$XDG_CACHE_HOME/gem
LOCAL_PATH="$XDG_LIB_HOME/ruby:$LOCAL_PATH"

# Adding collected local paths to $PATH
export PATH="$LOCAL_PATH$PATH"


## IMPROVED MANUAL PAGES ##

export LESS="--ignore-case --RAW-CONTROL-CHARS --no-init"
export MANPAGER='less -s -M +Gg'

# Needed for gnome-terminal
export GROFF_NO_SGR="1"

man() {
	env \
        LESS_TERMCAP_mb=$'\e[1;31m' \
        LESS_TERMCAP_md=$'\e[1;36m' \
        LESS_TERMCAP_so=$'\e[01;44;37m' \
        LESS_TERMCAP_us=$'\e[01;37m' \
        LESS_TERMCAP_me=$'\e[0m' \
        LESS_TERMCAP_se=$'\e[0m' \
        LESS_TERMCAP_ue=$'\e[0m' \
	    man "$@"
}
