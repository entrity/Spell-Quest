#!/bin/bash

ANS=$(openssl enc -a -d <<< "cGVyaWNhcmRpdW0=")

tutorial () {
	speak <<-EOF
	$(art mermaid.txt)
	${SPEECH}

	You might not know it to look at me, but I'm a teacher's aid at $(alt Hattifattener Academy). I know what you're after. You want access to the academy.

	That's no trouble. I'll give you a $(alt magic nail), which will open the way to the academy for you, $(alt if) you can tell me $(alt "Melisandre's word of power"). Do you know who Melisandre was? Of course you must.

	So please speak to me once more, using the word of power as a parameter.

	$CONTINUE
	EOF
}
mistake () {
	wrap <<-EOF
	${SPEECH}
	Pity. You know not the word of power. Away with you.
	EOF

}
reward () {
	wrap <<-EOF
	${SPEECH}
	Yes, this is the word of power. I am not surprised. Have this:

	${CYAN}She slips a rust-covered nail into your bag.

	${SPEECH}You may use this nail anywhere you like, but you may use it only once. When you do, a gateway to the academy will appear. So it would be wise to use the magic nail in a place that is convenient to reach.
	EOF

	cp "$DATA/magic-nail.sh" "$BAG"
}

if (($#)); then
	if [[ $1 == $ANS ]]; then
		reward
	else
		mistake
	fi
else
	tutorial
fi
