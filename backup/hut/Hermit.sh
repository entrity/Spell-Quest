#!/bin/bash

. "$HOME/../.start/aliases.sh"
clear

_decompose_path () {
	PTH="$(pwd)"
	while [[ -n "$PTH" ]]; do
		echo $PTH
		PTH="$(dirname "$PTH")"
		PTH="${PTH%/}"
	done
	echo /
}

decompose_path () {
	IFS=$'\n' _decompose_path | tac | while read -r P; do
		xargs printf "${CYAN}  %s\n" "$P"
	done
}

function instruction () {
	speak <<-EOF
	$(art hermit.txt)

	${SPEECH}So your friends have gone off to that Warty Hogs school to become wizards and witches, have they? What's that? You don't want to learn magic, you just want to be a treasure hunter?

	Bah and piffle! You won't go far without a bit of magic of your own, treasure hunter or no! But I suppose you could learn enough to get your treasure hunt on its way at the local magic academy.

	What's that you say? You don't know how to reach the local magic academy?

	Well, I suppose I could get you started, just enough to put you on the road. What do you say?

	The first thing you'll need to do is get yourself a spellbook. It doesn't have to be very large, but it had better have several pages. You're going to need to scribe the spells that you learn on the journey ahead, as well as a few magical techniques. Your mother or father should be able to furnish you with such a spellbook, as well as a quill for writing and maybe a sandwich to take on your journey.

	You'll have to learn spells of Transmutation, Conjuration, Teleportation, Divination, Destruction, and Illusion, to name a few. You'll need first-level spells, second-level spells, and perhaps even a third-level spell or two.

	I'm afraid I can't really teach you a great deal, but I do know charm or two, and I'm handy with an enchantment. Here is your first spell: $(spell ls) is a "look" spell. Write it down as a first-level Divination spell.

	How do you cast it? Just type $(spell ls), then hit $ENTER_KEY. (Use $ENTER_KEY after typing to invoke any spell.) Watch me cast it now:

	${RESET}$(ls)${SPEECH}

	...Do you see that list above? My spell just listed everything to be found at this location!

	Well, I guess it doesn't really list EVERYTHING in this location because YOU are in this location. But it lists $(alt files) and $(alt directories). (Some people use the word 'folder' instead of 'directory'.) Files and directories are distinguished by what they can hold: a $(alt file) holds words, sounds, images, or things of that nature; but a $(alt directory) is like a bag. It can hold files or other directories---or even you!

	That's right, wherever you may travel in this world, your location will always be inside some directory or other.

	How do you know just what your current location is? I can teach you another spell that answers that question: $(spell pwd). It shows you the $(alt path) to your current location. I'll invoke it now so that you can see the output:

	${RESET}$(pwd)${SPEECH}

	But what's a $(alt path), you ask? A $(alt path) is how people specify the location of a $(alt file) or $(alt directory). So what can we understand by looking at the path above?

	That path (and every path) is a series of directories, joined by the $(alt \/) symbol. As you move from left to right when reading a path, you are moving into deeper and deeper directories. Imagine you have a large bag which holds another bag, which holds yet another bag... and that's how you organize your belongings!

	$(decompose_path)
	$(find "`pwd`" -maxdepth 1 -type f | sort | while read f; do printf "${RESET}  "; canpath "$f"; done)
	${SPEECH_N}

	In the list above, I've taken the trouble to colour all of the $(alt directories) cyan and all of the $(alt files) white just to demonstrate that $(alt paths) indicate the location of both $(alt files) and $(alt directories).

	Well, that's half of what I have to teach you. What's left is to answer the question, after you use the $(spell ls) spell to discover people around you, how do you speak to them?

	The short answer, which is all that I can give you, is to enter their name on the command line with the symbols $(alt ./) in front. For example, did you remember that there is someone in this hut named $(alt William.sh)? To talk to him, you would just enter $(spell ./William.sh) on your command line and hit $ENTER_KEY.

	Here's an important matter, though: not all files can be spoken to. You can identify which files will speak to you by invoking $(spell ls -F) instead of $(spell ls). Let me invoke it now. See if you can recognize how its output differs from $(spell ls):

	$RESET
	Hermit.sh*
	Shopping-list.txt
	trunk/
	William.sh*
	$SPEECH

	Did you notice that now some of the items have a $(alt \/) symbol at the end and others have a $(alt \*) symbol at the end? The $(alt \/) at the end indicates that the item is a $(alt directory). The $(alt \*) at the end indicates that the item is a $(alt file) with whom you can speak! You can see that $(alt William.sh), that green owl in the corner who is eyeing you carefully, can be spoken with.

	You must understand that $(spell ls) and $(spell ls -F) are actually the same spell; the difference is only that the latter invocation has a $(alt parameter). Most spells that you learn can change their behaviour in small ways if you cast them using one or more $(alt parameters) after the spell name. But each spell interprets parameters in its own way; you will learn them gradually. For the $(spell ls) spell, the $(alt '-F') parameter means, "Show me the type of each item at this location."

	$(alt Parameters) must be separated from each other and from the spell's name by a blank space. For example, if you knew a spell named $(spell cat) and wanted to give it two parameters, $(alt '-n') and $(alt Shopping-list.txt), you would cast it as:

	${RESET}cat -n Shopping-list.txt${SPEECH}

	Now it's time for me to rest. Good luck on your lunatick treasure hunt. You should talk to William before you go.

	$CONTINUE
	EOF

	learned 'ls'
	learned 'ls -F'
	learned 'pwd'
	learned '(technique) execute script'

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
	${SPEECH}You learnt $(spell ls -F) and $(spell pwd) and how to speak with people.

	The Hermit also mentioned an invocation $(spell cat -n Shopping-list.txt). Hm... I wonder what it does?

	You should try to talk to William by invoking $(spell ./William.sh)

	If you want the Hermit to repeat everything he told you a moment ago, you might even talk to him again by invoking $(spell ./Hermit.sh)
	EOF
}

instruction
