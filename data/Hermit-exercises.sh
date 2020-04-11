#!/bin/bash

trap 'exit' SIGINT

cd "$HOME/hut"

wrap <<-EOF

	${SPEECH}Here we go. I'll ask you to perform certain invocations. Press $(alt 'Ctrl+c') at any time if you want to quit these exercises and go on your way. Ready?

EOF
wrap <<-EOF
	${SPEECH}Let's start with the first spell you learnt. Just invoke $(spell ls) here.
EOF
run_exercise "ls" "^ls$" "Hm. I'm looking for a one-word invocation. Try again."

wrap <<-EOF
	${SPEECH}Now, try invoking $(spell ls) with a parameter that lets you see which items are directories and which are executable files and which are just ordinary files.
EOF
run_exercise "ls -F" "^ls -F$" "There should be two words (separated by a space)." "The second word should begin with a $(alt \-)."

wrap <<-EOF
	${SPEECH}Here's something simple: do you remember what spell to invoke to learn the path of your current location?
EOF
run_exercise "pwd" "^pwd$"

wrap <<-EOF
	${SPEECH}Last exercise: there's an owl named $(alt William.sh) in this very directory. What would you invoke to speak with him?
EOF
NO_EXEC_EXERCISE=1 run_exercise "./William.sh" '^\./William\.sh$' "Recall that to execute a file, you need to invoke a path (relative or absolute) using at least one directory in the path. (Please use a relative path for this exercise.)" "Recall that the token which means \"the current directory\" is $(alt .)"
