decompose_path () {
	PTH="$(pwd)"
	while [[ -n "$PTH" ]]; do
		echo $PTH
		PTH="$(dirname "$PTH")"
		PTH="${PTH%/}"
	done
	echo /
}

fold -w 60 -s <<-HEREDOC | less -r
${SPEECH}
Who goes there? Oh, I wasn't expecting visitors.

So you're feeling disappointed because all your friends have gone off to that Warty Hogs school to become wizards and witches? What's that? You don't want to learn magic, you just want to be a treasure hunter?

Bah and piffle! You won't go far without a bit of magic of your own, treasure hunter or no!

$(spell ls) is a "look" spell. It lets you look not just in front of you but *anywhere*, even faraway places. Its only limitation is that you have to give the location of where you want to look. Write it down as a first-level Divination spell.

How do you cast it? Just type $(spell ls), followed by a space, followed by a $(alt path). What's a "path," you ask? A $(alt path) is how people specify the location of a $(alt file) or $(alt directory).

Files and directories are distinguished by what they can hold: a $(alt file) holds words, sounds, images, or things of that nature; but a $(alt directory) is like a bag. It can hold files or other directories---or even you!

That's right, wherever you are, your location is in a directory. Do you know the path for your current location? It's $(alt $(pwd))

Notice that a path is a series of directories, joined by the $(alt \/) symbol. As you move from left to right when reading a path, you are moving into deeper and deeper directories.
$CYAN
$(decompose_path | tac | xargs printf "  %s\n" )
$SPEECH_N
So if you want to look inside your current directory, invoke:

$(spell ls \"$(pwd)\")

Always put a space between the name of the spell and its parameters. Then press "Enter" or "Return" when you're ready for the spell to be cast.

Did you notice that I put $(alt \"quotation marks\") around the path? That isn't strictly necessary, but if the path contains spaces, it becomes important. Just imagine if your path were $(alt /foo/My Documents/bar). The spell would look like this:

$(spell ls /foo/My Documents/bar)

...and it would be interpreted as if you had provided *two* parameters:

$(spell ls \"/foo/My\" \"Documents/bar\")

You can avoid this by the use of 'single quotes' or "double quotes":

$(spell ls \'/foo/My Documents/bar\')

The spell would see the space between "/foo/My" and "Documents/bar" and think you were trying to give it *two* parameters! Putting "quotating marks" around a spell's paramters ensures that it is treated like a single parameter. You can use "double quotes" or 'single quotes'.

If you invoke $(spell ls) with no paramters, you will just look at your current location:

$(spell ls)

That's pretty easy. Try it out now.

${CONTINUE}
HEREDOC

echo -e "$SPEECH\nDo as the old hermit said: invoke \"ls\" with no parameters. Remember to press \"Enter\" or \"Return\" after \"ls.\"\n$RESET"
printf "$ "
read CMD
regexp="^[ ]*ls[ ]*$"
while ! [[ $CMD =~ $regexp ]]; do
	>&2 echo -e "$SPEECH\nHm. That's not quite what you should do.\nJust enter \"ls\" with no quotation marks and nothing after it. Then hit Enter.\n$RESET"
	printf "$ "
	read CMD
done

fold -w 60 -s <<-HEREDOC | less -r
\$ $CMD
$(ls --color=always)
${SPEECH}
Well done! You can see that there are two things in this location. One is William, a bright green owl, who is eyeing you suspiciously. The other is my trunk. There's nothing in it right, now I'm afraid.

You don't believe me? Feel free to look. Oh, you don't want to look because you don't want to type that long path? Well, usually people don't make use of the entire path, starting all the way from $(alt /) and going to $(alt $(pwd)).

Trying to look into the trunk and typing the entire path would be like saying, "Walk all the way up to $(alt /), then walk all the way back here, then look in the trunk." No, you can just specify a path relative to our current location. Our current location is:
$(alt $(pwd))
The trunk's whole path is:
$(alt $(readlink -f trunk))
It's path relative to our current path is just:
$(alt trunk)

(Notice that the relative path does NOT start with the $(alt /) symbol.)

Go ahead. Try looking in the trunk, and you'll see that it's empty.

$CONTINUE
HEREDOC

echo -e "$SPEECH\nDo as the old hermit said: invoke \"ls\" with \"trunk\" as your parameter. Remember to press \"Enter\" or \"Return.\"\n$RESET"
printf "$ "
read CMD
regexp="^[ ]*ls[ ]*[\"']*trunk[\"']*[ ]*$"
while ! [[ $CMD =~ $regexp ]]; do
	>&2 echo -e "${SPEECH}\nHm. That's not quite what you should do.\nJust enter $(spell ls trunk) or $(spell 'ls "trunk"') or $(spell "ls 'trunk'"). Then hit Enter.\n$RESET"
	printf "$ "
	read CMD
done

fold -w 60 -s <<-HEREDOC | less -r
\$ $CMD
$(ls --color=always trunk)
${SPEECH}
Well done! There was no output because the trunk was empty.

Well, I have just two more things to teach you before you embark on your lunatick treasure hunt. No, they aren't spells. I don't know much magic. They are techniques.

The first technique is the use of $(alt ..) symbol. When used in a path, this symbol means "upward one level." All of the following paths are equivalent:

$BRCYAN
..
$(dirname "$(pwd)")
$(pwd)/..
$(pwd)/../../$(basename "$(dirname "$(pwd)")")
$SPEECH_N

If you want, you can look at the contents of the directory one level up from here by invoking $(spell ls ..)
HEREDOC

echo $SPEECH
# $(ls --color=always -F)

echo
echo "He totters away and is gone. Try out that spell he taught you!"