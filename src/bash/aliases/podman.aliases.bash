## PODMAN [-COMPOSE] ##

###
# PODMAN
###

if command -v podman >/dev/null 2>&1; then
    # Beat it
    alias docker="podman"

    alias pk="podman"
    alias pklc="podman ps -l"  # List last Podman container
    alias pklcid="podman ps -l -q"  # List last Podman container ID
    alias pklcip='podman inspect -f "{{.NetworkSettings.IPAddress}}" $(podman ps -l -q)'  # Get IP of last Podman container
    alias pkps="podman ps"  # List running Podman containers
    alias pkpsa="podman ps -a"  # List all Podman containers
    alias pki="podman images"  # List Podman images
    alias pkrmac='podman rm $(podman ps -a -q)'  # Delete all Podman containers

    case $OSTYPE in
      darwin*|*bsd*|*BSD*)
        alias pkrmui="podman images -q -f dangling=true | xargs podman rmi"  # Delete all untagged Podman images
        ;;
      *)
        alias pkrmui="podman images -q -f dangling=true | xargs -r podman rmi"  # Delete all untagged Podman images
        ;;
    esac

    alias pkelc='podman exec -it $(pklcid) bash --login' # Enter last container (works with Podman 1.3 and above)
    alias pkrmflast='podman rm -f $(pklcid)'
    alias pkbash="pkelc"
    alias pkex="podman exec -it " # Useful to run any commands into container without leaving host
    alias pkri="podman run --rm -i "
    alias pkrit="podman run --rm -it "

    # Added more recent cleanup options from newer podman versions
    alias pkip="podman image prune -a -f"
    alias pkvp="podman volume prune -f"
    alias pksp="podman system prune -a -f"
fi

###
# PODMAN-COMPOSE
###

if command -v podman-compose >/dev/null 2>&1; then
    alias pco="podman-compose"
    alias pcofresh="podman-compose-fresh"
    alias pcol="podman-compose logs -f --tail 100"
    alias pcou="podman-compose up"
fi

# For more information,
# see https://podman.io & https://github.com/containers/podman-compose
##
