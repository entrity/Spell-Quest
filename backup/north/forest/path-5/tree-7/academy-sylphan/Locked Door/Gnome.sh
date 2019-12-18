#!/bin/bash

read -r -d '' PLAINTEXT <<-EOF

Can you understand me? Can you help? I'm under a horrible curse. No one here can understand a word I say, so they locked me up in this room, notwithstanding I used to be one of the most respected instructors at this academy!

If you can help me, I'll teach you a powerful, powerful spell!

To break my curse, I need you to alter the scroll you see here! I would do it myself, but with my words so confounded, I cannot cast even the simplest spell!

Just make the scroll completely blank!
EOF

BASE64=$(base64 -w 0 <<< "$PLAINTEXT")

SCROLL="$(thisdir)/scroll.txt"
if [[ -e "$SCROLL" ]] && [[ $(stat --format %s "$SCROLL") -eq 0 ]]; then
	speak <<-EOF
	${SPEECH}
	Peter Piper picked a peck of pickled... Oh, joy! I can speak again!

	I owe you my freedom, and I assure you that this spell will make good on the debt! It is a third-level Transmutation spell. This spell can use regular expressions to edit a file.

	$(spell "sed -i 's/REGEX/REPLACEMENT/OPTIONS' FILE")

	* $(alt sed) is the name of the spell. It is short for "stream edit." (You may come to understand how much this name makes sense in future.)

	* $(alt \-i) is an optional parameter which means "in-place," that is to say, "actually modify the file." If you omit this paramter, the contents of the file will be printed with the edits that the following paramters specify, but the file itself will *NOT* be changed. You might think you could just use a redirect to alter the file without the $(alt -i) parameter as follows: $(red "sed 's/REGEX/REPLACEMENT/OPTIONS' FILE" > FILE), but this will almost never work! Typically you cannot use a file for both input and output because the file gets read a bit at a time and written a bit at a time, so the writing process interferes with the reading process.

	* $(alt REGEX) is a regular expression. $(spell sed) finds strings of text in the file that match your regular expression, and it replaces them with whatever you provide for $(alt REPLACEMENT).

	* $(alt OPTIONS) is an optional part of the invocation. It can be left blank. Two common options are $(alt i) and $(alt g). $(alt i) means that your regular expression is case-insensitive (upper-case and lower-case letters will both match). $(alt g) means "global," and without this option, $(spell sed) will only apply its edit against the *first* match on each line; with this option, $(spell sed) will apply its edit against *every* match on every line.

	* $(alt s/REGEX/REPLACEMENT/OPTIONS) begins with an $(alt s), which signifies "substitution." ($(spell sed) can actually be used for other purposes, so make sure you specify this $(alt s) when you mean to perform a text replacement.)

	I should caution you that there are a couple of difference between regular expressions used by $(spell sed) and regular expressions used by $(spell grep). In $(spell sed), if you want to use the $(alt '+') symbol to mean "one or more," then you need to prefix it with a $(alt '\') symbol. If you want to use the $(alt '{}') characters to mean "some quantity," then you do *NOT* need to prefix them with a $(alt '\') (whereas $(spell grep) requires that you do).

	Let me give you an example. Suppose I have a file with the following contents:

	${RESET}Ginny is going to trot
	Harry likes Ginny
	Ginny is redheaded

	${SPEECH}Let's run $(spell "sed -i 's/[oi]/X/g' myfile.txt"). Then the file will be changed to the following:

	${RESET}GXnny Xs gXXng tX trXt
	Harry lXkes GXnny
	GXnny Xs redheaded

	${SPEECH}Amazing!

	Now let's add an element to those regular expressions to make them even fancier. Suppose we have our original file about Ginny and Harry again, we can use $(alt '\(...\)') in our regular expression to "capture" part of the pattern and allow us to repeat it in the REPLACEMENT. To repeat a captured group in the REPLACEMENT, use $(alt '\\1').

	$(spell "sed -i 's/Ginny is \([a-zA-Z]\+\)/Ginny is cute and \\\\1/g' myfile.txt")... Now the file will be changed to the following:

	${RESET}Ginny is cute and going to trot
	Harry likes Ginny
	Ginny is cute and redheaded

	${SPEECH}Did you notice how the regular expression included a pattern to match the word after "Ginny is," and we got to re-insert that same word in the REPLACEMENT?

	$CONTINUE
	EOF

	learned sed
elif [[ -t 1 ]]; then
	wrap <<-EOF
	$(alt "You can see a gnarled little gnome in the room. As soon as he sees you, he begins to utter gibberish:")

	${SPEECH}$(echo -e "$BASE64")

	$(alt "He seems pretty upset. He gesticulates wildly, trying to make himself understood")

	EOF
else
	echo "$BASE64"
fi
