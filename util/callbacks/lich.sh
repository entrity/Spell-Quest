#!/bin/bash

trap '' SIGINT

CAVERN="$HOME/cave/tunnel/cavern"
POOL="$CAVERN/calm-pool"

bad_bottle () {
	wrap <<-EOF
	${CYAN}
	You toss the bottle in an arc, and it plops with scarcely a splash into the cold, dark water. Within moments, the surface of the pool is once again as smooth as glass.

	Perhaps there was something wrong with the bottle?
	EOF
}
safe () {
	cp "$HOME/../data/Lich.sh" "$CAVERN"
	wrap <<-EOF
	${CYAN}
	The calm pool is too distant for you to hear the sound of your bottle entering the water, but within seconds of casting your spell, a thick, black miasma pours silently from the mouth of the cave, blotting the sky for several seconds. Then it is gone.
	EOF
}
blinded () {
	cp "$HOME/../data/Lich.sh" "$CAVERN"
	speak <<-EOF
	${CYAN}
	You unstopper the ground-glass bottle and tilt it to pour its contents into the calm pool. No sooner does the falling liquid touch the pool's surface than it erupts into a frothing furor. You drop the bottle in surprise, and a cloud of black miasma bursts from the pool. It fills your eyes, your nostrils, your mouth. Uncounted time passes, then all is still once more, but you can scarcely see.
	${BRMAGENTA}
	You poor fool. You've met with a horrible fate, haven't you? Oh, but I have designs for you, yes I have.
	${RESET}${CYAN}
	You look toward the sound of the voice, and you espy hovering above the black pool a skeletal figure in tattered robes. It gazes down at you with sardonic amusement. Then it reaches forth an extended finger and points to you.
	${BRMAGENTA}
	You have breathed the vapours of the pool, and now you'll go no more out, not until you've done something for me. Oh, you're welcome to try, but I promise you'll get nowhere.

	Let's start with something easy, shall we? I desire you to transfer all of the contents of your bag into this pool. When you've done so, I will allow you to leave.

	$CONTINUE
	EOF

	local CONTENTS=$(ls "$HOME/bag")
	exec < /dev/tty

	while (( $(ls "$HOME/bag" | wc -l) )) || echo "$CONTENTS" | diff --changed-group-format='%>' --unchanged-group-format='' <(ls "$POOL") -; do
		echo
		echo -e "${BRMAGENTA}When you have transfer all of the contents of your bag into this pool, I will allow you to leave.${RESET}"
		echo -n "$ "
		read -er -a CMD
		if [[ ${CMD[0]} == cd ]]; then
			wrap <<-EOF
			${BRMAGENTA}You poor wretch, you cannot move!${RESET}
			EOF
		elif [[ ${CMD[0]} == rm ]]; then
			wrap <<-EOF
			${BRMAGENTA}No, I'll not allow that!${RESET}
			EOF
		else
			bash -c "${CMD[*]}"
		fi
	done
	rm "$POOL/"*
	cd "$CAVERN"

	speak <<-EOF
	${BRMAGENTA}
	You are released... from one prison. But now we move on to a matter which I cannot forgive...
	${RESET}${CYAN}
	The figure releases a slow sigh.

	$CONTINUE
	EOF
	bash "$CAVERN/Lich.sh"
}

if [[ $(pwd) =~ home/cave ]]; then
	if ! cmp -s "$LICH_BOTTLE" "$DATA/lich-bottle.txt"; then
		blinded
	else
		bad_bottle
	fi
else
	safe
fi
