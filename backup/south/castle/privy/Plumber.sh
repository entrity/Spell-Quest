#!/bin/bash

REFERENCE="$HOME/../data/plumber-letters.csv"

tutorial () {
	speak <<-EOF
	${SPEECH}Oy! What are you thinking, coming in here like this? Can't you see I'm fixing the pipes?

	You may not have thought it, but $(alt pipes) are useful magical tools. They allow you to make work easier. You probably have some experience redirecting the output of some spell into a file, then using that file as input to another spell, but using a $(alt pipe) to connect the two spells will do the same thing more easily. Watch this!

	$(spell "find . | grep '[0-9]'")

	That $(alt '|') symbol is called a $(alt pipe). It means that the output of the first spell should be the input to the second spell. It won't work on all spells; some spells just don't know how to read input from a standard pipe. For instance, you couldn't $(alt pipe) into a $(spell ls) spell.

	You know the spell $(spell grep), do you? Well, let me teach you a pair of parameters to make it more useful. Do you see this file $(alt pipes.txt) here? It shows the contents of my plumbing work. Have a look at the first several lines of the file with me:

	${RESET}$(head -n7 "$(thisdir)/pipes.txt")
	...${SPEECH}

	Suppose we wanted to *avoid* the items that contain "filth." We could use the parameter $(alt "-v"), which tells $(spell grep), "Please output every line *EXCEPT* the ones matching my pattern." Here's what an invocation looks like:

	$(spell grep -v filth pipes.txt)${RESET}
	Pipe  4 contains electronically
	Pipe  5 contains midweek's
	Pipe  7 contains cure
	Pipe  9 contains likable
	Pipe 12 contains enormous
	...${SPEECH}

	The other parameter I want to teach you is $(alt "-o"). It tells $(spell grep), "Please don't output an entire line when you find a match for my pattern, just output the match itself."

	Let's try using both of these parameters with a $(alt pipe). We'll extract only the *numbers* from the lines that *don't* contain filth:

	$(spell 'grep -v filth pipes.txt | grep -o "[0-9]\+"')
	${RESET}4
	5
	7
	9
	12
	...${SPEECH}

	Did you notice that we specified a *file* parameter $(alt pipes.txt) for the first $(spell grep) but not for the $(spell grep) after the $(alt pipe)? That's because we don't want the second $(spell grep) to use any file for input; it should use the first invocation's output as its input.

	Did you know you can use a pipe for a $(alt while ... read) construction?

	${RESET}find . -iname "*.txt" | while read MYVAR; do
	  ...
	done${SPEECH}

	I'll tell you what. If you can do something for me, I'll teach you a secret to help you traverse the swamp. If you've worked with the $(alt Transmutation instructor) at the forest academy north of here, then you should have a file containing phone numbers in your bag. I want the alphabetic letters for every line which does *NOT* have a phone extension. You can recognize a phone extension as any string of characters that begins with an $(alt x) and is followed by one or more numerals, for instance "x70981"

	That's right. Get all the alphabetic characters from the lines that lack phone extensions. I don't want you to create a file from them, though. I want you to pipe the output right into me. Can you do that?

	$CONTINUE
	EOF

	learned "grep -o"
	learned "grep -v"
	learned '(technique) |'

	wrap <<-EOF
	${SPEECH}Wow! The Plumber wants you to activate him again, this time piping information into *him*!

	What did he want? He wanted only the alphabetic parts of the lines which *DON'T* have phone extensions. Use the phone-numbers file from your bag. Have you gotten it yet? And do you still have it?
	EOF
}
test_task () {
	read -d '' PIPED
	PIPED=$(sed 's/\033\[[0-9;]*m//g' <<< "$PIPED")
	diff -q "$REFERENCE" - <<<"$PIPED" >/dev/null
	return $?
}
reward () {
	wrap <<-EOF

	${SPEECH}Ah, just what I asked for! As promised, here is a clue that will help you traverse the swamp.

	The third segment of your path through the swamp should be goverend by the word $(alt is).
	EOF
}

if [[ -t 0 ]]; then
	tutorial
else
	if test_task; then
		reward
	else
		wrap <<-EOF

		${SPEECH}Hm. You did pipe into me, but the input I received was not quite what I expected. Each line I receive should consist of one word. Each word should contain one or more letters. Both upper-case and lower-case letters should be included.
		EOF
	fi
fi
