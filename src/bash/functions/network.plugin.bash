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
