#!/bin/bash

. "$HOME/../.start/aliases.sh"

SPEECH_N=${RESET}

speak <<-EOF
${RESET}Hello! Right now, I am talking to you. You can't enter commands when someone is talking to you, but you can press the $(alt up) and $(alt down) arrow keys or $(alt PageUp) and $(alt PageDown) or $(alt u) and $(alt d) to scroll through what I have to say.

${YELLOW}$(art tower.txt)

${RESET}You might wish to increase the text size by use of the menu (or by hitting $(alt Command)+$(alt +) on MacOS or $(alt Ctrl)+$(alt Shift)+$(alt +) on other systems). You can also maximize this window by clicking the 'maximize' icon in one of the upper corners of the window.

${RESET}You will speak with many people on this quest. The normal way to stop someone talking is to press $(red q). If you end up pressing an unexpected key and can't get away from someone who's talking to you, try pressing $(red Escape) and/or $(red 'Ctrl+c') once or twice, then press $(red q). (You might need to press $(red Backspace) a few times too, if you find that you've started entering text in the bottom left corner.)

${CONTINUE}
EOF
