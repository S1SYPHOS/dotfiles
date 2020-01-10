#!/usr/bin/env bash

#################
#  BASH PROMPT  #
#################

# Check if current directory is writable
WRITE() {
     if [ -w "$PWD" ]; then
          echo "WRITABLE"
     else
          echo "NOT WRITABLE"
     fi
}

# Get current git branch
BRANCH() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

# Check if there are unstaged files
DIRTY() {
     if git rev-parse --git-dir > /dev/null 2>&1; then
          if [[ $(git status --porcelain)  ]]; then
               COUNT=$(git status --porcelain | wc -l);

               echo " (${COUNT} dirty files)";
          else
               echo " All clean!"
          fi
     fi
}

load_prompt() {
     local TIME="\A"
     local USER="\u"
     local HOST="\h"
     local PATH="\w"

     # Build PS1
     PS1="[$TIME] $USER@$HOST:$PATH\$(BRANCH)\n└── \$(WRITE)\$(DIRTY) \\$ "
}

load_prompt
