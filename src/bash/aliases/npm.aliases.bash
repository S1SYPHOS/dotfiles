## NPM ##

if command -v npm >/dev/null 2>&1; then
    alias ni="npm install"
    alias nis="npm install --save"
    alias nid="npm install --save-dev"
    alias nit="npm install-test"
    alias nits="npm install-test --save"
    alias nitd="npm install-test --save-dev"
    alias nu="npm uninstall"
    alias nus="npm uninstall --save"
    alias nusd="npm uninstall --save-dev"
    alias np="npm publish"
    alias nup="npm unpublish"
    alias nlk="npm link"
    alias nod="npm outdated"
    alias nrb="npm rebuild"
    alias nud="npm update"
    alias nr="npm run"
    alias nls="npm list --depth=0 2>/dev/null"
    alias nlsg="npm list -g --depth=0 2>/dev/null"
fi

# For more information,
# see https://www.npmjs.com
##
