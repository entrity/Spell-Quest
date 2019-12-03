#!/bin/bash

. util/shared.sh

fold -w $FOLD -s <<HEREDOC

${SPEECH}So your friends have all gone away to that warty-hog school, that one in England, have they?

So you think you're going to start a life of treasure hunting, do you?

Well, I'll tell you this: you won't get far without a bit of magic to aid you, no you won't! But there's a little magic academy not far from here, and since their popularity has fallen, I will just bet that they'll take you in and teach you a charm or two. You'll need it if you want to get to the bottom of Treasure Mountain, beleive you me.

What's that you say? You don't know how to reach the local magic academy?

Well, I suupose I could get you started. I really have nothing better to do as long as the dough is rising...

HEREDOC

prompt "What do you say? "

fold -w $FOLD -s <<HEREDOC
${SPEECH}
The first thing you'll need to do is get yourself a spellbook. It doesn't have to be very large, but it had better have several pages. You're going to need to scribe the spells that you learn on the journey ahead, as well as a few magical techniques. Your mother or father should be able to furnish you with such a spellbook, as well as a quill for writing and maybe a sandwich to take on your journey.

Yes, if you want to reach the heart of Treasure Mountain, you'll have to learn spells from the schools of ${COLOR_Red}Conjuration${SPEECH}, ${COLOR_Red}Transmutation${SPEECH}, ${COLOR_Red}Shadow${SPEECH}, and ${COLOR_Red}Illusion${SPEECH}.

You'll learn ${COLOR_Red}first-level spells${SPEECH}, ${COLOR_Red}second-level spells${SPEECH}, and if you go very far, maybe even ${COLOR_Red}third-level spells${SPEECH}.
HEREDOC

prompt "Are you ready? "

fold -w $FOLD -s <<HEREDOC
${SPEECH}
I'm afraid I can't really teach you a great deal, but I do know two little magic charms which will at least be enough to get you to the magic academy. Write these in your spellbook.

HEREDOC

spell ls "This will show you what is around you, usually files and directories. What's a directory? Well, a directory is a bag that holds files and other directories. It's how you organize files. In this world, every person you meet and every item you encounter is a file. Try this spell in our home, and you can see our screech owl. His name is William"

spell cat "Once you've identified a file, you can read its contents with this spell. But you can't just say \"cat\". This spell, like most you will encounter, requires you to specify a target or additional instructions for the spell. To read a file, you need to say \"cat <file>\". For instance, to have me repeat what I've just said, you should say \"cat William\"."

fold -w $FOLD -s <<HEREDOC
$SPEECH
Give these spells a try! See what William has to say

HEREDOC