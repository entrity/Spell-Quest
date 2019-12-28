#!/bin/bash

speak <<-EOF
$(art castle1.txt)
${SPEECH}Welcome, traveler! Please feel free to explore the castle. I'll even unlock the locked doors for you. But I must ask that you stay out of the $(alt tower).

$CONTINUE
EOF

chmod +x "$CASTLE/armory"
chmod +x "$CASTLE/workshop"
chmod +x "$CASTLE/library"
chmod +x "$CASTLE/treasury"
chmod +x "$CASTLE/workshop"

wrap <<-EOF
${SPEECH}The king waves a sparkling scepter, and you hear the sound of bolts clicking open in some of the locks.

The king looks nervously at the door to the $(alt tower), and a glint of concern appears in his eye.
EOF
