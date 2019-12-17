#!/bin/bash

IMP_BAG="$HOME/cave/imp's-bag/"
IMP_WAND="$IMP_BAG/small-wand.txt"

read -r CONTENT < "$IMP_WAND"

if [[ ${CONTENT,,} =~ salutary ]]; then
	mkdir -p "$HOME/bag"
	cp "$DATA/mighty-axe.sh" "$HOME/bag"

	speak <<-EOF

	${SPEECH}Oh! ...Oh! Oh!... This! This is a fine wand. Oh, thank you! I am much obliged for your kindness.

	I must do you a kindness too. Let me give you... $(alt '[grunt]')... this!

	${RESET}The Imp holds forth an axe which is as large as himself. He staggers unsteadily under its weight. He stumbles unsteadily toward you and tips the ponderous weapon into your bag.

	${SPEECH}You are now in possession of a mighty axe. It is a powerful artifact. To use it, you must activate it and give it a single parameter to target.

	For instance, this skeleton:

	$(spell '~/bag/mighty-axe.sh Skeleton.tmp')
	
	${RESET}With a deft blow, Skeleton.tmp is sundered.

	${SPEECH}You see? But the primary use most travelers have for a mighty axe is to break down locked doors.

	$CONTINUE
	EOF
elif [[ ${CONTENT,,} =~ inimical  ]]; then
	wrap <<-EOF
	${SPEECH}What's this? INIMICAL? Ooh! I'll fix you!

	${RESET}The imp raises his hands above his head and twiddles his fingers as if tickling an invisible cloud. Your bag bursts into flames. A second later it crumbles to cinders and falls to the ground, everything within it lost.
	EOF

	rm -r "$HOME/bag"
else
	wrap <<-EOF
	${SPEECH}What's this? $(alt '[sniff]'). It appears to be a false wand. This means nothing to me.

	${RESET}The Imp snaps the small wand over his knee and casts the pieces aside, then scowls.
	EOF

fi

rm "$IMP_BAG/"* >/dev/null
bash "$HOME/../util/build-flags.sh" > "$FLAGS_FILE"
