#!/bin/bash

set -euo pipefail


help(){
    echo "ampache.sh [arch|opensuse|ubuntu]"
    echo 
    echo "  Simulates starting ampache in docker by using vagrant"
    echo "  Once docker-compose has started and is quiet,"
    echo "  you can open http://localhost:8080"
    echo
    echo "  If a Vagrantfile exists, the argument is optional and"
    echo "  will simply try to start docker-compose in the VM"
}

OS="${1:-}"

case "${OS}" in
    arch|opensuse|ubuntu)
	if [[ -e Vagrantfile ]] ; then
	    echo "Destroying existing VM"
	    vagrant destroy -f
	fi
	echo "Switching to ${OS}"
	cp "${OS}.Vagrantfile" "Vagrantfile"
	;;
    *)
	if [[ ! -e Vagrantfile ]] ; then
	    echo "No OS provided and no Vagrantfile present" > /dev/sterr
	    help
	    exit 1
	fi
esac

vagrant up --provision
vagrant ssh -c "cd ampache; docker-compose up"

