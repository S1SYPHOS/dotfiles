#!/usr/bin/env bash

# Loads the system's Bash completion modules
if [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
fi

# Some distribution makes use of a profile.d script to import completion
if [ -f /etc/profile.d/bash_completion.sh ]; then
  source /etc/profile.d/bash_completion.sh
fi
