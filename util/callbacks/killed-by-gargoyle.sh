#!/bin/bash

TIMEOUT=8

if ! [[ -e "$HOME/bag/.gargoyle-slain" ]]; then
	wrap <<-EOF

	${CYAN}
	Alas! The gargoyle has caught and killed you!

	Your bag has been emptied.

	If after $TIMEOUT seconds this terminal does not close, feel free to enter ${RED}reset${CYAN} and press Enter or Return. (It's okay if no text appears as you type. Keep typing.)
	$SPEECH
	EOF

	rm -r "$HOME/bag"

	sleep $TIMEOUT && kill -9 $MAINPID 2>/dev/null >/dev/null
fi
