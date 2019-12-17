#!/bin/bash

trim_whitespace () {
	perl -nle 'print $& while m{\S.*\S}g' "$1" | tr -s ' '
}
check_csv () {
	local FILE="$HOME/bag/$1.csv"
	local GOAL="$UTIL/Raleigh/$1.csv"
	if ! [[ -e "$FILE" ]]; then
		wrap <<-HEREDOC
		${SPEECH}
		What? I expected you to have a "$1.csv" file in your bag, but I don't see one by exactly that name. Have you run $(spell ls) on your bag to make sure it's there? Have you made sure to use the same $(alt capitalization) as I used?

		Please talk to me again when you think you have all the files I need.
		HEREDOC
		return 1
	elif ! >/dev/null cmp "$FILE" "$GOAL"; then
		wrap <<-HEREDOC
		${SPEECH}
		What? Well, your $(alt "$1.csv") file isn't quite what I expected. Have you tried looking into the contents of your "$1.csv" file to see if they look correct?

		Did you talk to $(alt Gumpy)? He's been bragging that he knows a $(alt technique) for transferring the output of a $(spell grep) invocation into a file. That could be useful.
		HEREDOC
		return 1
	fi
}
check_scroll_edit () {
	local BACKUPS="$HOME/../backup"
	local SCROLL_PATH="north/forest/path-11/tree-16/scroll.txt"
	ls "$BACKUPS/$SCROLL_PATH"
	local SCROLL_GOAL=$(sed -e 's/SALUTARY/INIMICAL/' "$BACKUPS/$SCROLL_PATH")
	if ! cmp <(trim_whitespace <(echo -e "$SCROLL_GOAL")) <(trim_whitespace "$HOME/$SCROLL_PATH"); then
		wrap <<-HEREDOC
		${SPEECH}
		Hm. Wait one minute while I gaze into my crystal ball...

		Ehm. It seems the changes you made to the scroll were not as I wished. Did you remember to $(alt save) the file before exiting the text editor?
		HEREDOC
		return 1
	fi
}

get_bag () {
	speak <<-HEREDOC
	${SPEECH}
	Hello, I'm---

	What? You don't have a traveling bag? Oh, you won't get far without one. Talk to $(alt Jaggers) back in the entryway. He'll make sure you get a $(alt bag).

	Then come back here and talk to me for some instruction.

	$(red Press q to leave)
	HEREDOC
	echo -e "${SPEECH}\nBetter to do as he says. Do you remember how to move upward a level? That's where Jaggers is, and Jaggers can tell you how to make a bag in your home directory."
}
final_instruction () {
	speak <<-HEREDOC
	${SPEECH}
	Don't look so obvious! Pretend we're talking about the weather while I get a look at these files... Hm... Well done!

	Perhaps --- just perhaps --- you have enough talent to gain admission to $(alt Hattifattener Academy). As promised, I'll tell you what I can to help you gain entrance:

	$(alt Hattifattener Academy) lies far to the south, beyond the forest, beyond the mountain, in the termagant sea.

	You will be surely be stopped at the gate and questioned. The academy will expect you to know Melisandre's word of aegis, which all graduates of this academy learn. You can find this book in a Melisandre's tome of nice magic. I have a copy of this precious book concealed in a blueberry bush at the edge of the forest. The word you seek can be found on page 85 of the book.

	But that is not all. Take this:

	${CYAN}Raleigh raises a small ground-glass phial with a cork stopper before your face. You can see a dram of clear fluid in the tiny bottle. Raleigh slips it into your bag.

	${SPEECH}There stands a still pool in the very back of a cave beyond the forest. You must add the contents of this bottle to the pool, but take care that you do so from *without* the cave.

	${CYAN}He gives a little shudder.

	${SPEECH}Oh, and you must use the magic word $(alt shibboleth). No go, go on your quest, and mind you don't fall into any trouble.

	$(red Press q to leave)
	HEREDOC

	cp "$HOME/../data/lich-bottle.txt" "$HOME/bag"
	echo ok
}
main_instruction () {
	speak <<-HEREDOC
	${SPEECH}
	Thank you. It feels much calmer in here now.

	So you're a new student, are you? ---Oh? You're not a new student? Oh, you won't stay? Oh, I see. I suppose you have plans to enter the more prestigious $(alt Hattifattener Academy) south of here. Well, I warn you, they won't have you if you can't pass their tests.

	I can tell you something that will aid you in those tests if you're interested. But I'll need you to do something for me first: there's an unruly miscreant who lives in the forest, and I want you to do something about it.

	He keeps a little box in a hollow tree, and in that box should lie a scroll and a book. I want you to do two things: first open the scroll and alter its contents. Second, I want you extract some information from the book. I can teach you how to do both these tasks.

	One way $(alt to alter a scroll) or any text file is to open it in a $(alt text editor). A text editor is *not* like a word processor; a word processor lets you format text with bold, italics, different fonts, tables, even images... But a text editor only lets you edit text.

	There is an abundance of text editors in the world. The easiest one for a new spellcaster can be started by invoking $(spell $EDITOR PATH), where "PATH" is the path of a file. A window will open, and you can make your changes. Then save the file and exit the text editor.

	A text editor can be a convenient way to read a file, even when you don't want to make changes to it.

	The scroll should have instructions written on it. What alteration do I want you to make? At some point in the scroll will be instructions to write a magic word somewhere. I want you to alter the scroll so that its magic word is replaced with the word INIMICAL.

	As for the book in the tree, you mustn't take it with you because then that ruffian will know I was responsible for its disappearance. Instead, you should extract certain information from it. When you return here to give me the information, don't mention what you read. I don't want Jaggers or anyone else to overhear. Instead, you should put the information $(alt into files in your bag). Then just come back here and say hello to me. I'll take a peak into the file while we're talking about other things.

	The book is a long list of information about individuals who used to inhabit this land. But there are too many lines for me to concern myself with, so I want you to extract only the lines which include items of interest to me:

	1. I want you to save lines containing the name $(alt John) into a file named $(alt John.csv) in your bag.

	2. I want you to save lines which have at least three adjacent capital letters (like AAA or XYZ) into a file named $(alt with-capitals.csv) in your bag.

	3. I want you to save lines containing phone numbers into a file named $(alt phone-numbers.csv) in your bag. What's a "phone number," you ask? As near as I have been able to determine, it used to be something people used to communicate. But that's not important; what *is* important is how to recognize a phone number:

	A phone number has ten numerals, split up into three groups. Sometimes phone numbers are written like this: $(alt 800-867-5309). And sometimes they're written like this: $(alt '(800) 867-5309'). But I want you to *ignore* any numbers if they are not written like the two examples I just gave.

	To complete this task, you'll need to make use of a spell which allows you to filter lines which match a $(alt pattern) which you get to specify. Here's an example of how to invoke it:

	$(spell 'grep "^[0-9]\{3\}c[ ]+b.$" myfile.txt')

	* $(alt grep) is the name of the spell

	* $(alt '"^[0-9]\{3\}c[ ]+b.$"') is the pattern. I'll talk more about this in a minute.

	* $(alt myfile.txt) is the input file. Any lines from this file which match my pattern will be printed. All others will be ignored.

	$(spell grep) uses much more complicated patterns than $(spell find) does. There's a name for these complicated patterns: "regular expressions." Let me walk you through a the elements of my the example regular expression which I gave a moment ago:
	
	* When brackets ($(alt [])) appear, they mean "match *any* of the characters that appear between these brackets." So a regular expression of $(alt '^[abc]$') would match $(alt a) or $(alt b) or $(alt c) but *nothing* else!
	
	* When a $(alt '+') follows a pair of brackets, it means "match one or more of these characters." So a regular expression of $(alt '^[abc]+$') would match $(alt a), $(alt aa) $(alt bcca), $(alt ccccc), and many more.
	
	* When an $(alt '*') follows a pair of brachets, it means "match zero or more of these characters." So a regular expression of $(alt '^[abc]*$') would match any of the lines that $(alt '^[abc]+$') would match, but it would also match an empty line!
	
	* The $(alt '+') and $(alt '*') don't have to follow a pair of brackets, though. When they follow an ordinary character, they mean "match one or more (or zero or more) of this character."
		
	* When $(alt -) appears inside a set of brackets and between two other characters it means "match any characters in a range." For example, $(alt '[0-9]') would match any single character between 0 and 9. And $(alt '[a-cD-G3-6]') would match any of the following characters: a, b, c, D, E, F, G, 3, 4, 5, 6.
	
	* When curly braces $(alt '\{\}') appear, they work like a $(alt \+) or $(alt \*), except that they mean "match exactly the number of repetitions specified by the numbers inside the curly braces." For instance, $(alt '[a-z]\{4\}') means "match exactly four characters between a and z." You can actually specify multiple numbers, separated by commas or joined by a hypen: $(alt '[a-z]\{2,4\}') means "match 2 or 4 characters between a and z," and $(alt '[a-z]\{3-5\}') means "match anywhere between 3 and 5 characters between a and z."
	
	* The $(alt .) character has a special meaning in a regular expression. It is a wild card which means "exactly one of any character." 

	With a little bit of practice, regular expressions aren't too hard to write, but they *can* be pretty difficult to read. Don't feel discouraged if you can't interpret the example I gave above.

	Hmm... there's actually an easier way to get the extracted information into your bagged files than opening a text editor and scribing it yourself, but I don't know where the documents which provide instruction on that $(alt technique) have gone. Maybe they're still in one of the classrooms...

	What? You say you can't get started because you don't know which tree has the scroll and book? Have you learned the $(spell find) spell yet? Right, then. Just cast $(spell find) on the forest, looking for a file named $(alt spreadsheet.csv)

	$CONTINUE
	HEREDOC

	wrap <<-EOF
	$SPEECH
	Do you remember how to get to the edge of the forest? You could try either of the following:

	$(spell 'cd ~/north/forest')
	$(spell 'cd ../../../..')

	Then you'll have to find the hollow tree that contains the scroll and $(alt spreadsheet.csv). Did you make notes about all of the things Raleigh wants you to do?

	EOF

	learned $EDITOR
	learned grep
}
cleanup () {
	speak <<-HEREDOC
	${SPEECH}
	Ah! Can it be a student? --Oh! Who made this mess?

	No, no use trying to explain. You'll have to clean it up at once, and I will teach not a single charm until you've put everything back as it should be.

	$(alt The broom belongs in the Closet. And that rag in the Cupboard should be a bucket in the Closet.)

	Talk to me again after you've fixed this mess.

	$(red Press q to leave)
	HEREDOC

	wrap <<-EOF
		${SPEECH}The broom belongs in the Closet. And that rag which is currently in the Cupboard should be transformed into a bucket in the Closet. You probably need to use $(spell mv).
		EOF
}

if ! [[ -e "$HOME/bag" ]]; then
	get_bag
elif [[ -e "$HOME/bag/John.csv" ]]; then
	if check_csv John && check_csv with-capitals && check_csv phone-numbers && check_scroll_edit; then
		final_instruction
	fi
elif [[ -e Closet/broom ]] && [[ -e Closet/bucket ]] && [[ -e Closet/mop ]]; then
	main_instruction
else
	cleanup
fi
