#!/bin/bash

COLOR_Black=$'\u001b[30m'
COLOR_Red=$'\u001b[31m'
COLOR_Blue=$'\u001b[34m'
COLOR_Magenta=$'\u001b[35m'
COLOR_Cyan=$'\u001b[36m'
COLOR_White=$'\u001b[37m'
COLOR_Reset=$'\u001b[0m'
COLOR_BR_Black=$'\u001b[30;1m'
COLOR_BR_Red=$'\u001b[31;1m'

GREEN=$'\033[32m'
YELLOW=$'\033[33m'
BOLD=$'\033[;1m'
RESET=$'\033[0;0;0m'
SPEECH=$YELLOW
SPELL=${BOLD}${GREEN}

fold -w 60 -s <<HEREDOC | less -r
${SPEECH}
So your friends have all gone away to that warty-hog school, have they? They think they'll all be witches and wizards, do they?

So you think you're going to start a life of treasure hunting, do you?

Well, I'll tell you this: you won't get far without a bit of magic to aid you, no you won't! But there's a little magic academy not far from here, and since their popularity has fallen, I will just bet that they'll take you in and teach you a charm or two. You'll need it if you want to get to the bottom of Treasure Mountain, beleive you me.

What's that you say? You don't know how to reach the local magic academy?

Well, I suupose I could get you started. I really have nothing better to do as long as the dough is rising...

What do you say? 

The first thing you'll need to do is get yourself a spellbook. It doesn't have to be very large, but it had better have several pages. You're going to need to scribe the spells that you learn on the journey ahead, as well as a few magical techniques. Your mother or father should be able to furnish you with such a spellbook, as well as a quill for writing and maybe a sandwich to take on your journey.

Yes, if you want to reach the heart of Treasure Mountain, you'll have to learn spells from the schools of ${COLOR_Red}Conjuration${SPEECH}, ${COLOR_Red}Transmutation${SPEECH}, ${COLOR_Red}Shadow${SPEECH}, and ${COLOR_Red}Illusion${SPEECH}.

You'll learn ${COLOR_Red}first-level spells${SPEECH}, ${COLOR_Red}second-level spells${SPEECH}, and if you go very far, maybe even ${COLOR_Red}third-level spells${SPEECH}.

Are you ready?

I'm afraid I can't really teach you a great deal, but I do know one little magic charm and one little technique which will at least be enough to get you to the magic academy. Write these in your spellbook.

${SPELL}ls ${RESET}${GREEN}This will show you what is around you, usually files and directories. What's a directory? Well, a directory is a bag that holds files and other directories. It's how you organize files. In this world, every person you meet and every item you encounter is a file. Try this spell in our home, and you can see our screech owl. His name is William"

${SPEECH}There. That's the only spell I know, but the technique I can teach you is quite good: when you run "ls", you should notice that the files and directories around us appear in different colors. If you see a bright green object, that's a magical file, and you can activate its magic. How do you do that? Invoke the magic by typing the filename with a "./" prepended.

${GREEN}For example, once you run "ls", you should be able to see William. He's a bright green owl. To activate him, run the command ${SPELL}./William.sh

${COLOR_Red}Press q to leave${YELLOW}
HEREDOC
