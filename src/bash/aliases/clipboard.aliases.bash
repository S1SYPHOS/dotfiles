## MACOS/X CLIPBOARD FOR LINUX ##

case $OSTYPE in
  linux*)
    XCLIP=$(type xclip)
    [[ $XCLIP ]] && \
    alias pbcopy='$XCLIP -selection clipboard' && \
    alias pbpaste='$XCLIP -selection clipboard -o'
    ;;
esac

# Copy public key to clipboard:
alias pubkey="pbcopy ~/.ssh/id_rsa.pub | echo '=> Public key copied to pasteboard.'"
