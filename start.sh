#!/bin/bash

if [[ $* =~ -r ]]; then
	RESTART=1
fi

THISDIR=$(dirname "$(readlink -f $0)")
if (( $RESTART )); then
	rm "$THISDIR/.lessons/"* 2>/dev/null
	rm -r "$THISDIR/bag" 2>/dev/null
fi
mkdir -p "$THISDIR/hut/trunk"
bash --rcfile "$THISDIR/.bashrc"
