#!/bin/bash

if [[ $* =~ -r ]]; then
	RESTART=1
fi

THISDIR=$(dirname "$(readlink -f $0)")
if (( $RESTART )); then
	echo RESTARTING....
	bash "$THISDIR/util/install.sh" "$THISDIR"
fi

bash --rcfile "$THISDIR/.bashrc"
