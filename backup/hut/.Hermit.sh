decompose_path () {
	PTH="$(pwd)"
	while [[ -n "$PTH" ]]; do
		echo $PTH
		PTH="$(dirname "$PTH")"
		PTH="${PTH%/}"
	done
	echo /
}

speak <<-HEREDOC
${SPEECH}
So your friends have gone off to that Warty Hogs school to become wizards and witches, have they? What's that? You don't want to learn magic, you just want to be a treasure hunter?

Bah and piffle! You won't go far without a bit of magic of your own, treasure hunter or no! But I suppose you could learn enough to get your treasure hunt on its way at the local magic academy.

What's that you say? You don't know how to reach the local magic academy?

Well, I suppose I could get you started, just enough to put you on the road. What do you say?

The first thing you'll need to do is get yourself a spellbook. It doesn't have to be very large, but it had better have several pages. You're going to need to scribe the spells that you learn on the journey ahead, as well as a few magical techniques. Your mother or father should be able to furnish you with such a spellbook, as well as a quill for writing and maybe a sandwich to take on your journey.

You'll have to learn spells of Transmutation, Conjuration, Teleportation, Divination, Destruction, and Illusion, to name a few. You'll need first-level spells, second-level spells, and perhaps even a third-level spell or two.

I'm afraid I can't really teach you a great deal, but I do know charm or two, and I'm handy with an enchantment. Here is your first spell: $(spell ls) is a "look" spell. It lets you look not just in front of you but *anywhere*, even faraway places. Its only limitation is that you have to give the location of where you want to look. Write it down as a first-level Divination spell.

How do you cast it? Just type $(spell ls), followed by a space, then a $(alt path). What's a "path," you ask? A $(alt path) is how people specify the location of a $(alt file) or $(alt directory).

Files and directories are distinguished by what they can hold: a $(alt file) holds words, sounds, images, or things of that nature; but a $(alt directory) is like a bag. It can hold files or other directories---or even you!

That's right, wherever you are, your location is in a directory. Do you know the path for your current location? It's $(alt $(pwd))

Notice that a path is a series of directories, joined by the $(alt \/) symbol. As you move from left to right when reading a path, you are moving into deeper and deeper directories.
$CYAN
$(decompose_path | tac | xargs printf "  %s\n" )
$SPEECH_N
So if you want to look inside your current directory, invoke:

$(spell ls \"$(pwd)\")

Always put a space between the name of the spell and its parameters. Then press $(alt Enter) or $(alt Return) when you're ready for the spell to be cast.

Did you notice that I put $(alt \"quotation marks\") around the path? That isn't strictly necessary, but if the path contains spaces or other special characters, it becomes important. Just imagine if your path were $(alt /foo/My Documents/bar). The spell would look like this:

$(spell ls /foo/My Documents/bar)

...and it would be interpreted as if you had provided *two* parameters:

$(spell ls \"/foo/My\" \"Documents/bar\")

You can avoid this by the use of 'single quotes' or "double quotes":

$(spell ls \'/foo/My Documents/bar\')
$(spell ls \"/foo/My Documents/bar\")

If you invoke $(spell ls) with no paramters, you will just look at your current location:

$(spell ls)

That's pretty easy. Try it out now.

${CONTINUE}
HEREDOC

echo -e "$SPEECH\nDo as the old hermit said: invoke $(spell ls) with no parameters. Remember to press $(alt Enter) or $(alt Return) after $(spell ls).\n$RESET" | wrap
printf "$ "
read -e CMD
regexp="^[ ]*ls[ ]*$"
while ! [[ $CMD =~ $regexp ]]; do
	>&2 echo -e "$SPEECH\nHm. That's not quite what you should do. Just enter $(spell ls) with no quotation marks and nothing after it. Then hit $(alt Enter).\n$RESET" | wrap
	printf "$ "
	read -e CMD
done

speak <<-HEREDOC
\$ $CMD
$(ls --color=always)
${SPEECH}
Well done! Do you see that list up there? One of the things you can see is my trunk. It's a directory, but there's nothing in it right, now I'm afraid.

You don't believe me? Feel free to look. Oh, you don't want to look because you don't want to type that long path? Well, usually people don't actually make use of the entire path.

Trying to look into the trunk by typing the entire path would be like saying, "Walk all the way up to $(alt /), then walk all the way back here, then look in the trunk." No, you can just specify a path relative to our current location. Our current location is:
$(alt $(pwd))
The trunk's whole path is:
$(alt $(readlink -f trunk))
Its path relative to our current path is just:
$(alt trunk)

(Notice that a relative path NEVER starts with the $(alt /) symbol.)

Go ahead. Try looking in the trunk, and you'll see that it's empty.

$CONTINUE
HEREDOC

echo -e "$SPEECH\nDo as the old hermit said: invoke $(spell ls) with $(alt trunk) as your parameter. Remember to press $(alt Enter) or $(alt Return).\n$RESET" | wrap
printf "$ "
read -e CMD
regexp="^[ ]*ls[ ]*[\"']*trunk[\"']*[ ]*$"
while ! [[ $CMD =~ $regexp ]]; do
	>&2 echo -e "${SPEECH}\nHm. That's not quite what you should do.\nJust enter $(spell ls trunk) or $(spell 'ls "trunk"') or $(spell "ls 'trunk'"). Then hit $(alt Enter).\n$RESET"
	printf "$ "
	read -e CMD
done

speak <<-HEREDOC
\$ $CMD
$(ls --color=always trunk)
${SPEECH}
Well done! There was no output because the trunk was empty.

Well, I have just a few more things to teach you before you embark on your lunatick treasure hunt.

The first $(alt technique) is the use of the $(alt ..) token. When used in a path, this token means "upward one level." All of the following paths are equivalent:
$BRCYAN
..
$(dirname "$(pwd)")
$(pwd)/..
$(pwd)/../../$(basename "$(dirname "$(pwd)")")
$SPEECH_N
If you want, you can look at the contents of the directory one level up from here by invoking $(spell ls ..) Another $(alt technique) is the use of the $(alt .) token. This token signifies your current directory. So right now, the following two paths are equivalent:
$BRCYAN
.
$(pwd)
$SPEECH_N
You may think that's not useful, but I shall show you now that it is! The last technique I have to teach you is how to $(alt activate a file). Most files cannot be activated; they just hold information, but some files can be activated as if they were spells. You can recognize them by their color, or you can run $(spell ls) with a $(spell -F) parameter. When you run $(spell ls -F), it will add a $(alt \*) symbol onto the end of files that can be activated. And it will add a $(alt \/) symbol on to the end of directories.

Any of the following will work (and you can come up with other invocations that will work as well):
$BRCYAN
ls -F
ls -F .
ls . -F
ls -F "$(pwd)"
ls "$(pwd)" -F
$SPEECH_N
If you invoke $(spell ls -F) here, you will see:
$RESET
$(ls -F --color=always)
$SPEECH
You can see that William, that green owl in the corner who is eyeing you carefully, can be activated.

So how do you activate such a file? You must invoke its path using $(alt at least one directory in the path). So if the file is in your current directory, you can use the $(alt .) token. Here are a few of the ways that you can invoke William.sh:
$BRGREEN
./William.sh
../$(basename "$(pwd)")/William.sh
$(pwd)/William.sh
$SPEECH_N
Well, the last thing I have to teach you is a simple spell: $(spell pwd). It is a first-level Divination spell. If you cast it, it will show you your current location.

Now it's time for met to collect mushrooms. Good luck on your lunatick treasure hunt. You should talk to William before you go.

$CONTINUE
HEREDOC

echo -e "$SPEECH\nThe strange hermit totters away and is gone, leaving you alone in the hut.\n\nYou should try to talk to William. Remeber to invoke $(spell ./William.sh)"

learned ls
learned pwd
learned '(technique) activate script'
learned '(path element) .'
learned '(path element) ..'