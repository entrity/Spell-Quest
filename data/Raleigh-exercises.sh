#!/bin/bash

trap 'exit' SIGINT
export NO_EXEC_EXERCISE=1

wrap <<-EOF

	${SPEECH}Here we go. I'll ask you a few questions which might pertain to our conversation and which might require knowledge from previous conversations. Press $(alt Ctrl)+$(alt c) at any time if you want to quit these exercises and go on your way. Ready?

EOF

wrap <<-EOF
	${SPEECH}Right then, what's the name of the spell which you can use for searching the contents of a file, using special patterns called $(alt regular expressions)?
EOF
run_exercise "grep" "^grep$"

wrap <<-EOF
	${SPEECH}What if, instead of searching the contents of a file, you wanted to search for a file (or directory) with a particular name? What is the name of the spell you should use?
EOF
run_exercise "find" "^find$"

wrap <<-EOF
	${SPEECH}Okay, let's make things harder: what if we had a file $(alt myfile.txt), and you wanted to find a line in it which contained _only_ the word $(alt furor)?
EOF
run_exercise "grep \"^furor$\" myfile.txt" "^grep ['\"]\^furor\\\$['\"] (./)?myfile.txt\$" "Your pattern should use special the special characters $(alt \^) and $(alt \$) because your pattern is intended to specify the start and end of a line in the file." "You had better put quotation marks around your pattern because it contains special characters."

wrap <<-EOF
	${SPEECH}Here's an easier one: what if we had a file $(alt myfile.txt), and you wanted to find a line in it which ended with the word $(alt furor) but might contain additional text?
EOF
run_exercise "grep 'furor$' myfile.txt" "^grep ['\"]furor\\\$['\"] (./)?myfile.txt\$" "Your pattern should _not_ use special the special character $(alt \^) because a matching line might begin with anything." "Your pattern should use special the special character $(alt \$) because a matching line must end with $(alt furor)." "You had better put quotation marks around your pattern because it contains special characters."

wrap <<-EOF
	${SPEECH}What would you invoke to search a file $(alt myfile.txt) for a line containing any character between $(alt a) and $(alt m), followed by any character between $(alt A) and $(alt M)?
EOF
run_exercise "grep '[a-m][A-M]' myfile.txt" "^grep ['\"]\[a-m\]\[A-M\]['\"] (./)?myfile.txt$" "Your pattern should use $(alt [) and $(alt ])." "Your pattern should have 2 instances of $(alt [...]) back-to-back."

wrap <<-EOF
	${SPEECH}What would you invoke to search a file $(alt myfile.txt) for a line beginning with any character in the set $(alt a, d, q, r) and ending with any character in the set $(alt b, s, z), with any number of characters (of any type) between them?
EOF
run_exercise "grep '^[adqr].*[bsz]$' myfile.txt" "^grep ['\"]\^\[adqr\]\.\*\[bsz\]\\\$['\"] (./)?myfile.txt$" "Your pattern should have 2 instances of $(alt [...])." "Your pattern should have an instance of $(alt '.*')"


wrap <<-EOF
	${SPEECH}Last exercise: what would you invoke to search a file $(alt myfile.txt) for a line containing 5 characters from the set $(alt a, d, q, r) all next to each other?
EOF
run_exercise "grep '[adqr]\{5\}$' myfile.txt" "^grep ['\"]\[adqr\]\\{5\\}['\"] (./)?myfile.txt$" "Your pattern should make use of $(alt '\{...\}')."
