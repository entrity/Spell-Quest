#!/bin/bash

speak <<HEREDOC
${SPEECH}
 {O,O}
./)_)
  " "  Hoot! It's about time someone came to talk with me.

What's that you have there? A spellbook? Ah, that old fuddy-duddy can teach you a *little* magic but not much. His problem is that he scarcely ever leaves this hermitage. Maybe if he had a pair of wings like mine his life would be different.

You say you want to go to the local magic academy? Why nothing could be easier! Just spread your wings, hop to the window, and --- what's that? You have no wings? Oh, dear.

Well, I suppose I could teach you a Teleportation spell. Write this down in your spellbook, would you? But *DON'T* invoke the spell yet, or you could be whisked away and not know whither!

$(spell cd) is the "go" spell; it lets you change your location. Its name is short for "change directory."

So what's the real difference between going ($(spell cd)) and looking ($(spell ls))? Going somewhere can change the $(alt relative) path to files and directories around you. Suppose you were in a directory at the path $(alt /foo), and you wanted to repeatedly interact with some files in $(alt /foo/bar). One option would be to stay where you are and type the paths $(alt bar/fileA), $(alt bar/fileB), $(alt bar/fileC), etc. Better still, you could "go" down one level into $(alt bar) by invoking $(spell cd bar) and type the file paths as $(alt fileA), $(alt fileB), $(alt fileC), etc.

Did you know that many spell names are abbreviations? I'll bet that old hermit didn't tell you that, did he? Well, $(alt ls) is short for "list" because it lists the contents of a directory. And $(alt pwd) is short for "present working directory."

So how do you cast $(spell cd)?

Like $(alt ls), $(spell cd) can be cast with or without parameters.

Did you run $(alt ls) yet? You can see that the trunk is actually a directory, which means that you can squeeze into it if you invoke $(spell cd trunk)! And you can move up a level by invoking $(spell cd ..)! And you can stay right where you are by invoking $(spell cd .)! Oh --- I suppose that last one isn't very useful.

As a reminder, our current location is
$(alt $(pwd))

If you wanted to leave this hut and go to the edge forest north of here, you could invoke either of the following (but there are also other ways to write the path for the forest):
$BRCYAN
cd ../north
cd $(canpath ../north)
$SPEECH_N
What if you invoke $(spell cd) with no parameters? You'll be transported to your $(alt home directory). What's that? You didn't know that you had a home? Well, you have! Your home (at least while on this quest) is $(alt $HOME)

There's one other handy $(alt technique) for $(spell cd): if you go somewhere that you don't want to be, you can return to the directory which you previously occupied by invoking $(spell cd -). Suppose you accidently cast $(spell cd) and ended up in your home. Well, you could go right back to where you were last by casting $(spell cd -).

You'll probably learn many, many spells and techniques, so... $(alt '<the owl waves a wing in your direction, and you feel a tingle>') ...there! Now you can cast the spell $(spell lessons) at any time, and you will see a list of all the lessons you have learned. When faced with a challenge that you can't figure out, it might help to remind yourself what abilities you have.

                           {O,O}
                          ./)_)
... Are you still here?     " "
My advice is that you $(spell cd) $(alt northward) of here and see if there's anyone who can guide you further.

$(red Press q to leave)
HEREDOC

if prompt_no "${SPEECH}Would you like to do some exercises on what you've just been taught?"; then

	echo "${RESET}....................................."
	bash "$HOME/../data/William-exercises.sh"
fi

echo -e "${RESET}....................................."
wrap <<-EOF
${SPEECH_N}You should follow William's advice. Invoke $(spell cd ../north)

...But if you think you have a decent command of paths and the spells you've learnt so far, you might consider speaking with the $(alt Imp) in the $(alt cave) outside this hut first...

Don't forget that you can identify special files which you can activate by invoking $(spell ls -F) and looking for items that have the symbol $(alt \*) at the end.
EOF

learned 'cd'
learned 'cd -'
