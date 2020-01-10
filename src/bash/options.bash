#!/usr/bin/env bash

##################
#  BASH OPTIONS  #
##################

## GENERAL OPTIONS ##

# Prevent file overwrite on stdout redirection
# Use `>|` to force redirection to an existing file
set -o noclobber

# Update window size after every command
shopt -s checkwinsize

# Turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar 2> /dev/null

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Automatically trim long paths in the prompt
# PROMPT_DIRTRIM=2


## BETTER DIRECTORY NAVIGATION ##

# Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null

# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null

# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null

# This defines where cd looks for targets (separated by colon)
# CDPATH=".:~:~/Documents"

# This allows for bookmarks across the file system ..
shopt -s cdable_vars

# .. by defining a variable containing a path in order to `cd` there
export cd_dotfiles="$HOME/.dotfiles"
export cd_projects="$HOME/Documents/projects"


## HISTORY OPTIONS ##

# Append to the history file, rather than overwriting it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Increase the maximum number of bash commands to remember
HISTSIZE="500000"

# Increase the maximum number of lines contained in the bash history file
HISTFILESIZE="100000"

# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
HISTTIMEFORMAT="%F %T "

# Don't record some commands
HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
