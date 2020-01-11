#!/bin/bash

tutorial () {
	speak <<-EOF
	${SPEECH}
	I've got a shiny carbuncle here for you if you'll just go to the north forest and perform a little task for me.

	I want a list of all the trees in that forest, except for the ones which inlude the letters $(alt 'a, f, l, or p') in their names. That might be harder than you think because there are many duplicate trees *and* because there's not an easy pattern to the tree names except that they all begin $(alt tree-) and what follows can be any character *except* for a $(alt /) because $(alt /) is used to separate directories in a path.

	Well, the first difficulty can be solved with the $(spell sort) spell. When you use the parameter $(alt '-u') with it, it will remove duplicates from the input after sorting it! (The $(alt u) stands for "unique!")

	As for the second problem, do you remember what the $(alt \[\]) symbols do in regular expressions? Well, when you put a $(alt '^') symbol as the first character within the $(alt \[\]), all the characters within the $(alt \[\]) are treated as $(red negative) matches! It means, "Match anything *except* ..."

	But did you know that $(alt \^) can actually perform another function in regular expressions? When it appears at the very beginning of your regular expression, it means, "match from the very beginning of a line."

	The regular expression $(alt 'foo') would match any of the following:

	${RESET}  foo
	foobar
	abcfoo${SPEECH}

	...But of the three matches above, $(alt '^foo') would match only ${RESET}foobar${SPEECH} because a regex starting with $(alt '^') is looking for a match to appear at the very beginning of the line.

	One more thing: there's also a symbol that can be used in a regex to mean "match at the *end* of a line": $(alt '$'). It works like $(alt '^'), but $(alt '$') should appear at the *end* of the regex (because it's looking for matches at the *end* of a line).

	I suppose I've kept yout from your errands long enough. Remeber, I want a list of the trees, with no duplicates! I want just the tree names, no paths containing directories. Please pipe (not redirect) the answer into me.
	EOF

	learned 'sort -u'
	learned '(regex) ^'
	learned '(regex) [^]'
	learned '(regex) $'

	wrap <<-EOF
	${SPEECH}
	Will you do as the Goblin Butler directs? Pipe a couple of commands together to output a list of tree names from the north forest, excluding any names with the letters a, f, l, or p, and then pipe the output into the Goblin Butler.

	Be sure to exclude any directories in the paths. Be sure to avoid duplicates.${RESET}
	EOF
}
mistake () {
	wrap <<-EOF
	${SPEECH}
	Umm, that's not really what I'm looking for. Are you sure you...

	1. gave me only the names (no directories in the paths)?
	2. eliminated duplicate names?
	3. eliminated names containing a, f, l, or p?
	EOF
}
reward () {
	wrap <<-EOF
	${SPEECH}
	Ah! Very good. In return for your service, I award you this: a $(alt carbuncle)!

	${RESET}The goblin slips a round, shiny stone into your bag.
	EOF
	mkdir -p "${HOME}/bag"
	cp "${DATA}/carbuncle" "${HOME}/bag"
}

if [[ -t 0 ]]; then
	tutorial
else
	FOREST="$HOME/north/forest"
	CORRECT=$(find "$FOREST" -name tree\* | grep -o 'tree-[^aflp]\+$' | sort -u)
	read -d '' STREAM
	if >/dev/null diff -w -q <(echo -e "$CORRECT") <(echo -e "$STREAM"); then
		reward
	else
		mistake
	fi
fi
