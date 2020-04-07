#!/bin/bash

if [[ $* =~ -r ]]; then
	RESTART=1
fi

if >/dev/null which dpkg && >/dev/null which apt; then
	>/dev/null which python || \
	>/dev/null which python3 || \
	sudo apt install -y python || \
	sudo apt install -y python3

        >/dev/null which wget || \
	>/dev/null which curl || \
	sudo apt install -y wget

	>/dev/null which openssl || \
        sudo apt install -y openssl

        >/dev/null which gpg || \
        sudo apt install -y gpg
fi

__DIR__=$(dirname "$0")
echo STARTING... "$@"
RESTART=$RESTART bash --rcfile "$__DIR__/.bashrc"
