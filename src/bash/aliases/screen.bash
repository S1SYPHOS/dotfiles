if type screen >/dev/null 2>&1; then
    alias sc="screen"
    alias scl="screen -ls"

    alias sca="screen -r"
    alias scd="screen -d"

    # XDG compliance
    # TODO: Recover screenrc from backup drive :)
    export SCREENRC="$XDG_CONFIG_HOME/screen/screenrc"
fi
