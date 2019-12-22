#!/bin/bash

if [[ $* =~ -r ]]; then
	RESTART=1
fi

__DIR__=$(dirname "$0")
if (( $RESTART )); then
	echo REINSTALLING....
	BASH_ENV="$__DIR__/.bashrc" bash "../util/install.sh"
fi
echo STARTING...
bash --rcfile "$__DIR__/.bashrc"
