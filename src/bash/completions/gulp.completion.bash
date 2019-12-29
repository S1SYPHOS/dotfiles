#!/usr/bin/env bash

# Borrowed from grunt-cli
# By Tyler Kellen, contributors
# Distributed under the MIT license

function _gulp_completions() {
    # The currently-being-completed word.
    local cur="${COMP_WORDS[COMP_CWORD]}"
    #Grab tasks
    local compls=$(gulp --tasks-simple)
    # Tell complete what stuff to show.
    COMPREPLY=($(compgen -W "$compls" -- "$cur"))
}

complete -o default -F _gulp_completions gulp
