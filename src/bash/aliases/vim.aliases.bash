## VIM ##

VIM=$(command -v vim)
GVIM=$(command -v gvim)
MVIM=$(command -v mvim)

[[ -n $VIM ]] && alias e='$VIM'

# Open vim in new tab
# See http://stackoverflow.com/questions/936501/let-gvim-always-run-a-single-instance
case $OSTYPE in
  darwin*)
	[[ -n $MVIM ]] && function mvimt { command mvim --remote-tab-silent "$@" || command mvim "$@"; }
    ;;
  *)
    [[ -n $GVIM ]] && function gvimt { command gvim --remote-tab-silent "$@" || command gvim "$@"; }
    ;;
esac

# For more information,
# see https://www.vim.org
##
