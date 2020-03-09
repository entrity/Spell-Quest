#!/bin/bash

TIMEOUT=30

encounter_gargoyle () {
	touch "$HOME/south/rocky-spire/tip-top/Gargoyle.sh"

	speak <<-EOF
	$(art beast.txt)
	${CYAN}Hurtling through the skies like a missile flies a horrible gargoyle. It dives to earth touches down, gripping the rocky spire with its claws. You have $TIMEOUT seconds to think of something.

	You look back down the path from which you came. Perhaps you can run for it? But you see the remains of many another adventurer who tried to flee.

	What will you do?

	$CONTINUE
	EOF

	wrap <<-EOF
	${CYAN}The gargoyle's sharp claws rake the air a hair's breadth from you. What will you do?
	EOF

	sleep $TIMEOUT && bash "$CBDIR/killed-by-gargoyle.sh" &
}

encounter_gargoyle
