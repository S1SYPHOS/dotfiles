## VIRTUALENVWRAPPER ##

if [ -f "$PYTHONUSERBASE/bin/virtualenvwrapper.sh" ]; then
    # Loads virtualenvwrapper + sets aliases
    source "$PYTHONUSERBASE/bin/virtualenvwrapper.sh"

    # virtualenvwrapper aliases @bbengfort
    # See https://gist.github.com/bbengfort/246bc820e76b48f71df7
    alias venv="workon"
    alias venv.exit="deactivate"
    alias venv.ls="lsvirtualenv"
    alias venv.show="showvirtualenv"
    alias venv.init="mkvirtualenv"
    alias venv.rm="rmvirtualenv"
    alias venv.switch="workon"
    alias venv.add="add2virtualenv"
    alias venv.cd="cdproject"
    alias venv.cdsp="cdsitepackages"
    alias venv.cdenv="cdvirtualenv"
    alias venv.lssp="lssitepackages"
    alias venv.proj="mkproject"
    alias venv.setproj="setvirtualenvproject"
    alias venv.wipe="wipeenv"
fi

# For more information,
# see https://virtualenvwrapper.readthedocs.io
##
