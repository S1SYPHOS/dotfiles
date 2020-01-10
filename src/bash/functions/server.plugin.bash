# See https://gist.github.com/willurd/5720255

# TODO: Python v3.x
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
