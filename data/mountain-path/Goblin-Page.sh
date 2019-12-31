#!/bin/bash

tutorial () {
	speak <<-EOF
	You've probably learned a couple of ways to look at the contents of files. Have you learned $(spell cat) and $(spell "$EDITOR")? There's a convenient spell that's perhaps a midpoint between these two very different options: $(spell less)

	In fact: $(spell less) is the spell I'm using to talk to you right now. It's the spell that almost everyone has used to talk to you so far. It allows you to press $(alt UP) and $(alt DOWN) and $(alt q).

	There are, in fact, other commands you can use with $(spell less), but I won't take your time to go over those. If you want to learn them, you can do a web search for $(spell less). *OR* you can use another spell to show you a manual on how to use $(spell less). This spell is called $(spell man), which is short for "manual." You can invoke it like this:

	$(spell man less)

	But that's not all: you can use $(spell man) to obtain information on almost every spell. You can invoke $(spell man find), $(spell man mv), $(spell man grep), and so on!

	Whew. But I meant to talk to you about $(spell less): did you know that you can pipe into $(spell less)? This is useful when you want to examine very long outputs, like so:

	$(spell 'find . | less')

	$CONTINUE
	EOF

	learned less
	learned man
}

tutorial
