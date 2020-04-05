#!/bin/bash

if [[ $* =~ -r ]]; then
	RESTART=1
fi

if >/dev/null which dpkg && >/dev/null which apt; then
	>/dev/null which python || \
	>/dev/null which python3 || \
	sudo apt install -y python || \
	sudo apt install -y python3
fi

__DIR__=$(dirname "$0")
echo STARTING... "$@"
RESTART=$RESTART bash --rcfile "$__DIR__/.bashrc"
