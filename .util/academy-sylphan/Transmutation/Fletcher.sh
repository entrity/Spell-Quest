#!/bin/bash

THISDIR=$(dirname "$(readlink -f "$0")")
ROOTDIR="${THISDIR%/Spell-Quest/*}/Spell-Quest"
. "$ROOTDIR/.util/shared.sh"

fold -w $FOLD -s <<HEREDOC | less -r
${SPEECH}
${BOW}
Ahoy, there!

What? Oh, I'm not Raleigh. He's the Transmutation professor. Me, I'm... well, that's not important. Just don't tell Raleigh that I was in here.

I usually stay in the forest. No one knows its paths so well as I. But I also know some magic, and I come here to practice.

Do you want to learn a spell? It's a first-level Transmutation spell.

$(spell mv) is an abbreviation for 'move'. It allows you to move things or rename them.

Watch this! $(spell mv ARROW TARGET)

Did you see? I just moved my ARROW to the TARGET. I never miss! Well... I miss sometimes, and the results are disasterous. So when you use this spell, $(cyan make sure you are typing carefully). One time I tried to move an ARROW to the TARGET, but I accidentally moved it to the TARGE.

You don't know what a targe is? It's a small shield. My spell *ruined* the shield.

If I had been slower and more careful, I could have inserted an extra parameter into my invocation:

$(spell mv -n ARROW TARGET)

The $(spell -n) parameter means "don't overwrite the target if it already exists."

How does $(spell mv) work?

Well, the first require parameter is a file or directory (e.g. ARROW), and the second required parameter is the destination you have in mind for it (e.g. TARGET).

If the destination (TARGET) exists and is a file, it will be completely lost because the arrow ends up taking its place.

If the destination (TARGET) exists and is a directory, the arrow will be moved into the directory.

If the destination does $(red not) exist, then the arrow's name will be changed to match the destination.

For example, do you see that $(cyan Closet) there? That's a directory. Do you see that Cupboard there? That's also a directory. There are some tools inside of the closet: a broom, a mop, and a bucket.

$(spell mv -n Closet/bucket Shelf) ...now the bucket is located at Shelf/bucket

$(spell mv -n Shelf/bucket Shelf/rag) ...now the bucket has been changed into a rag! Well, not really. But from the *outside*, at least, it looks like a rag. One time, a friend of mine tried to use this spell to turn a lump of coal into a gold nugget. He sold it to a stranger, but the stranger eventually realized the gold was really still coal on the inside, and he took my friend to task for it. Broke a chair over him, he did.

$(spell mv -n Closet/broom .) ...now the broom is here in this location instead of in the Closet. What fun! I could do this all day!

Wait a moment! I hear footsteps. I had better go. Just shut this window behind me, and don't tell Raleigh that I was here, alright?

$(red Press q to end)
HEREDOC

mv "$THISDIR/Closet/broom" "$THISDIR"
mv "$THISDIR/Closet/bucket" "$THISDIR/Shelf/rag"
mv "$0" ".$0"
mv "$THISDIR/.Raleigh.sh" "$THISDIR/Raleigh.sh"
