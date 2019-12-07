#!/bin/bash

shopt -s expand_aliases
THISDIR=$(dirname "$(readlink -f "$0")")
. $THISDIR/../.util/shared.sh

fold -w $FOLD -s <<HEREDOC | less -r
${SPEECH}${BIGBUN}

Ah! What's all this, then?

Are you planning on entering the forest? I must warn you that a person could become lost in this forest.

What's that, you say? You're looking for the magic academy? You'll never make it through the forest without a spell to aid you.

But I can teach you such a spell! I can indeed.

$(spell find)

It's a way to search for almost anything you might need. It's only a generic first-level spell, but it's very powerful. If invoked with no parameters, it searches for all files and directories contained within your current directory.

Admittedly that's not every useful in a forest. You'd find all manner of trees and winding paths. But if you supply parameters, you can use it very powerfully. The first parameter will always be the path where you want your search to start. (Searches always move downward to deeper paths, never upward to shallower paths.) If you want to start your search from your current location, you can just use $(spell .) to represent the starting location. If you want to start your search from one level above your current location use $(spell ..)

$(spell find .)

All parameters after the location parameter are used to narrow your search. Want to search for items with a particular name? You can do it. Want to find items which were modified more than 6 days ago? You can do it. Want to find items that are at least 3 levels deep? You can do it. Want to find items that are of a particular size? You can do it.

Whew. But I'm just going to show you how to find items of a certain name because that's what you'll need in order to find your way through the forest.

$(spell find "LOCATION" -iname "PATTERN")

There we are. the $(spell -iname) parameter means that whatever pattern follows is a pattern for the item that you want to find. How do you use a pattern? Well, you can use the "$(spell \*)" character as a "wild card."
  _____
 |A .  | _____
 | /.\ ||A ^  | _____
 |(_._)|| / \ ||A _  | _____
 |  |  || \ / || ( ) ||A_ _ |
 |____V||  .  ||(_'_)||( v )|
        |____V||  |  || \ / |
               |____V||  .  |
                      |____V|


How does it work? Well, here's an example:

$(spell find . -iname \"*-*=*\") will match:
${CYAN}
-=
first-directory/a-b=c
foo-bar=baz
abc-=
-=xyz.txt
${SPEECH}
...and many more! But *NOT*:
${CYAN}
=-
foo-barbaz
abc=
${SPEECH}
You may need to try this spell a few times before you get the hang of it.

Notice that I used quotation marks around the pattern. That's important if you have any wild cards or blank spaces in your pattern. Why? Well, I don't know things like that. I'm just a bunny. Perhaps someone later in your travels can explain it to you.

What's that? You still don't know how to find the academy because you don't know what it's called?

Oh... well... this is kind of embarrassing, but I don't entirely remember the name of it. It's two words. The first word is like "academy" or "academia" or something like that. The second word is "sylphan" or maybe "sylvan" or something. Well, on your way, then. You can search the forest ahead.

$(red Press q to leave)
HEREDOC
