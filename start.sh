#!/bin/bash

if [[ $* =~ -r ]]; then
	RESTART=1
fi

THISDIR=$(dirname "$(readlink -f $0)")
if (( $RESTART )); then
	bash "$THISDIR/util/install.sh" "$THISDIR"
fi
mkdir -p "$THISDIR/home/hut/trunk"
bash --rcfile "$THISDIR/.bashrc"
