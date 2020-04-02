#!/bin/bash

. "$HOME/../.start/aliases.sh"

decompose_path () {
	PTH="$(pwd)"
	while [[ -n "$PTH" ]]; do
		echo $PTH
		PTH="$(dirname "$PTH")"
		PTH="${PTH%/}"
	done
	echo /
}

read -r -d '' BOILERPLATE <<-EOF

${RESET}
You might wish to maximize this window. You can also increase the text size by use of the menu.

You can press the $(alt up)${RESET} and $(alt down)${RESET} arrow keys or $(alt PageUp)${RESET} and $(alt PageDown)${RESET} or $(alt u)${RESET} and $(alt d)${RESET} to scroll through what I have to say.

You will speak with many people on this quest. The normal way to stop someone talking is to press $(red q)${RESET}. If you end up pressing an unexpected key and can't get away from someone who's talking to you, try pressing $(red Escape)${RESET} and/or $(red 'Ctrl+c')${RESET} once or twice, then press $(red q)${RESET}. (You might need to press $(red Backspace)${RESET} a few times too, if you find that you've started entering text in the bottom left corner.)
${SPEECH}
EOF

function instruction () {
	speak <<-EOF
	$BOILERPLATE
	$(art hermit.txt)

	${SPEECH}So your friends have gone off to that Warty Hogs school to become wizards and witches, have they? What's that? You don't want to learn magic, you just want to be a treasure hunter?

	Bah and piffle! You won't go far without a bit of magic of your own, treasure hunter or no! But I suppose you could learn enough to get your treasure hunt on its way at the local magic academy.

	What's that you say? You don't know how to reach the local magic academy?

	Well, I suppose I could get you started, just enough to put you on the road. What do you say?

	The first thing you'll need to do is get yourself a spellbook. It doesn't have to be very large, but it had better have several pages. You're going to need to scribe the spells that you learn on the journey ahead, as well as a few magical techniques. Your mother or father should be able to furnish you with such a spellbook, as well as a quill for writing and maybe a sandwich to take on your journey.

	You'll have to learn spells of Transmutation, Conjuration, Teleportation, Divination, Destruction, and Illusion, to name a few. You'll need first-level spells, second-level spells, and perhaps even a third-level spell or two.

	I'm afraid I can't really teach you a great deal, but I do know charm or two, and I'm handy with an enchantment. Here is your first spell: $(spell ls) is a "look" spell. It lets you look not just in front of you but *anywhere*, even faraway places. Its only limitation is that you have to give the location of where you want to look. Write it down as a first-level Divination spell.

	How do you cast it? Just type $(spell ls), followed by a space, then a $(alt path). What's a "path," you ask? A $(alt path) is how people specify the location of a $(alt file) or $(alt directory). (Some people use the word 'folder' instead of 'directory'.)

	Files and directories are distinguished by what they can hold: a $(alt file) holds words, sounds, images, or things of that nature; but a $(alt directory) is like a bag. It can hold files or other directories---or even you!

	That's right, wherever you are, your location is in a directory. Do you know the path for your current location? It's $(alt $(pwd))

	Notice that a path is a series of directories, joined by the $(alt \/) symbol. As you move from left to right when reading a path, you are moving into deeper and deeper directories.
	$CYAN
	$(decompose_path | tac | xargs printf "  %s\n" )
	$SPEECH_N
	So if you want to look inside your current directory, invoke:

	$(spell ls \"$(pwd)\")

	Always put a space between the name of the spell and its parameters. Then press $(alt Enter) or $(alt Return) when you're ready for the spell to be cast.

	Did you notice that I put $(alt \"quotation marks\") around the path? That isn't strictly necessary, but if the path contains spaces or other special characters, it becomes important. Just imagine if your path were $(alt /foo/My Documents/bar). Without quotation marks, the spell would look like this:

	$(spell ls /foo/My Documents/bar)

	...and it would be interpreted as if you had provided *two* parameters:

	$(spell ls \"/foo/My\" \"Documents/bar\")

	You can avoid this by the use of 'single quotes' or "double quotes":

	$(spell ls \'/foo/My Documents/bar\')
	$(spell ls \"/foo/My Documents/bar\")

	If you invoke $(spell ls) with no paramters, you will just look at your current location. I'll give it a try:

	${RESET}$(ls)${SPEECH}

	Do you see that list up there? That's the output of $(spell ls) when invoked in this location. One of the things you can see is my trunk. It's a directory.

	You don't believe me? ...Oh, you just don't want to look because you don't want to type that long path? Well, usually people don't actually make use of the entire path.

	Trying to look into the trunk by typing the entire path would be like saying, "Walk all the way up to $(alt /), then walk all the way back here, then look in the trunk." No, you can just specify a path relative to our current location. Our current location is:
	$(alt $(pwd))
	The trunk's whole path is:
	$(alt $(canpath trunk))
	Its path relative to our current path is just:
	$(alt trunk)

	(Notice that a relative path NEVER starts with the $(alt /) symbol.)

	Well, I have just a few more things to teach you before you embark on your lunatick treasure hunt.

	The first $(alt technique) is the use of the $(alt ..) token. When used in a path, this token means "upward one level." That means that all of the following paths are equivalent:
	$BRCYAN
	..
	/foo/bar
	/foo/bar/qux/..
	/foo/bar/qux/../../bar
	$SPEECH_N
	If you want, you can look at the contents of the directory one level up from here by invoking $(spell ls ..) Another $(alt technique) is the use of the $(alt .) token. This token signifies your current directory. So right now, the following two paths are equivalent:
	$BRCYAN
	.
	$(pwd)
	$SPEECH_N
	You may think that's not useful, but I shall show you now that it is! The last technique I have to teach you is how to $(alt execute a file). Most files cannot be executed; they just hold information, but some files can be executed as if they were spells. So how do you execute such a file? You must invoke its path using $(alt at least one directory in the path). So if the file is in your current directory, you can use the $(alt .) token. We'll look at some examples in a minute.

	First, how do you recognize which files can be executed? You can recognize them by their color, or you can run $(spell ls) with a $(spell -F) parameter. When you run $(spell ls -F), it will add a $(alt \*) symbol onto the end of files that can be executed. And it will add a $(alt \/) symbol on to the end of directories.

	If you invoke $(spell ls -F) here, you will see:
	$RESET
	$(ls -F)
	$SPEECH
	You can see that William, that green owl in the corner who is eyeing you carefully, can be executed. Here are a few of the ways that you can invoke William.sh:
	$BRGREEN
	./William.sh
	../$(basename "$(pwd)")/William.sh
	$(pwd)/William.sh
	$SPEECH_N
	Well, the last thing I have to teach you is a simple spell: $(spell pwd). It is a first-level Divination spell. If you cast it, it will show you your current location.

	Now it's time for me to rest. Good luck on your lunatick treasure hunt. You should talk to William before you go.

	$CONTINUE
	EOF

	learned 'ls'
	learned 'ls -F'
	learned 'pwd'
	learned '(technique) execute script'
	learned '(path element) .'
	learned '(path element) ..'

	wrap <<-EOF
	${SPEECH}
	Wow! So much information. I hope the other instructors don't have so much to say.
	EOF
	echo
	if prompt_no "Would you like to do some exercises on what you've just been taught?"; then
	
		echo "${RESET}....................................."
		bash "$HOME/../data/Hermit-exercises.sh"
	fi
	wrap <<-EOF
	
	${RESET}.....................................
	${SPEECH}You learnt $(spell ls -F) and $(spell pwd) and how to execute certain files.

	The strange Hermit advised you to practice looking inside of his trunk by invoking $(spell ls trunk).

	And you should try to talk to William by invoking $(spell ./William.sh)

	If you want the Hermit to repeat what he told you earlier, you might even talk to him again by invoking $(spell ./Hermit.sh)
	EOF
}

instruction
