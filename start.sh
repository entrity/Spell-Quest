#!/bin/bash

if [[ $* =~ -r ]]; then
	RESTART=1
fi

__DIR__=$(dirname "$0")
echo STARTING... "$@"
RESTART=$RESTART bash --rcfile "$__DIR__/.bashrc"
