## CURL ##

if command -v curl >/dev/null 2>&1; then
    alias cl="curl -L" # follow redirects
    alias clo="curl -L -O" # Like cl, download as original name
    alias cloc="curl -L -C - -O" # Like clo, continue
    alias clocr="curl -L -C - -O --retry 5" # Like clo, retry five times
    alias clb="curl -L -I" # Like cl, fetch banner
    alias clhead="curl -D - -so /dev/null" # Show only GET request"s response headers
fi

# For more information,
# see https://curl.haxx.se
##
