#!/bin/bash

trap 'exit' SIGINT

cd "$HOME/hut"

wrap <<-EOF

	${SPEECH}Here we go. I'll ask you to perform certain invocations. Press $(alt Ctrl)+$(alt c) at any time if you want to quit these exercises and go on your way. Ready?

EOF

wrap <<-EOF
	${SPEECH}To review, what spell lets you check your current location?
EOF
run_exercise "pwd" "^pwd$"

wrap <<-EOF
	${SPEECH}What would you invoke if you wanted to climb inside the $(alt trunk) over there, using the shortest path possible? (Can you see the trunk? It's $(alt in the same directory that we are).)
EOF
run_exercise "cd trunk" "^cd (\"|')?trunk/?(\"|')?$" "I'm looking for just two words." "The second word should be path of the trunk, relative to our current path."

wrap <<-EOF
	${SPEECH}Alright, how would you teleport $(alt home) by use of an $(alt arcane symbol)?
EOF
NO_EXEC_EXERCISE=1 run_exercise "cd ~" "^cd ~$"

wrap <<-EOF
	${SPEECH}Now let's just imagine that there were a directory named $(alt foo bar) here. How would you move into it? (Bear in mind that there is a blank space in the name.)
EOF
NO_EXEC_EXERCISE=1 run_exercise "cd \"foo bar\"" "^cd (\"|')foo bar/?(\"|')$" "You should put quotation marks around the directory name."

wrap <<-EOF
	${SPEECH}What if you want to move into the directory $(alt above) this one (using the simplest relative path possible for that location)?
EOF
run_exercise "cd .." "^cd (\"|')?\.\./?(\"|')?$" "The relative path for this invocation should have zero $(alt \/) symbols." "The relative path consists only of a $(alt special) token, which consists of two special symbols."

wrap <<-EOF
	${SPEECH}You are currently located at:
	${RESET}`pwd`
	${SPEECH}And there is another directory located at:
	${RESET}$HOME/cave/tunnel
	${SPEECH}
	How would to go into that tunnel in a single command $(alt using a relative path)?
EOF
NO_EXEC_EXERCISE=1 run_exercise "cd ../cave/tunnel" "^cd (\"|')?\.\./cave/tunnel/?(\"|')?$" "Your spell invocation should include only one paramter." "The first token in your parameter should be $(alt ..)"

wrap <<-EOF
	${SPEECH}What would you invoke if you wanted to quickly teleport to your $(alt home) directory with a brief invocation that does _not_ use the $(alt '~') symbol?
EOF
run_exercise "cd" "^cd$" "Your invocation should have *zero* parameters."

wrap <<-EOF
	${SPEECH}What would you invoke if you wanted to quickly teleport to the last directory that you occupied?
EOF
run_exercise "cd -" "^cd -$" "Your invocation should have *one* parameter."
