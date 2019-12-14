#!/bin/bash


trim_whitespace () {
	perl -nle 'print $& while m{\S.*\S}g' "$1" | tr -s ' '
}
check_book_extract () {
	>/dev/null cmp <(trim_whitespace "$HOME/bag/book-extract.txt") <<-HEREDOC
	Violet Fungus,Plant,1
	Giant Centipede,Beast,3
	Steam Mephit,Elemental,12
	Swarm of Bats,Beast,4
	Pseudodragon,Dragon,10
	Smoke Mephit,Elemental,11
	Swarm of Ravens,Beast,6
	Winged Kobold,Humanoid,8
	Goblin,Humanoid,8
	HEREDOC
}
check_scroll_edit () {
	>/dev/null cmp <(trim_whitespace "$HOME/north/forest/path-11/tree-16/scroll.txt") <<-HEREDOC

	HEREDOC
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
	LIST=$(find "$HOME/north/forest" -name tree\* | xargs basename --multiple | sort -u)
	if cmp "$HOME/bag/trees.txt" <<<"$LIST"; then
		speak <<-HEREDOC
		${SPEECH}
		Well done!

		Perhaps, just perhaps you have enough talent to gain admission to $(alt Hattifattener Academy).

		As promised, I'll tell you the secret to gaining entrance:

		$(red Press q to leave)
		HEREDOC
	else
		speak <<-HEREDOC
		${SPEECH}
		Well, I do see a file called $(alt trees.txt) in your bag, but it doesn't contain the right contents.

		Have you tried using $(spell less) to inspect each of the files you made in the course of this task?

		You should first make a file that contains the output of your $(spell find) invocation. (Inspect that file to make sure its contents look pretty good.)

		Then that file should be a parameter for your $(spell cut) invocation, and you should save its output to a new file. (Inspect that file to make sure its contents look pretty good.)

		Then that file should be a parameter for your $(spell sort) invocation, and you should save its output as $(alt trees.txt). (Inspect that file to make sure its contents look pretty good.)

		$(red Press q to leave)
		HEREDOC
	fi
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

	The scroll should have instructions written on it. What alteration do I want you to make? That depends on what the instructions are. Whatever they say, you must make them say the opposite!

	As for the book in the tree, you mustn't take it with you because then that ruffian will know I was responsible for its disappearance. Instead, you should extract certain information from it. When you return here to give me the information, don't mention what you read. I don't want Jaggers or anyone else to overhear. Instead, you should put the information $(alt into a file in your bag). Name the file $(alt book-extract.txt). Then just come back here and say hello to me. I'll take a peak into the file while we're talking about other things.

	The book is a long list of information about individuals who used to inhabit this land. But there are too many lines for me to concern myself with, so I want you to extract only the lines which include phone numbers. What's a "phone number," you ask? As near as I have been able to determine, it used to be something people used to communicate. But that's not important; what *is* important is how to recognize a phone number:

	A phone number has ten numerals, split up into three groups. Sometimes phone numbers are written like this: $(alt 800-867-5309). Sometimes they're written like this: $(alt '(800) 867-5309'). And sometimes they're written like this: $(alt '800.867.5309').

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
		
	* When $(alt -) appears inside a set of brackets it means "match any characters in a range." For example, $(alt '[0-9]') would match any single character between 0 and 9. And $(alt '[a-cD-G3-6]') would match any of the following characters: a, b, c, D, E, F, G, 3, 4, 5, 6.
	
	* When curly braces $(alt '\{\}') appear, they work like a $(alt \+) or $(alt \*), except that they mean "match exactly the number of repetitions specified by the numbers inside the curly braces." For instance, $(alt '[a-z]\{4\}') means "match exactly four characters between a and z." You can actually specify multiple numbers, separated by commas or joined by a hypen: $(alt '[a-z]\{2,4\}') means "match 2 or 4 characters between a and z," and $(alt '[a-z]\{3-5\}') means "match anywhere between 3 and 5 characters between a and z."
	
	* The $(alt .) character has a special meaning in a regular expression. It is a wild card which means "exactly one of any character." 

	With a little bit of practice, regular expressions aren't too hard to write, but they *can* be pretty difficult to read. Don't feel discouraged if you can't interpret the example I gave above.



	Hmm... there's actually an easier way to get the extracted information into your $(alt book-extract.txt) file than opening a text editor and scribing it yourself, but I don't know where the documents which provide instruction on that $(alt technique) have gone. Maybe they're still in one of the classrooms...

	What? You say you can't get started because you don't know which tree has the scroll and book? Have you learned the $(spell find) spell yet? Right, then. Just cast $(spell find) on the forest, looking for any file that ends with $(alt .csv)

	$CONTINUE
	HEREDOC

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

	echo 'The broom belongs in the Closet. And that rag which is currently in the Cupboard should be transformed into a bucket in the Closet.'
}
fail_book_extract_edit () {
	speak <<-HEREDOC
	Don't look so obvious! Pretend we're talking about the weather while I get a look at this book extract. Hm... oh dear, oh dear. This isn't quite what I was expecting.

	Did you remember to specify $(alt ,) as the delimiter? Did you remember to specify $(alt 1,2,13) as the field selection?
	HEREDOC	
}
fail_scroll_edit () {
	speak <<-HEREDOC
	Hm. Wait one minute while I gaze into my crystal ball...

	Ehm. It seems the changes you made to the scroll were not as I directed. Did you remember to $(alt save) the file before exiting the text editor? Did you remember that upper-case and lower-case are distinct?
	HEREDOC
}


if ! [[ -e "$HOME/bag" ]]; then
	get_bag
elif [[ -e "$HOME/bag/book-extract.txt" ]]; then
	final_instruction
elif [[ -e Closet/broom ]] && [[ -e Closet/bucket ]] && [[ -e Closet/mop ]]; then
	main_instruction
else
	cleanup
fi
