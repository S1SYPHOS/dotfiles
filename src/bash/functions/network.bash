## IP ADDRESSES ##

# Displays external IP address
ip_external() {
	local protocol="4"
	local record="A";

	if [ "$1" == "6" ]; then
		protocol="6"
		record="AAAA"
	fi

	dig @resolver1.opendns.com "$record" myip.opendns.com +short -"$protocol"
}

# Displays internal IP address(es)
ip_internal ()
{
    if command -v ifconfig &>/dev/null
    then
        ifconfig | awk '/inet /{ gsub(/addr:/, ""); print $2 }'
    elif command -v ip &>/dev/null
    then
        ip addr | grep -oP 'inet \K[\d.]+'
    else
        echo "You don't have ifconfig or ip command installed!"
    fi
}


## SSH HELPERS ##

# Add entry to SSH config
# param '1: host'
# param '2: hostname'
# param '3: user'

# shellcheck disable=SC2032
ssh-add() {
    echo -en "\n\nHost $1\n  HostName $2\n  User $3\n  ServerAliveInterval 30\n  ServerAliveCountMax 120" >> ~/.ssh/config
}

# List hosts defined in SSH config
ssh-list() {
    awk '$1 ~ /Host$/ {for (i=2; i<=NF; i++) print $i}' ~/.ssh/config
}

# Add all SSH private keys to agent
ssh-add-all() {
    # shellcheck disable=SC2033
    grep -slR "PRIVATE" ~/.ssh | xargs ssh-add
}
