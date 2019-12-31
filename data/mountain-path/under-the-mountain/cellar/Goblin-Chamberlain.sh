#!/bin/bash

tutorial () {
	speak <<-EOF
	${SPEECH}
	Hmm... So much to do, so much to do. There's a feast scheduled for tonight, and I have too few hands to pull all of the food. Could I ask you to please identify which barrels of brew shall be wanted?

	Oh, it's very easy. I have a list of barrels here in $(alt barrels.txt). We can have a look at the first 8 lines by invoking $(spell head -n 8 barrels.txt). Oh, you didn't know? This spell $(spell head) will fetch the first few lines of any file for you. There's another spell $(spell tail) which will fetch the last few lines.

	The only parameter required to invoke either of these spells is just the name of the file you want to access, but you can add the parameters $(alt '-n NUMBER') to specify the number of lines you want to see.

	$(spell head) and $(spell tail) are functions which also know how to read from a pipe or a redirect, just as $(spell grep) can do. So I could invoke something like $(spell 'find . | head -n 5') to view the first 5 files or directories.

	Back to the matter at hand, then: let's look at the first 8 lines of $(alt barrels.txt):

	${RESET}$(head -n8 "$(thisdir)/barrels.txt")${SPEECH}

	You can see that the file holds blocks of text. The first line of each block is the name of the barrel. The second line contains ingredients.

	I need to you give me a list of the barrels which include $(alt saffron) as an ingredient. You won't need $(spell head) or $(spell tail) to do this, but you will need $(spell grep). There are a couple of parameters that will make $(spell grep) more powerful: $(alt '-A NUMBER') and $(alt '-B NUMBER'). What do $(alt A) and $(alt B) mean? They are short for $(alt after) and $(alt before)! They mean "when you find a match, also display NUMBER lines before/after the match." Here's an example usage:

	$(spell grep -A 3 somefile.txt)

	When you use the $(alt '-A') or $(alt '-B') parameter, $(spell grep) will output a line consisting of only $(alt '--') between each match. So I want you to do a little bit of extra work to remove these lines. $(red But) you can't just use $(alt '--') as a parameter for $(spell grep)! Some spells, including $(sell grep), recognize $(alt '--') as a special parameter which means "all the parameters before this are optional, and all parameters after this are required." So you can invoke $(spell 'grep -- --').

	I want you to only find the lines that hold the names of the barrels. Don't include the lists of ingredients! Please pipe the results into me the next time you activate me.

	Do you need a hint? Pipe a wrong answer into me, and I'll give you a hint.

	$CONTINUE
	EOF

	learned head
	learned tail
	learned 'grep -A'
	learned 'grep -B'

	wrap <<-EOF
	${SPEECH}Hm. It sounds like you need to pipe a list of barrel names into the Goblin Chef. Make sure that they're the names from $(alt barrels.txt) which have $(alt saffron) among their ingredients.
	EOF
}
reward () {
	wrap <<-EOF
	${SPEECH}Ah! Very good. In return for your service, I award you this: a 
	EOF
}
mistake () {
	wrap <<-EOF
	${SPEECH}No, no, that's not it. You should be able to accomplish this task in a single command using pipes to connect $(alt three) invocations of $(spell grep).

	For the first of the $(spell grep) invocations, you'll need to use one of the parameters that I taught you. For the others, you can use one (or none) of the parameters you learned from other instructors.
	EOF
}

if [[ -t 0 ]]; then
	tutorial
else
	CORRECT=$(grep -B 1 saffron "$(thisdir)/barrels.txt" | grep -v saffron)
	read -d '' STREAM
	if [[ $STREAM == $CORRECT ]]; then
		reward
	else
		mistake
	fi
fi
