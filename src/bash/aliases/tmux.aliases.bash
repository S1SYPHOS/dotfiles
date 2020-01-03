## TMUX ##

if command -v tmux >/dev/null 2>&1; then
    alias tmux='TERM=xterm-256color tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'
    alias txl="tmux ls"
    alias txn="tmux new -s"
    alias txa="tmux a -t"
fi

# For more information,
# see https://github.com/tmux
##
