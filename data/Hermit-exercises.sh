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
	${SPEECH}What would you invoke if you wanted to look inside the $(alt trunk) over there? (Can you see the trunk? It's $(alt in the same directory that we are).)
EOF
run_exercise "ls trunk" "^ls (\"|')?trunk/?(\"|')?$" "I'm looking for just two words." "The second word should be path of the trunk, relative to our current path."

wrap <<-EOF
	${SPEECH}Now let's just imagine that there were a directory named $(alt foo bar) here. How would you look inside of it? (Bear in mind that there is a blank space in the name.)
EOF
NO_EXEC_EXERCISE=1 run_exercise "ls \"foo bar\"" "^ls (\"|')foo bar/?(\"|')$" "You should put quotation marks around the directory name."

wrap <<-EOF
	${SPEECH}Here's a trickier one: what if you want to look at the directory $(alt above) this one (using the simplest relative path possible for that location)?
EOF
run_exercise "ls .." "^ls (\"|')?\.\./?(\"|')?$" "The relative path for this invocation should have zero $(alt \/) symbols." "The relative path consists only of a $(alt special) token, which consists of two special symbols."

wrap <<-EOF
	${SPEECH}Tricker still, what if you want to look into the cave? (Just where is the cave? Well, it appeared in the results of your previous $(spell ls) invocation.)
EOF
run_exercise "ls ../cave" "^ls (\"|')?\.\./cave/?(\"|')?$" "The relative path has one $(alt \/) symbol." "The relative path includes the $(alt special token) that you used in your previous invocation of $(spell ls)."

wrap <<-EOF
	${SPEECH}Here's something simple: do you remember what spell to invoke to learn the path of your current location?
EOF
run_exercise "pwd" "^pwd$"

wrap <<-EOF
	${SPEECH}The output of your $(spell pwd) invocation (above) is an $(alt absolute path). Can you invoke $(spell ls) with an $(alt absolute path) to look into the directory $(alt above) this one? (Remember that an absolute path is one that begins with the $(alt \/) symbol.)
EOF
if [[ `pwd` =~ \  ]]; then
	run_exercise "ls \"$HOME\"" "^ls (\"|')${HOME}/?(\"|')$"
else
	run_exercise "ls $HOME" "^ls (\"|')?${HOME}/?(\"|')?$"
fi

wrap <<-EOF
	${SPEECH}Last exercise: there's an owl named $(alt William.sh) in this very directory. What would you invoke to speak with him?
EOF
NO_EXEC_EXERCISE=1 run_exercise "./William.sh" '^\./William\.sh$'
