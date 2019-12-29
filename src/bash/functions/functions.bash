#!/bin/bash

####################
#  BASH FUNCTIONS  #
####################

# Create a new directory and enter it
mkcd() {
	mkdir -p "$@"
	cd "$@" || exit
}

# Return external IP where
#	a) `myip 4` returns IPv4
#	b) `myip 6` returns IPv6
myip() {
	local record="A";

	if [ "$*" == "6" ]; then
		record="AAAA"
	fi

	dig @resolver1.opendns.com "$record" myip.opendns.com +short -"$*"
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


# Call from a local repo to open the repository on github/bitbucket in browser
# Modified version of https://github.com/zeke/ghwd
repo() {
	# Figure out github repo base URL
	local base_url
	base_url=$(git config --get remote.origin.url)
	base_url=${base_url%\.git} # remove .git from end of string

	# Fix git@github.com: URLs
	base_url=${base_url//git@github\.com:/https:\/\/github\.com\/}

	# Fix git://github.com URLS
	base_url=${base_url//git:\/\/github\.com/https:\/\/github\.com\/}

	# Fix git@bitbucket.org: URLs
	base_url=${base_url//git@bitbucket.org:/https:\/\/bitbucket\.org\/}

	# Fix git@gitlab.com: URLs
	base_url=${base_url//git@gitlab\.com:/https:\/\/gitlab\.com\/}

	# Validate that this folder is a git folder
	if ! git branch 2>/dev/null 1>&2 ; then
		echo "Not a git repo!"
		exit $?
	fi

	# Find current directory relative to .git parent
	full_path=$(pwd)
	git_base_path=$(cd "./$(git rev-parse --show-cdup)" || exit 1; pwd)
	relative_path=${full_path#$git_base_path} # remove leading git_base_path from working directory

	# If filename argument is present, append it
	if [ "$1" ]; then
		relative_path="$relative_path/$1"
	fi

	# Figure out current git branch
	# git_where=$(command git symbolic-ref -q HEAD || command git name-rev --name-only --no-undefined --always HEAD) 2>/dev/null
	git_where=$(command git name-rev --name-only --no-undefined --always HEAD) 2>/dev/null

	# Remove cruft from branchname
	branch=${git_where#refs\/heads\/}

	[[ $base_url == *bitbucket* ]] && tree="src" || tree="tree"
	url="$base_url/$tree/$branch$relative_path"

	echo "Calling $(type xdg-open) for $url"

	xdg-open "$url" &> /dev/null || (echo "Using $(type xdg-open) to open URL failed." && exit 1);
}

# Start an HTTP server from a directory, optionally specifying the port
server() {
	local port="${1:-8000}";
	sleep 1 && xdg-open "http://localhost:${port}/" &
	# Set the default Content-Type to `text/plain` instead of `application/octet-stream`
	# And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
	python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
}

# Start a PHP server from a directory, optionally specifying the port
# (Requires PHP 5.4.0+.)
phpserver() {
	local port="${1:-4000}";
	sleep 1 && xdg-open "http://localhost:${port}/" &
	php -S "localhost:${port}";
}

# `extract` by Vitalii Tereshchuk - https://dotoca.net
# See https://github.com/xvoland/Extract/blob/master/extract.sh
extract() {
    if [ -z "$1" ]; then
        # display usage if no parameters given
        echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
        echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    else
        for n in "$@"; do
            if [ -f "$n" ] ; then
                case "${n%,}" in
                    *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                    tar xvf "$n"       ;;
                    *.lzma)                 unlzma ./"$n"      ;;
                    *.bz2)                  bunzip2 ./"$n"     ;;
                    *.cbr|*.rar)            unrar x -ad ./"$n" ;;
                    *.gz)                   gunzip ./"$n"      ;;
                    *.cbz|*.epub|*.zip)     unzip ./"$n"       ;;
                    *.z)                    uncompress ./"$n"  ;;
                    *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                                            7z x ./"$n"        ;;
                    *.xz)                   unxz ./"$n"        ;;
                    *.exe)                  cabextract ./"$n"  ;;
                    *.cpio)                 cpio -id < ./"$n"  ;;
                    *.cba|*.ace)            unace x ./"$n"     ;;
                    *)
                    echo "extract: '$n' - unknown archive method"
                    return 1
                    ;;
                esac
            else
                echo "'$n' - file does not exist"
                return 1
            fi
        done
    fi
}

# Update NPM Packages
function npmup() {
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
