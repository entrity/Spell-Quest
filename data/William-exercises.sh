#!/bin/bash

trap 'exit' SIGINT

cd "$HOME/hut"

wrap <<-EOF

	${SPEECH}Here we go. I'll ask you to perform certain invocations. Press $(alt 'Ctrl+c') at any time if you want to quit these exercises and go on your way. Ready?

EOF

wrap <<-EOF
	${SPEECH}To review, what spell lets you check your current location?
EOF
run_exercise "pwd" "^pwd$"
wrap <<-EOF
	${SPEECH}What would you invoke to go up one level? (One level in the path output by your previous spell invocation.)
EOF
NO_EXEC_EXERCISE=1 run_exercise "cd .." "^cd (\"|')?\.\./?(\"|')?$" "Your spell's parameter should be relative path which has zero $(alt \/) symbols." "The relative path consists only of a $(alt special) token, which consists of two special symbols."

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
	${SPEECH}Last exercise: imagine there existed a directory named $(alt My Documents) in front of you (in this very directory). How would you go into it (using a relative path)?
EOF
NO_EXEC_EXERCISE=1 run_exercise "cd \"My Documents\"" "^cd (\"|')My Documents(\"|')$" "Your spell invocation should include only one paramter." "Your parameter should be wrapped in quotation marks."
