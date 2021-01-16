#!/usr/bin/env bash

##################
#  BASH EXPORTS  #
##################

## ENVIRONMENT ##

# Prefer US English and use UTF-8
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Make vim the default editor
export EDITOR="vim" VISUAL="vim"

# Make fontconfig work (?)
export FONTCONFIG_PATH='/etc/fonts'
export FONTCONFIG_FILE='fonts.config'

# Make Python use UTF-8 encoding for stdin, stdout & stderr output
export PYTHONIOENCODING="UTF-8"


## XDG DIRECORY SETUP ##

XDG_LOCAL=$HOME/.local

# Standard
export XDG_CACHE_HOME=$HOME/.cache      # user-specific non-essential (cached) data
export XDG_CONFIG_HOME=$HOME/.config    # user-specific configuration files
export XDG_DATA_HOME=$XDG_LOCAL/share   # user-specific data files

# Non-standard
export XDG_BIN_HOME=$XDG_LOCAL/bin
export XDG_LIB_HOME=$XDG_LOCAL/lib

unset XDG_LOCAL

# user-specific runtime files and other file objects
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

# Bash / less history file
mkdir -p "$XDG_DATA_HOME"/bash
export HISTFILE=$XDG_DATA_HOME/bash/bash_history

mkdir -p "$XDG_DATA_HOME"/less
export LESSHISTFILE="$XDG_DATA_HOME"/less/less_history

# cURL
export CURL_HOME=$XDG_CONFIG_HOME/cURL;

# GnuPG
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg

# Readline settings & bindings
export INPUTRC=$XDG_CONFIG_HOME/readline/inputrc

# GNU Wget
export WGETRC=$XDG_CONFIG_HOME/wget/wgetrc

# Python
export PYTHONUSERBASE=$XDG_LIB_HOME/python;

# Composer
export COMPOSER_HOME=$XDG_LIB_HOME/php;

# Starship
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/config.toml

# NPM
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export NPM_CONFIG_CACHE=$XDG_CACHE_HOME/npm
export NPM_CONFIG_TMP=$XDG_RUNTIME_DIR/npm

# RubyGem
export GEM_HOME=$XDG_DATA_HOME/gem
export GEMRC=$XDG_CONFIG_HOME/gem/gemrc;
export GEM_SPEC_CACHE=$XDG_CACHE_HOME/gem

# Rust
export CARGO_HOME=$XDG_LIB_HOME/rust


## BUILD PATH ##

# System path
LOCAL_PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"

# Language-specific binaries / scripts
LOCAL_PATH="$XDG_LIB_HOME/ruby:$LOCAL_PATH"
LOCAL_PATH="$XDG_LIB_HOME/php/vendor/bin:$LOCAL_PATH"
LOCAL_PATH="$XDG_LIB_HOME/npm/bin:$LOCAL_PATH"
LOCAL_PATH="$XDG_LIB_HOME/python/bin:$LOCAL_PATH"
LOCAL_PATH=$XDG_LIB_HOME/rust/bin:$LOCAL_PATH

# Language-agnostic binaries / scripts
LOCAL_PATH="$XDG_BIN_HOME:$LOCAL_PATH"

# Adding collected local paths to $PATH
export PATH=$LOCAL_PATH

unset LOCAL_PATH


## IMPROVED MANUAL PAGES ##

export LESS="--ignore-case --RAW-CONTROL-CHARS --no-init"

if command -v nvim &> /dev/null; then
    export MANPAGER='nvim +Man!'
else
    export MANPAGER='less -s -M +Gg'

    man() {
        env \
            LESS_TERMCAP_mb=$'\E[1;34m' \
            LESS_TERMCAP_md=$'\E[1;34m' \
            LESS_TERMCAP_me=$'\E[0m' \
            LESS_TERMCAP_so=$'\E[01;35m' \
            LESS_TERMCAP_se=$'\E[0m' \
            LESS_TERMCAP_us=$'\E[1;32m' \
            LESS_TERMCAP_ue=$'\E[0m' \
            man "$@"
    }
fi
