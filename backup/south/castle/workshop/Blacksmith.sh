#!/bin/bash

tutorial () {
	speak <<-EOF
	${SPEECH}You appear to be an accomplished adventurer! But I bet you don't have much experience writing programs for $(alt bash). What's $(alt bash), you ask? Why, this environment in which you've been casting your spells is named $(alt bash)!

	${CYAN}You don't need to know this, but "${SPEECH}bash${CYAN}" is short for "Bourne Again Shell." Why is it called that? Because it is the successor to the "Bourne Shell." What's a shell? It means a "command interpreter" on a computer.

	${SPEECH}How can you write a program for $(alt bash)? Create a new file using $(alt $EDITOR). You can name it whatever you please, but it's customary to end $(alt bash) files with $(alt .sh). What should you write in this file of yours? Any spell invocations you please! Here's an example of what I might write in bash program:

	${RESET}find ~/north -iname '*.txt' \> find-output.txt
	grep '[0-9]' find-output.txt \> grep-output.txt

	${SPEECH}Can you see what my program does? It makes a list of all files in the $(alt north) directory which contain at least one numberal in the name and whose name ends in $(alt .txt).

	How can you trigger the bash program you've written? You invoke the spell $(spell bash) with the path to your program as the first parameter. Suppose you have written a program and it is located in the same directory as you and is named $(alt my-program.sh). Just invoke the following:

	$(spell bash my-program.sh)

	You probably wonder if it's possible to activate a bash script by calling $(spell ./my-program.sh). Indeed, there is a way, but I haven't learnt it. Perhaps someone else on your journey shall teach it to you.

	Did you know that it is possible to provide parameters to your program, just as you would to many a spell? But how can you make use of these perameters within your program? In your bash file, you can refer to the first parameter as $(alt '$1'). The second parameter is called $(alt '$2'); the third is $(alt '$3'), and so on. Let's change my script from above to make use of parameters:

	${RESET}find ~/north -iname "\$1" > find-output.txt
	grep "\$2" find-output.txt > grep-output.txt

	${SPEECH}And how would you invoke the program?

	$(spell 'bash my-program.sh "*.txt" "[0-9]"')

	Think about it: using parameters in your script means that you can make a very complicated program but apply it to many different situations.

	I'll let you go in a bit, but before I do, give heed and let me show you a way to search for files matching a name *and* matching certain content. To do this, we're going to want to make and use $(alt variables). What's a variable? It's a placeholder, which can hold one piece of information.

	There are two common ways to create a variable. We can give a variable most any name, provided that it begins with a letter and contains no special characters (except $(alt _)). Let's suppose we've decided to create a variable named $(alt HERE), then $(spell echo) its value:

	${RESET}HERE=/home/someguy/Documents/journal/2011/11/11
	echo \$HERE

	${SPEECH}Notice that when we *set* a variable, we just use its name, but when we *use* the variable, we prepend a $(alt '$') before it.

	Another way to set a variable is the $(spell read) spell:

	$(spell 'read HERE < myfile.txt')

	Do you recognize the $(alt '<') symbol. It's a kind of $(alt redirect). Maybe you've learned other redirects like $(alt '>') and $(alt '>>') and $(alt '<<<'). This redirect means "let the input to this spell be from the file that follows $(alt '<')."

	This usage of $(spell read) will read one line from the file $(alt myfile.txt) and assign it to a variable named $(alt HERE).

	Now let's build a program that will look for files that whose names match a pattern from parameter $(alt '$1') and then select lines from those files that match the pattern from parameter $(alt '$2'):

	${RESET}find ~/north -iname "\$1" > find-output.txt
	while read found_file; do
	  grep "\$2" "$found_file" > grep-output.txt
	done < find-output.txt

	${SPEECH}Do you see that we used the $(spell read) spell and also the $(alt '<') redirect? What you might not have expected is the use of $(alt while). The $(alt while) technique allows us to read a line from the file again and again until the end of the file is reached. When you use while, the pattern is:

	${RESET}
	while read VARIABLE_NAME; do
	  ...
	done < INPUT_FILE

	${SPEECH}(The blank spaces which appear at the start of lines inside of the $(alt while ... done) block are optional. You can always put as many blank spaces as you want at the beginning or end of any line. I've just used them here to help me recognize quickly which lines exist inside of a loop.)

	${SPEECH}Do you think you can use these techniques to build a short bash program? Because I want you to do two things for me, using these techniques.

	First, I want you to find all files and directories within the treasury whose names include three or more numerals (adjacent or not). Please collect these names into a file in your bag called $(alt treasury-numerals.txt)

	Second, I want you to find all of the books in the library which include the word $(alt star) in the title and modify their contents to replace the word $(alt darkness) with the word $(alt light).

	Please come speak to me again when these two tasks are complete, and I will give you a secret that will help you traverse the swamp beyond the mountain.

	$CONTINUE
	EOF

	learned read
	learned '(technique) variables'
	learned '(technique) bash programs'
	learned '(technique) <'
	learned '(technique) while'

	wrap <<-EOF
		${SPEECH}Better to do as the Blacksmith says:
		
		1. Create a file in your bag called $(alt treasury-numerals.txt) containing the names of all files and directories within the treasury which include three or more numerals (adjacent or not).
		
		2. Modify every book in the library whose title includes the word $(alt star), replacing every occurence of the word $(alt darkness) with $(alt light). (This may require a third-level spell. Have you learned any of those yet?)
	EOF
}
test_numerals_task () {
	if cmp "$NUMERALS_FILE" "$HOME/../data/bag/treasury-numerals.txt" >dev/null; then
		return 0
	else
		wrap <<-EOF
		${SPEECH}Hm. That's not quite what I'm looking for. I see you have a $(alt numerals-file.txt) file in your bag, but its contents are not what I expected.
		EOF
		return 1
	fi
}
test_sed_task () {
	local OK=1
	while read -r fpath; do
		local REFERENCE=$HOME/../backup/south/castle/library/$(basename "$fpath")
		if [[ $fpath =~ star ]]; then
			if ! diff -q -w "$fpath" <(sed 's/darkness/light/g' "$REFERENCE"); then
				OK=0
			fi
		elif ! cmp "$fpath" "$REFERENCE"; then
			OK=0
		fi
	done < <(find thisdir/library)
	if ! (($OK)); then
		wrap <<-EOF
		${SPEECH}Hm. That's not quite what I'm looking for. The contents of the library aren't what I expected.
		EOF
		return 1
	fi
}
reward () {
	speak <<-EOF
	${SPEECH}Well done! As promised, let me tell you something that will help you traverse the swamp:

	The path you must take is four segments long, and the word that will guide the first segment is $(alt the).
	EOF
}

NUMERALS_FILE=$HOME/bag/treasury-numerals.txt
if [[ -e "$NUMERALS_FILE" ]]; then
	if test_numerals_task && test_sed_task; then
		reward
	fi
else
	tutorial
fi