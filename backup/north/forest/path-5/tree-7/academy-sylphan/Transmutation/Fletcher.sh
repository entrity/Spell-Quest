#!/bin/bash

speak <<HEREDOC
${SPEECH}
${BOW}
Ahoy, there!

What? Oh, I'm not Raleigh. He's the Transmutation professor. Me, I'm... well, that's not important. Just don't tell Raleigh that I was in here.

I usually stay in the forest. No one knows its paths so well as I. But I also know some magic, and I come here to practice.

Do you want to learn a spell? It's a first-level Transmutation spell.

Watch this! $(spell mv ARROW TARGET)

$(spell mv) is an abbreviation for 'move'. The first parameter (ARROW) is the path of a file or directory which you want to move or rename. One of three things can happen when you use this spell, depending on what you specify as the second parameter (TARGET).

1. If the TARGET is a file which already exists, the existing file will be lost, and the ARROW will be renamed to take its place.
2. If the TARGET is a directory which already exists, the ARROW will be moved into the directory, but the ARROW will not be renamed.
3. If the TARGET does not exist at all, the ARROW will be renamed.

One time I tried to move my ARROW to the TARGET, but I was not sufficiently careful and instead of TARGET, I wrote TARGE. You don't know what a targe is? It's a small shield. My TARGE was forever lost as a consequence of my mistake!

If I had been slower and more careful, I could have inserted an extra parameter into my spell invocation:

$(spell mv -n ARROW TARGET)

The $(spell -n) parameter means "don't overwrite the target if it already exists. Just leave everything as it was before."

Let me give you some examples! Do you see that $(alt Closet) there? That's a directory. Do you see that $(alt Cupboard) there? That's also a directory. There are some tools inside of the closet: a broom, a mop, and a bucket.

$(spell mv -n Closet/bucket Cupboard) ...now the bucket has been moved out of the Closet and into the Cupboard. It is located at $(alt Cupboard/bucket)

$(spell mv -n Cupboard/bucket Cupboard/rag) ...now the bucket has been changed into a rag! Well, not really. But from the *outside*, at least, it looks like a rag. One time, a friend of mine tried to use this spell to turn a lump of coal into a gold nugget. He sold it to a stranger, but the stranger eventually realized the gold was really still coal on the inside, and he took my friend to task for it. Broke a chair over him, he did.

$(spell mv -n Closet/broom .) ...now the broom is here in this directory instead of in the Closet. What fun! I could do this all day!

Wait a moment! I hear footsteps. I had better go. Just shut this window behind me, and don't tell Raleigh that I was here, alright?

$CONTINUE
HEREDOC

wrap <<HEREDOC
$SPEECH
Fletcher has just jumped out the window. And a professorial-looking character has just entered the room.
HEREDOC

if [[ $# -eq 0 ]]; then
	THISDIR=$(thisdir)
	mv "$THISDIR/Closet/broom" "$THISDIR" 2>/dev/null
	mv "$THISDIR/Closet/bucket" "$THISDIR/Cupboard/rag" 2>/dev/null
	mv "$0" "$(dirname "$0")/.$(basename "$0")" 2>/dev/null
	mv "$THISDIR/.Raleigh.sh" "$THISDIR/Raleigh.sh" 2>/dev/null
fi

learned mv
