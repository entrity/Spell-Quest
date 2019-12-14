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
	fold -w $FOLD -s <<-HEREDOC | less -r
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
		fold -w $FOLD -s <<-HEREDOC | less -r
		${SPEECH}
		Well done!

		Perhaps, just perhaps you have enough talent to gain admission to $(alt Hattifattener Academy).

		As promised, I'll tell you the secret to gaining entrance:

		$(red Press q to leave)
		HEREDOC
	else
		fold -w $FOLD -s <<-HEREDOC | less -r
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
	fold -w $FOLD -s <<-HEREDOC | less -r
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

	The book is formatted as a CSV. (Grown-up adventurers would probably wish to know that CSV is a format for spreadsheets, and programs like Excel and Google Sheets can save their spreadsheets in CSV format. CSV stands for "comma-separated values" because the columns in a CSV file are separated from each other with commas.)

	Let me show you what a very simple CSV looks like when you view it in a text editor:
	${BRCYAN}
	Month,April,May,June
	Axes,30,26,12
	Pikes,15,15,4
	Bows,10,11,9
	Arrows,88,121,30
	${SPEECH_N}
	This CSV shows how many weapons were available during different months last year. Now suppose that I only wanted to know how many weapons were available in May. You can use the $(spell cut) spell whenever you want to extract a column from CSV data.

	But that's not the only place you can use $(spell cut): any time you have a line of information which is joined by a special character, you can use $(spell cut) to extract sections of it. Have you noticed that paths are like this? They are a series of directories separated by a $(alt \/) character.

	Suppose I had the contents of a $(spell find) command in a file named $(alt found.txt), and it looked like this:
	${BRCYAN}
	north/forest/path-8/tree-6/academy-academic
	north/forest/path-8/tree-16/academic-forestry
	north/forest/path-8/tree-11/academia-forestry
	north/forest/path-8/tree-13/academic-forest
	north/forest/path-8/tree-15/academic-forestry
	north/forest/path-8/tree-7/academy-academia
	${SPEECH_N}
	If I desired only the names of the trees, I could invoke the following:

	$(spell 'cut -d / -f 4 found.txt')

	* $(alt cut) is the name of the spell
	* $(alt \-d) means that the next paramter will be the separating character. "-d" is short for "delimiter."
	* $(alt \/) is the character that separates fields in each row.
	* $(alt \-f) means that the next parameter will the field (or fields) that you want to extract.
	* $(alt 4) is the field we are extracting in this invocation.
	* $(alt found.txt) is the name of the file that contains the information.

	The parameter that follows $(alt \-f) is pretty special because it can be more than just a number. It can be multiple numbers or a range of numbers.

	For instance:

	* $(alt 1,3) would give us the 1st and 3rd column
	* $(alt 2-4) would give us columns 2, 3, and 4
	* $(alt -3) would give us columns 1, 2, and 3
	* $(alt 2-) would give us all columns from 2 onward

	So I need you to find that book and extract its 1st, 2nd, and 13th columns. Remember to save the information into a file in your bag named $(alt book-extract.txt). I guess you can use $(spell cut) to read the information, then use a text editor to create the $(alt book-extract.txt) file.

	Hmm... there's actually an easier way to get the extracted information into your $(alt book-extract.txt) file than opening a text editor and scribing it yourself, but I don't know where the documents which provide instruction on that $(alt technique) have gone. Maybe they're still in one of the classrooms...

	What? You say you can't get started because you don't know which tree has the scroll and book? Have you learned the $(spell find) spell yet? Right, then. Just cast $(spell find) on the forest, looking for any file that ends with $(alt .csv)

	$CONTINUE
	HEREDOC

	learned grep
}
cleanup () {
	fold -w $FOLD -s <<-HEREDOC | less -r
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
	fold -w $FOLD -s <<-HEREDOC | less -r
	Don't look so obvious! Pretend we're talking about the weather while I get a look at this book extract. Hm... oh dear, oh dear. This isn't quite what I was expecting.

	Did you remember to specify $(alt ,) as the delimiter? Did you remember to specify $(alt 1,2,13) as the field selection?
	HEREDOC	
}
fail_scroll_edit () {
	fold -w $FOLD -s <<-HEREDOC | less -r
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
