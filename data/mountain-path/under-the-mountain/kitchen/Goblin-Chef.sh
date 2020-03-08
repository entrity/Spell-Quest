#!/bin/bash

tutorial () {
	speak <<-EOF
	${SPEECH}
	Have I got a job for you! A horrible little pest of a $(alt Lesser Troll) just scampered through here and scattered pixie dust in the $(alt bookcase), and now all of my cookbooks are ruined.

	I don't have time to do anything about it because I have to finish these swampwater blintzes before tea time! Will you repair the cookbooks for me?

	The trouble is that every place that the word $(alt dust) appeared in any of the cookbooks, the Small Troll's magic caused it to swap places with the word $(alt two places afterward)!

	For example, if the following line appeared in the original cookbook:

	${RESET}footprint capybara dust ochre lichen asparagus
	${SPEECH}
	...then the altered cookbook would contain the following:

	${RESET}footprint capybara lichen ochre dust asparagus
	${SPEECH}
	Can you see how tricky a problem this is? I can say one thing for sure: this calls for regular expressions.

	You've learnt to use $(spell sed), right? Well, one thing you can do in a $(spell sed) regular expression is to use $(alt '\(') and $(alt '\)') to capture part of the input and then use $(alt '\\1') to reproduce it in the output.

	For example, if my input is ${RESET}snafu${SPEECH} and I want the output to just contain the character after $(alt n), I could use this invocation:

	$(spell "sed 's/n\(.\)/\\\1/'")

	The contents within the $(alt '\(\)') is called a $(alt capturing group). You can actually have as many capturing groups as you want in a $(spell sed) regex. You can reference the first one with $(alt '\\1'), the second one with $(alt '\\2'), and so on.

	...You might want to make a copy of all of these cookbooks and practice on your copies. You can copy an entire directory (including all its subdirectories) with $(spell 'cp -r'). The $(alt '-r') option stands for $(alt recursive).

	You might want to write a bash script so that you can carefully write a loop and adjust your spells as you experiment.

	$CONTINUE
	EOF

	learned '(technique) sed with capturing groups'
	learned 'cp -r'

	wrap <<-EOF
	${SPEECH}
	EOF
}
mistake () {
	wrap <<-EOF
	${SPEECH}
	No, these books haven't all been repaired correctly. Did you do all of the following?

	* edit ALL of the cookbooks in the bookcase?
	* swap $(alt dust) with the word two places before it?
	* perform swaps on EVERY occurrence (using the $(alt global) option)
	EOF
}
reward () {
	wrap <<-EOF
	${SPEECH}
	Oh, thank you! Without your help, I don't know how I could have gotten all this done in time for the sous-chefs to begin work on supper. Please take this as a token of my gratitude!

	${RESET}The goblin slips a sticky wishbone into your bag.
	EOF
	mkdir -p "${HOME}/bag"
	cp "${DATA}/wishbone" "${HOME}/bag"
}
prompt_repeat () {
	echo
	if prompt_no "Do you want me to repeat my instruction?"; then
		tutorial
	fi
}

if [[ -t 0 ]]; then
	tutorial
else
	if >/dev/null diff -r -q --no-dereference bookcase "$DATA/bookcase-check"; then
		reward
	else
		mistake
	fi
	prompt_repeat
fi
