#!/bin/bash

__DIR__="$HOME/.."
DATA=$(readlink -f "$__DIR__/data")
CB=$(readlink -f "$__DIR__/util/callbacks")

LICH_BOTTLE="$HOME/cave/tunnel/cavern/calm-pool/lich-bottle.txt"

if [[ -f "$LICH_BOTTLE" ]]; then
	if cmp -s "$LICH_BOTTLE" "$DATA/lich-bottle.txt"; then
		bash "$CB/lich.sh"
	else
		wrap <<-EOF
		${CYAN}
		You toss the bottle in an arc, and it plops with scarcely a splash into the cold, dark water. Within moments, the surface of the pool is once again as smooth as glass.

		Perhaps there was something wrong with the bottle?
		EOF
	fi
fi
