#!/bin/bash

bag_check () {
	if ! [[ -e "$HOME/bag" ]]; then
		echo -e "Oh! $(red "You don't have a bag?") You really shouldn't travel without one."
		echo
		echo "I'll teach you a little spell: $(spell mkdir TARGET). 'mkdir' is an abbreviation for 'make directory'. I want you to create a directory named 'bag'. You should create it in your home directory."
		echo
		echo -e "Did you learn the arcane symbol '$(spell '~')'? It signifies your home directory, so to create a directiory named \"bag\" there, just invoke:"
		echo
		echo -e "$(spell mkdir '~/bag')"
	fi

	learned mkdir
	learned '(path element) ~'
}

fold -w $FOLD -s <<HEREDOC | less -r
${SPEECH}
${WIZARD_JAGGERS}
Oh! Hello there. It has been quite a long time since we had any visitors in the academy.

Well, since we're having a slow season, I suppose I can let you poke around any of the classrooms you like, but I must warn you that all of the instructors have gone except for the $(alt Transmutation professor, Raleigh). You can probably find him in his classroom. Oh, and $(alt Gumpy the custodian) sometimes is poking about. You might find him in one of the classrooms.

We only teach first-level spells in this academy, but a book full of first-level spells is enough to take you far in this world. And it's a good deal more than most people ever know.

You're a treasure hunter, are you? Hm, I must say you don't look it. Oh, you've only just begun on your journey? That explains it.

$(bag_check)

$CONTINUE
HEREDOC

if ! [[ -e "$HOME/bag" ]]; then
	fold -w $FOLD -s <<-HEREDOC
	$SPEECH
	You should do as the elderly man suggested: create a directory named "bag" within your home directory.
	Invoke $(spell mkdir \~/bag)

	Then go see what this academy has to offer. The elderly man mentioned a $(alt Transmutaiton professor) and someone else, but I don't recall who.
	HEREDOC
fi
