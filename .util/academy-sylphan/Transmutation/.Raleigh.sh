#!/bin/bash

THISDIR=$(dirname "$(readlink -f "$0")")
ROOTDIR="${THISDIR%/Spell-Quest/*}/Spell-Quest"
. "$ROOTDIR/.util/shared.sh"

if [[ -e "$HOME/bag/trees.txt" ]]; then
	LIST=$(find "$ROOTDIR/north/forest" -name tree\* | xargs basename --multiple | sort -u)
	if cmp "$HOME/bag/trees.txt" <<<"$LIST"; then
fold -w $FOLD -s <<HEREDOC | less -r
${SPEECH}
Well done!

Perhaps, just perhaps you have enough talent to gain admission to $(alt Hattifattener Academy).

As promised, I'll tell you the secret to gaining entrance:


HEREDOC
	else
fold -w $FOLD -s <<HEREDOC | less -r
${SPEECH}
Well, I do see a file called $(alt trees.txt) in your bag, but it doesn't contain the right contents.

Have you tried using $(spell less) to inspect each of the files you made in the course of this task?

You should first make a file that contains the output of your $(spell find) invocation. (Inspect that file to make sure its contents look pretty good.)

Then that file should be a parameter for your $(spell cut) invocation, and you should save its output to a new file. (Inspect that file to make sure its contents look pretty good.)

Then that file should be a parameter for your $(spell sort) invocation, and you should save its output as $(alt trees.txt). (Inspect that file to make sure its contents look pretty good.)
HEREDOC
	fi
elif ! [[ -e "$HOME/bag" ]]; then
fold -w $FOLD -s <<HEREDOC | less -r
${SPEECH}
What? You don't have a traveling bag? Oh, you won't get far without one. Talk to $(alt Jaggers) back in the entryway. He'll make sure you get a $(alt bag).

Then come back here and talk to me for some instruction.

$(red Press q to leave)
HEREDOC

elif [[ -e Closet/broom ]] && [[ -e Closet/bucket ]] && [[ -e Closet/mop ]]; then

fold -w $FOLD -s <<HEREDOC | less -r
${SPEECH}
Thank you. It feels much calmer in here now.

So you're a new student, are you? --Oh? You're not? You won't stay?

I see. I suppose you have plans to enter the more prestigious $(alt Hattifattener Academy) south of here. Well, they won't have you if you can't pass their tests.

I suppose I could teach you a little magic before you leave. It might help you in those tests.

I need someone to catalogue all of the trees in this forest, but there are many duplicate trees, so you'll need $(alt two first-level spells) and $(alt one new technique) to do the task.

Do this for me, and I'll tell you a secret that will help you gain admittance to $(alt Hattifattener Academy).

$(alt REDIRECT)

The first technique I want you to use is called a "redirect", and you can accomplish it by use of this arcane symbol: $(spell \>)

Many spells, such as $(spell find) will print output where you can see it. You can redirect that output, saving it into to a file by adding $(spell '> DESTINATION') to the end of your invocation. But beware: if your DESTINATION file already exists, it will be overwritten!

For example:

$(spell 'ls > MyList.txt')

...There! I just created a file called $(alt MyList.txt), which contains the output of my invocation of $(spell ls). You can look at the contents of that file by invoking $(spell less MyList.txt). --No, that's not one of the two spells you'll need for this tree-cataloguing task, but it is a useful spell, so copy it into your spellbook. It's a first-level Generic spell.

After you invoke $(spell less) and finish reading the contents of a file, you will need to actually terminate the spell in order to move on and do anything else. Press 'q' to do so. (If you get stuck because of pressing the wrong button, press ESC a time or two, then press 'q'.)

$(alt CUT)

$(spell cut) is a spell that will let you extract part of each line of a file. This is useful when working with paths like $(alt foo/bar/tree/qux) when you know that you only want part of the path, for example the first level, the second level, the third, etc.

If I wanted the tree portion of the path that I just mentioned, I would need the path to be split on the $(alt /) character and then to take 3rd section of it.

Suppose I had this path saved in a file named $(alt MyFile.txt). I could extract the section I wanted by invoking:

$(spell cut -d / -f 3 MyFile.txt)

Can you figure out how that worked? You may need to experiment. Write that down. Then invoke $(spell find) to locate all of the trees in the forest, and redirect the list of trees into a new file. Then use $(spell cut) to extract just the tree names. (Each tree name begins $(alt tree-).)

But the task is not done then. I said there are many duplicate trees. You'll need one more spell.

$(alt SORT)

$(spell sort -u FILE) will let you remove duplicates from a list. (It will also sort the list, but that's not important to me.)

I'll need you to invoke $(spell sort -u) on your list of trees and redirect it to a new file. To be specific, I want you to redirect the output to a file $(alt in your bag). Then come back here and talk to me again. Please name the new file $(alt trees.txt).

Oh, do you know how to get back to the forest? You can go up a level from your current location by invoking $(spell cd ..)

$(red Press q to leave)
HEREDOC
ls "$THISDIR" > MyList.txt

else

fold -w $FOLD -s <<HEREDOC | less -r
${SPEECH}
Ah! Can it be a student? --Oh! Who made this mess?

No, no use trying to explain. You'll have to clean it up at once, and I will teach not a single charm until you've put everything back as it should be.

$(alt The broom belongs in the Closet. And that rag in the Cupboard should be a bucket in the Closet.)

Talk to me again after you've fixed this mess.
HEREDOC

fi
