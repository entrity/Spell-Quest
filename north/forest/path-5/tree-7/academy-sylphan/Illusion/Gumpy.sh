#!/bin/bash

fold -w $FOLD -s <<HEREDOC | less -r
${SPEECH}
Eh? Who are you? Did you come here to learn? Oh, Gumpy can teach you, yes, he can! Gumpy is powerful wizard and most respected professor at the forest academy.

Great Gumpy will teach you a spell. $(spell echo) creates... an echo! Oh, Gumpy is so wise!

Watch!

$(spell 'echo "Gumpy is great"')
$RESET$(echo "Gumpy is great!")
$SPEECH
Did you see? Did you hear?

Whatever I command to be echoed is echoed! ...Oh, you don't think that's very great? Not very useful? Well, what if I combine it with a $(alt technique)? Did you learn the arcane symbol $(alt \~)? It means "home." Watch what happens when I echo the home symbol:

$(spell 'echo ~')
$RESET$(echo ~)
$SPEECH
The symbol was expanded into its true meaning! There are many magic tokens such as $(alt \~) which can be expanded with the use of $(spell echo). I have heard it said that most magic users can even create their own magic tokens, but Gumpy does not know how.

Oh, but Gumpy knows another $(alt technique)! The symbol $(alt \>) is called "redirect," and it can be used to save the output of *any* spell into a file!

Watch!

$(spell 'find ~ -iname \"Gump*\" > gumpy.txt')
$(find ~ -iname "Gump*" > gumpy.txt)
Oh, Gumpy is so wise! Gumpy has created an entirely new file. Gumpy named it "gumpy.txt"

If Gumpy looks in the file, Gumpy will see the results of Gumpy's $(spell find) spell.

But if Gumpy uses a redirect on the same file:

$(spell 'echo "Gumpy is wise!" > gumpy.txt')
$(echo "Gumpy is wise!" > gumpy.txt)
Then the old contents of the file are lost! Now gumpy.txt only contains the words "Gumpy is wise!"

But there is a way to write to a file without destroying the earlier contents. Use this symbol: $(alt '>>')

$(spell 'find ~ -iname "Gump*" >> gumpy.txt')
$(find ~ -iname "Gump*" >> gumpy.txt)
Now gumpy.txt contains two things! It contains the output of Gumpy's $(spell echo) *and* Gumpy's $(spell find)!

What? Don't you believe Gumpy? Hmph! Gumpy will prove it to you! But this is the *last* thing Gumpy will teach you. The spell $(spell cat) can show you the content of a file. Go ahead, try $(spell cat gumpy.txt). You will see!

$CONTINUE
HEREDOC

fold -w $FOLD -s <<EOF
$SPEECH
You should try it. Gumpy seems very eager for you to look in his file. Invoke $(spell cat gumpy.txt) and see what happens!
EOF
