#!/bin/bash

IFS='/' read -r -a STEPS < <(pwd)

is_match () {
	PLAIN=$(base64 -d <<< "$1")
	[[ "$PLAIN" == "$2" ]]
}

if [[ $(basename "$(mjlower $0)") =~ .*magic.*seed.* ]]; then
	if is_match "${STEPS[-1]}" winding \
		&& is_match "${STEPS[-2]}" is \
		&& is_match "${STEPS[-3]}" way \
		&& is_match "${STEPS[-4]}" the
	then
		wrap <<-EOF
		${SPEECH}The magic seed hops from your hands and buries itself in the muddy water below.

		Within seconds, a rumble sounds, and the sloppy ground begins to quake. The earth in front of you erupts as rock formations climb to the sky. A towering mountain grows where there was only water and wood a minute before.

		Before you can make your way toward the mountain, a splashing is heard behind you, and the Small Troll whom you saw earlier dashes past.
		EOF

		cp -r "$HOME/../data/mountain-path" .

		for i in `seq 3`; do
			reverse_video
			sleep 0.2
			normal_video
			sleep 0.2
		done &
	else
		wrap <<-EOF
		${SPEECH}Well, the magic seed seems to have done nothing. Perhaps this isn't the right spot?
		EOF
	fi
else
	wrap <<-EOF
	${SPEECH}Well, nothing happens. Are you sure that this is the item you were supposed to activate?
	EOF
fi
