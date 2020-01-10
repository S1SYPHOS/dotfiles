#!/usr/bin/env bash

####################
#  BASH FUNCTIONS  #
####################

# Create a new directory and enter it
mkcd() {
	mkdir -p "$@"
	cd "$@" || exit
}

# Show disk usage per directory
# $1: target directory (optional)
disk_usage() {
    if [ -n "$1" ]; then
        du -h --max-depth=1 "$1"
    else
        du -h --max-depth=1
    fi
}

# Make your directories and files access rights sane
sanitize_permissions() {
    chmod -R u=rwX,g=rX,o= "$@" ;
}

repeat() {
    local i max
    max=$1; shift;
    for ((i=1; i <= max ; i++)); do
        eval "$@";
    done
}

ask() {
    echo -n "$@" '[y/n] ' ; read -r answer
    case "$answer" in
        y*|Y*) return 0 ;;
        *) return 1 ;;
    esac
}

# Backs up given file with timestamp
backup_file() {
    local filename=$1
    local filetime

    filetime=$(date +%Y%m%d_%H%M%S)
    cp -a "${filename}" "${filename}_${filetime}"
}

# Create a data URL from a file
dataurl() {
	local mimeType
	mimeType=$(file -b --mime-type "$1")

	if [[ $mimeType == text/* ]]; then
		mimeType="${mimeType};charset=utf-8";
	fi

	echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}

# Get a character’s Unicode code point
codepoint() {
	perl -e "use utf8; print sprintf('U+%04X', ord(\"$*\"))"

	# print a newline unless we’re piping the output to another program
	if [ -t 1 ]; then
		echo ""; # newline
	fi
}

# TODO: Update all the things; composer packages + composer, python .. and put into own file
# Update NPM Packages
npmup() {
	for package in $(npm -g outdated --parseable --depth=0 | cut -d: -f4); do
		npm -g install "$package"
	done
}

# Flip a coin
coin() {
	if [ $(( RANDOM % 10 + 1 )) -gt 5 ]; then
		echo 'heads'
	else
		echo 'tails'
	fi
}

## LOAD CUSTOM FUNCTIONS ##

for FUNCTION in "$HOME"/.bash/functions/*.bash; do
    [ -r "$FUNCTION" ] && [ -f "$FUNCTION" ] && source "$FUNCTION";
done

unset FUNCTION
