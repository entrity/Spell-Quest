#!/bin/bash

shopt -s expand_aliases
. util/shared.sh


fold -w $FOLD -s <<HEREDOC | less -r
${SPEECH}
 {O,O}
./)_)
  " "  Ah, it's about time someone came to talk with me.

What's that you have there? A spellbook? Ah, that old homebody can teach you a little magic but not much. His problem is that he never leaves his hovel. Maybe if he had a pair of wings like mine his life would be different.

You say you want to go to the local magic academy? Why nothing could be easier! Just spread your wings, hop to the window, and --- what's that? You have no wings? Oh, dear.

Well, I suppose I could teach you a spell or two that would help. Write these down in your spellbook, would you? But **DON"T** invoke the spell yet, or you could be whisked away and not know where!

$(spell cd) and $(spell pwd)

Fantastic spells. One lets you change your location, and the other lets you learn your location. Did you know? "cd" is short for 'change directory', and "pwd" is short for 'present working directory'?

So how do you cast these spells?

"pwd" is simple. Just enter it on the command line. But "cd" requires more skill: it expects you to specify a target, and to use it, you have to have some understanding of the world around you:

Did you run "ls" from this location? You can see that there are two directories: "north" and "south." If you were to invoke "cd north," you would find yourself instantly transported to the "north" directory.


$(spell cd) with no parameter assumes you want to travel to your home directory

$(spell cd \~) ALSO assumes you want to go to your home directory because "~" is a secret symbol for HOME

$(spell cd ..) teleports you up one level. What is a level? Well, when you run "pwd", you might notice that your location is specified as one or more names, separated by a "/". The "/" divides up every location into levels. Your current location is $(alt $(pwd)), so if you invoked $(spell cd ..), you would find yourself transported to $(alt $(dirname $(pwd)))

$(spell cd -) teleports you to the PREVIOUS directory that you occupied.

The next two ways of using "cd" require you to specify a path. What's a path? Well, it's just a directory. When you run *pwd*, you are shown your current path. There are two kinds of path, and that's why there are two more ways of using "cd."

We have names for these two kinds of path: "relative" and "absolute".

A $(alt relative) path contains directions that can be followed from your current location. For instance,
$(spell cd north)
would take you to $(alt $(pwd)/north) if you cast the spell in $(alt $(pwd)). But it would take you to $(alt /fee/fi/fo/north) if you cast it in $(alt /fee/fi/fo).

An $(alt absolute) path contains directions that can be understood from anywhere. An absolute path begins with $(alt /). For instance,
$(spell cd /north)
    uses an absolute path, and it would teleport you to $(alt /north).
$(spell cd $(pwd))
    also uses an absolute path, and it would teleport you to $(alt $(pwd)). 
HEREDOC
