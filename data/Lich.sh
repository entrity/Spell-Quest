#!/bin/bash

SPEECH=$BRMAGENTA

trap '' SIGINT

wrap <<-EOF
${SPEECH}
What arrogance made you think you could coax favours from the undying?
${RESET}${CYAN}
The lich begins muttering and performing gestures. An icy feeling wells in your toes and begins to creep upward. Within seconds, you are paralyzed. Your mouth is the only member which you command.

EOF

echo -n -e "${RESET}> "
read -r -e UTTERANCE


if [[ $UTTERANCE == shibboleth ]]; then
	speak <<-EOF
	${RESET}${CYAN}
	The lich reacts by writhing and raking its claw-like fingers. You feel the icy hold upon you release. The area appears to brighten marginally, and you observe that a tiny light hangs above you like a faint star.
	${SPEECH}
	I know why you have come! I will render it to you, but then begone! Leave this tortured soul to his imprisonment.

	You wish to be shown the first path of $(alt Shadow)${SPEECH}. You shall receive the first-level Shadow spell $(spell base64)${SPEECH}.

	$(spell base64)${SPEECH} is a spell that can be used to encode and decode information. In fact, it is used by some to conceal malicious instructions. These malfeasant workers deliver activatable files to friends and strangers alike, hoping that at least one of the recipients will ignore the presence of this spell. Although it is perfectly safe for you to use, be wary when receiving from another any file which contains an invocation of this spell.

	$(spell base64 FILE)${SPEECH} will encode the contents of a file into "base-64." What is "base-64" encoding? Let's look at an example. Suppose I have some plain text which I wish to encode: $(alt "the fifth door is the secret.")${SPEECH} The base-64-encoded text matching this message is $(alt $(base64 <<< "the fifth door is the secret."))${SPEECH}

	Base-64 is a restricted set of symbols which includes letters, numbers, and a few special characters, such as $(alt \_)${SPEECH} and $(alt \=)${SPEECH}. It does not include other symbols, such as $(alt \&)${SPEECH}, $(alt \$)${SPEECH}, or $(alt \*)${SPEECH}. But that's not important. All you need know or care is that whatever you encode is not human-readable.

	To decode a file, use $(spell base64 -d FILE)${SPEECH}.

	Really, you should include the parameters $(alt '-w 0')${SPEECH} like so:

	$(spell 'base64 -w 0 FILE')
	${SPEECH}and
	$(spell 'base64 -w 0 -d FILE')

	${SPEECH}The $(alt \-w)${SPEECH} parameter means "the next parameter specifies how often to wrap the output by inserting a new line." If that next parameter is $(alt 0)${SPEECH}, as in the example I gave, then no wrapping will be performed. After all, if the enciphered text has line breaks inserted into it, it cannot be decoded! (You would have to delete the line breaks by yourself in order to make use of enciphered text that had been wrapped.)

	Both of these invocations will result in the output being printed to the terminal, so if you wish to save the output to a file, remember to redirect with $(alt \>)${SPEECH}.

	Some spells, including $(spell base64)${SPEECH}, can also read text from the command line if it is provided with a special redirect which only works on text (not on files): $(alt '<<<')${SPEECH}.

	Here is an example:

	$(spell 'base64 -w 0 <<<"mouldering bones"')
	${RESET}bW91bGRlcmluZyBib25lcwo=${SPEECH}

	And:

	$(spell 'base64 -w 0 -d <<<bW91bGRlcmluZyBib25lcwo=')
	${RESET}mouldering bones${SPEECH}

	You can write any redirect, whether $(alt '<<<')${SPEECH}, $(alt \>)${SPEECH}, or $(alt \>\>)${SPEECH} *before* or *after* your command. So $(spell '<<<foo base64')${SPEECH} works exactly the same as $(spell 'base64 <<<foo')${SPEECH}.

	$CONTINUE
	EOF
else
	echo -e "\n\n$(alt "The skeletal figure lifts a hand abrubtly, and you feel your bones crumble.")\n${SPEECH}You have died.\n" | fold
	rm "$HOME/bag/"* 2>/dev/null
	kill -9 $PPID 2>&1 >/dev/null
fi

learned 'base64'
learned 'base64 -d'
learned '(technique) <<<'
