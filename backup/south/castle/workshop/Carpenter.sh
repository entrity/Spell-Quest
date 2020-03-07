#!/bin/bash

tutorial () {
	speak <<-EOF
	$SPEECH
	Shaping wood all day, every day. That's what they expect from me. But when I have free time, I like to work with spreadsheets. Do you know what spreadsheets are? They're tables for holding information.

	Do you see this file $(alt monsters.csv) here? It's a spreadsheet. If you want, you can open it in $(alt Microsoft Excel) or $(alt Google Sheets) or $(alt LibreOffice Calc). Let's look at the first few lines of it ...

	${RESET}$(head monsters.csv)${SPEECH_N}

	That doesn't look much like a table, does it? But if you were to open it in $(alt Microsoft Excel) or one of those other programs, you would see rows and columns of information describing various monsters.

	Do you notice the commas in the excerpt above? In a CSV file, commas are used to separate the columns of information. $(alt CSV) stands for $(alt comma-separated values). (There are a lot of different formats that can store a spreadsheet! This is just one of them, and it's one of the simplest!)

	Do you know there's a spell called $(spell cut) that can help you extract information from spreadsheets? Actually, it can extract information from a lot of file types and output types, but this is an example where it shines.

	With a name like "(spell cut)," you might expect it to make a file shorter, but actually its effect is just to extract one or more columns from some input. Watch this:

	$(spell 'cut -d , -f 1 monsters.csv')
	${RESET}$(head monsters.csv | cut -d , -f 1)${SPEECH_N}

	I've trimmed the output of the $(spell cut) spell so that we only see the first few lines. Let's examine the parameters for the spell:

	* The $(alt '-d') parameter means, "Use the next parameter as a delimiter to split the input into columns." $(alt D) is short for "delimiter." The next parameter in my invocation was a $(alt comma) because I knew that the file's columns are separated by commas.
	* The $(alt '-f') parameter means, "The next parameter tells which column(s) I want to extract." $(alt F) is short for "field." I gave the parameter $(alt 1) to extract only the first columns, but I could in fact have given a list of columns or a range of columns such as $(alt '-f 2,4,5') or $(alt -f '3-11'). If I want to extract a range of columns that goes all the way to the last column, I can omit the second column number from my parameter like this: $(alt '-f 3-').
	* The remaining parameter is the path of the file which I want to use as input. If you have learnt about pipes from the castle Plumber, then you should know that you can pipe input into the $(spell cut) spell and not have to specify an input file at all.

	There's an additional use for the $(spell cut) spell. You can treat the individual characters of a file as if they were columns. You don't need to specify $(alt \-f) or $(alt \-d); instead specify $(alt '-c'), which is short for "character." Would you like an exercise to try it out?

	This may be a little tricky. You'll need to use a pipe ($(alt '|')) or a redirect ($(alt '>')) to accomplish it. I want you to extract the fifth character of the fourth column from all of the rows in $(alt monsters.csv). (A lot of the lines of output will be blank.) Save the output to a new file called $(alt extract.txt) in this directory. Speak with me again, and I'll check your work.

	$CONTINUE
	EOF

	learned cut

	wrap <<-EOF

	${SPEECH}The Carpenter wants you to $(spell cut) the fifth character of the fourth column of $(alt monsters.csv) and store the output in a file named $(alt extract.txt).${RESET}
	EOF
}

prompt_repeat () {
	echo
	if prompt_no "Do you want me to repeat my instruction?"; then
		tutorial
	fi
}

check_work () {
	if cut -d , -f 4 monsters.csv | cut -c 5 | 2>&1 >/dev/null diff -qwB extract.txt -; then
		wrap <<-EOF

		${SPEECH}Aha! Well done! You are ready to cut your way out of any situation! I wish you speed on your quest!
		EOF
	else
		wrap <<-EOF

		${SPEECH}Well, that's not quite right. Your output should only have one character on each non-blank line. And there should be quite a few blank lines because the fourth column of $(alt monsters.csv) is blank for many of the rows of $(alt monsters.csv). Your output should have one line for each line of the input file.
		EOF
	fi
}

if [[ -e extract.txt ]]; then
	check_work
	prompt_repeat
else
	tutorial
fi
