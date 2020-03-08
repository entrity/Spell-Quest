#!/bin/bash

if [[ -e "$HOME/bag/magic-axe.sh" ]]; then
	READINESS="I think you can probably take on this monster. Probably."
else
	READINESS="I don't think you can handle this monster without something doughty in your inventory."
fi

speak <<-EOF
${SPEECH}Oh, what to do? What to do?

I can't return home because that horrible monster on top of the spire has sealed the passage to the mountain. The fighters went ahead to do battle with it, but that was an hour ago, and I haven't heard a sound since.

Are you thinking of going ahead? ${READINESS}

Oh, you can't see the monster from here, but if you proceed, it will surely make itself known!

How about I tell you a secret? It may not be of much use, but it's all I know!

Have you noticed that file names tend to end with a period, followed by a few characters, like $(alt foo.txt) or $(alt bar.sh) or $(alt qux.html)? That last part of the filename is called the file $(alt extension).

Conventionally, a $(alt .txt) file contains text and a $(alt .sh) file contains a shell script and a $(alt .html) file contains a web page and so on. But here's the secret: file extensions can be whatever you want.

You could make a shell script named $(alt myscript.html). You could make a text file named $(alt mytext.sh). You could make an image file named $(alt myimage.silly-nonsense). You can even make a file with no extension at all! Or even a file that *only* has an extension!

That's all I know! Go in safety!

$CONTINUE
EOF
