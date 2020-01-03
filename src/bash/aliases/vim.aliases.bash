## VIM ##

VIM=$(command -v vim)
GVIM=$(command -v gvim)
MVIM=$(command -v mvim)

if [[ -n $VIM ]]; then
    alias e='$VIM'
    export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
fi

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
