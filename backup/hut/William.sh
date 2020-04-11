#!/bin/bash

speak <<HEREDOC
${SPEECH}
 {O,O}
./)_)
  " "  Hoot! It's about time someone came to talk with me.

What's that you have there? A spellbook? Ah, that old fuddy-duddy can teach you a *little* magic but not much. His problem is that he scarcely ever leaves this hermitage. Maybe if he had a pair of wings like mine his life would be different.

You say you want to go to the local magic academy? Why nothing could be easier! Just spread your wings, hop to the window, and --- what's that? You have no wings? Oh, dear.

Well, I suppose I could teach you a first-level Teleportation spell. Write this down in your spellbook, would you? But *DON'T* invoke the spell yet, or you could be whisked away and not know whither!

$(spell cd) is the "go" spell; it lets you change your location. Its name is short for "change directory."

Did you know that many spell names are abbreviations? I'll bet that old hermit didn't tell you that, did he? Well, $(alt ls) is short for "list" because it lists the contents of a directory. And $(alt pwd) is short for "present working directory."

So how do you cast $(spell cd)? The $(spell cd) spell expects a single parameter which is the $(alt path) of the location to which you wish to teleport. Now calm down, calm down. I know that the Hermit told you about paths and you saw that they could be very, very long like $(alt "$(pwd)"), but paths actually can be very short because two kinds of path exist!

Let's consider two imaginary paths:

* $(alt /foo/bar)
* $(alt /foo/bar/qux)

Now imagine that we are located in the first of these paths $(alt /foo/bar) and I wanted to ask you how to get to the second path $(alt /foo/bar/qux). If you gave too much heed to the Hermit, you might tell me I can get there by following the path $(alt /foo/bar/qux), but that's madness! It's like saying, "First, walk all the way up to the top-level directory $(alt \/); second, walk all the way back here to $(alt /foo/bar); third, enter $(alt qux)."

The simple fact is that, relative to our location in $(alt /foo/bar), the shortest path to $(alt /foo/bar/qux) is simply $(alt qux). It's as easy as that!

So how would we cast $(spell cd) if we want to enter $(alt /foo/bar/qux) from $(alt /foo/bar)? We can actually cast *either* of the following:

$(spell cd qux)
$(spell cd /foo/bar/qux)

This demonstrates the two kinds of path: $(alt relative) and $(alt absolute). A $(alt relative) path is "relative to your current location," so it is only correct from your current location. An $(alt absolute) path is correct from any location. Here's a quick way to distinguish them:

1. A $(alt relative) path *never* begins with a $(alt \/) symbol.
2. An $(alt absolute) path *always* begins with a $(alt \/) symbol.

But what you've learnt so far won't make life easy enough for you, I think. Let's return to our imagined location of $(alt /foo/bar). What if you wanted to travel to $(alt /foo/win/joy)? Yes, it's easy to see that you could travel using the absolute path by casting $(spell cd /foo/win/joy). ...But how would you do it with a relative path?

The difficulty is that you need to start by going *up* a level from $(alt /foo/bar) to $(alt /foo) before going downward into $(alt win/joy). There's a special token that means, "upward one level": $(alt ..). Therefore, you can use a relative path by casting $(spell cd ../win/joy). You could even break this up into multiple commands, such as $(spell cd ..), followed by $(spell cd win/joy).

Whew! Well, that's almost all you need to know about $(spell cd). But there are two more tricks.

First, what happens if you invoke $(spell cd) with *no* parameters? The answer is that it will take you to your home directory. What? You didn't know that you have a home? Ha! Ha ha ha ha ha! How laughable! But of course you have a home! Your home (at least while on this quest) is '$(alt "$HOME")'.

At some point, you might invoke $(spell cd) with no parameters by accident and be whisked away. It could take you a long time to prepare the spell to teleport back to where you were previously unless you know the second trick: if you cast $(spell 'cd -'), you will teleport back to whichever directory you previously occupied. (This works even if your previous invocation of $(spell cd) was *not* to your home directory.)

The last thing you must know before you go on your way is how to use quotation marks. Let me show you what I mean: $(spell "cd \"/User/My Documents\""). Did you notice that I put $(alt \"quotation marks\") around the path? That isn't strictly necessary in every case, but if the path contains spaces or other special characters, it becomes important. Without quotation marks, my invocation would look like this:

$(spell "cd /User/My Documents")

...and it would be interpreted as if I had provided *two* parameters:

$(spell cd \"/User/My\" \"Documents\")

You can avoid this by the use of 'single quotes' or "double quotes":

$(spell cd \'/User/My Documents\')
$(spell cd \"/User/My Documents\")

And you can put them around any parameter (even if it's not a $(alt path)) to tell your spell, "This is one paramter, not two, not three, not more --- only one!" What if you have multiple parameters but they contain spaces? Use quotation marks, as in this example: $(spell cat "-e" "/User/My Documents/my file.txt"). (Of course, you don't need quotation marks around the first of those two parameters because there is no blank space nor special characters, but using quotation marks didn't hurt the invocation.)

And that's all you need to know! You'll probably learn many, many spells and techniques on your quest, so... $(alt '<the owl waves a wing in your direction, and you feel a tingle>') ...there! Now you can cast the spell $(spell lessons) at any time, and you will see a list of all the lessons you have learned. When faced with a challenge that you can't figure out, it might help to remind yourself what abilities you have.

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
