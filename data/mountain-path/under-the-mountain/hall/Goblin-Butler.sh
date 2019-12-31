#!/bin/bash

tutorial () {
	speak <<-EOF
	I've got a shiny carbuncle here for you if you'll just go to the north forest and perform a little task for me.

	I want a list of all the trees in that forest. That might be harder than you think because there are many duplicate trees *and* because there's not an easy pattern to the tree names except that they all begin $(alt tree-) and what follows can be any character *except* for a $(alt /) because $(alt /) is used to separate directories in a path.

	Well, the first difficulty can be solved with the $(sell sort) spell. When you use the parameter $(alt '-u') with it, it will remove duplicates from the input after sorting it! (The $(alt u) stands for "unique!")

	As for the second problem, do you remember what the $(alt \[\]) symbols do in regular expressions? Well, when you put a $(alt '^') symbol as the first character within the $(alt \[\]), all the characters within the $(alt \[\]) are treated as $(red negative) matches! It means, "Match anything *except* ..."

	But did you know that $(alt \^) can actually perform another function in regular expressions? When it appears at the very beginning of your regular expression, it means, "match from the very beginning of a line."

	The regular expression $(alt 'foo') would match any of the following:

	${RESET}  foo
	foobar
	abcfoo${SPEECH}

	...But $(alt '^foo') would not match the first or third lines because the $(alt foo) needs to appear at the very beginning of the line for a regex of $(alt '^foo').

	One more thing: there's also a symbol that can be used in a regex to mean "match at the *end* of a line": $(alt '$')

	EOF

	learned 'sort -u'
	learned '(regex) ^'
	learned '(regex) [^]'
	learned '(regex) $'
}

tutorial
