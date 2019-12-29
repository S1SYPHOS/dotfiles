#!/bin/bash

##################
#  BASH EXPORTS  #
##################

# Make vim the default editor.
export EDITOR='vim' VISUAL='vim';

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr
export PYTHONIOENCODING='UTF-8';

# Change Python's user-installation directory
export PYTHONUSERBASE=~/.bin/python;

# Change Composer's global installation directory
export COMPOSER_HOME=~/.bin/php;

# Prefer US English and use UTF-8
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# TODO: Highlight section titles in manual pages
# export LESS_TERMCAP_md="${yellow}";

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';
