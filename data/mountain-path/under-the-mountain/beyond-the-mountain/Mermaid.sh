#!/bin/bash

AEGIS=$(openssl enc -a -d <<< "cGVyaWNhcmRpdW0=")

tutorial () {
	speak <<-EOF
	$(art mermaid.txt)
	${SPEECH}

	You might not know it to look at me, but I'm a teacher's aid at $(alt Hattifattener Academy). I know what you're after. You want access to the academy.

	That's no trouble. I'll give you a $(alt magic nail), which will open the way to the academy for you, $(alt if) you can tell me $(alt "Melisandre's word of aegis"). Do you know who Melisandre was? Of course you must.

	But what you may not know is the second-level Transmutation spell $(spell printf). $(spell printf) is a supercharged version of $(spell echo), and its name is an abbreviation for "print formatted" because it allows you to specify the format for what you want to print.

	Typically, the first parameter you give to $(spell printf) is a string which contains placeholders. The subsequent parameters are values to be formatted into the placeholders. Let's see an example:

	$(spell 'printf "%%d. Number %%3d is %%03d when %%s" 1 45 45 zero-padded')

	You can see that I provided 5 parameters to $(spell printf). The first parameter contains 4 placeholders (the tokents that begin with $(alt %%)). Because there are 4 placeholders, I need to provide 4 parameters to fill the placeholders. Let's see what the output looks like, then explain the meaning of the placeholders:

	${RESET}1. Number  45 is 045 when zero-padded${SPEECH}

	* The $(alt %%d) placeholder will print a number. (The $(alt d) stands for $(alt decimal) because $(alt decimal) is the name of the numbering system that contains numerals 0 through 9.)
	* If a number appears between the $(alt %%) and the $(alt d), it signifies how many spaces should be used for the placeholder. You can see that I specified $(alt %%3d), but my input for that placeholder ($(alt 45)) has only two digits, so an extra blank space appeared in the output.
	* If a zero and another number appears between the $(alt %%) and the $(alt d), it indicates that any extra spaces should be filled with zeroes instead of with blank spaces.
	* The $(alt %%s) placeholder will print a "string." (A string means just a sequence of textual symbols.) This placeholder can include a number, just as $(alt %%d) did, for example $(alt %%20s).

	There are a lot more placeholders and tricks that make $(spell printf) powerful. You can read up on them by performing a web search or by invoking $(spell man printf).

	One of the differences between $(spell printf) and $(spell echo) is that $(spell echo) starts a new line after it prints your message. $(spell printf) does not do this, but you can make it insert a newline by putting the string $(alt '\\n') in your format string, for instance:

	$(spell 'printf "%%d. Number %%3d is %%03d when %%s\\n" 1 45 45 zero-padded')

	(You can put as many newline characters as you like, wherever you like.)

	So here's what I require of you: use $(spell printf) to pipe a string containing the word of aegis to me. Here is how I want your text formatted:

	* The first 7 characters of your text must hold a zero-padded number whose value is the current year.
	* The next character must be a colon (:).
	* The next 25 characters must contain the word of aegis, padded with blank space

	$CONTINUE
	EOF

	learned printf

	wrap <<-EOF
	${SPEECH}
	She wants you to pipe the following into her by using the $(spell printf) spell:

	* The first 7 characters of your text must hold a zero-padded number whose value is the current year.
	* The next character must be a colon (:).
	* The next 25 characters must contain the word of aegis, padded with blank space
	EOF
}
mistake () {
	wrap <<-EOF
	${SPEECH}
	Pity. You know not the word of aegis. Away with you.
	EOF
}
reward () {
	wrap <<-EOF
	${SPEECH}
	Yes, this is the word of power. I am not surprised. Have this:

	${CYAN}She slips a rust-covered nail into your bag.

	${SPEECH}You may use this nail anywhere you like, but you may use it only once. When you do, a gateway to the academy will appear. So it would be wise to use the magic nail in a place that is convenient to reach.
	EOF

	mkdir -p "$HOME/bag"
	cp "$DATA/magic-nail.sh" "$HOME/bag"
}

if ! [[ -t 0 ]]; then
	read -r ANS
	printf -v KEY "%07d:%25s" $(date +%Y) $AEGIS
	if [[ $KEY == $ANS ]]; then
		reward
	else
		mistake
	fi
	prompt_repeat
else
	tutorial
fi
