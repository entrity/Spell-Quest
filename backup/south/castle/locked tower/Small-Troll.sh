#!/bin/bash

SAVE_FILE=troll-instructions.txt
INSTRUCTIONS="${SPEECH}There is a certain path into the swamp with sure footing. You must follow this path to its termination and carry the head of the gargoyle with you. You must transmute the gargoyle's head into a $(alt magic-seed.sh). Then you must $(alt activate) the seed in that location."

function tutorial () {
	speak <<-EOF
	$(art small-troll.txt)
	${SPEECH}Has someone at last come to free me? Oh, thank you. That wicked man downstairs imprisoned me here for no good reason, none at all!

	In return for freeing me, I will tell you a tremendous secret: the only way to reach the mountain is to create a portal by magic. To do so, you must obtain the head of a gargoyle. But that is not all!

	${INSTRUCTIONS}

	See what happens!

	$CONTINUE
	EOF
}

function reward () {
	echo "$INSTRUCTIONS" > ~/bag/$SAVE_FILE
	wrap <<-EOF
	${SPEECH}
	Running like a rabbit, the little troll dashes past you and down the stairs and out of sight.

	You take a moment to scribe the instructions he just uttered on a file named $(alt $SAVE_FILE) and deposit it into your $(alt bag). If you want to review its contents, just $(spell "cat ~/bag/$SAVE_FILE")
	EOF
	rm "$0"
}

tutorial
reward
