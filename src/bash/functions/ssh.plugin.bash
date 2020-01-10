# SSH helper functions

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
