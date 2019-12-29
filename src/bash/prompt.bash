#!/bin/bash

#################
#  BASH PROMPT  #
#################

# By path
if [ -w "/path/to/dir" ]; then echo "WRITABLE"; else echo "NOT WRITABLE"; fi

# Current dir
if [ -w "$PWD" ]; then echo "WRITABLE"; else echo "NOT WRITABLE"; fi

# Get current git branch
git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

dirty() {
     if git rev-parse --git-dir > /dev/null 2>&1; then
          if [[ $(git status --porcelain)  ]]; then
               number=$(git status --porcelain | wc -l);
               echo "dirty ${number}";
          else
               echo "clean"
          fi
     fi
}

load_prompt() {
     local TIME="\A"
     local USER="\u"
     local HOST="\h"
     local PATH="\w"

     # Build PS1
     PS1="[$TIME] $USER@$HOST:$PATH\$(git_branch)\n\\$ \$(dirty)"
}

load_prompt
