#!/bin/bash

speak <<-EOF
${SPEECH}
Were you not afraid to enter this dark cave? I'm not afraid. Whenever a monster appears, I hide inside the box!

${CYAN}The imp gestures to Daphne's Toothy "Coffer," a strongbox whose lid is clamped down as tight as a clamshell. The seam between the box and the lid is protected with a row of sharp, interlocking teeth. The coffer stirs slightly.${SPEECH}

Most people don't know how to open the box! Its name has whitespace and special characters. You might suppose you could use quotation marks around its name when calling $(alt cd) or $(alt ls) or any other spell, but you can't because the name already contains *BOTH* kinds of quotation mark. Imagine trying to invoke either of the following:

${SPELL}ls 'Daphne's Toothy "Coffer"'${RESET}${SPEECH}
${SPELL}ls "Daphne's Toothy "Coffer""${RESET}${SPEECH}

The single quote symbol $(alt "'") won't work because the single quote symbol in ${CYAN}Daphne's${SPEECH} will be interpreted as the end of the quotation.

The double quote symbol $(alt '"') won't work because the double quote at the start of ${CYAN}"Coffer"${SPEECH} will be interpreted as the end of the quotation.

But you can still reference this box by using a special technique, called an $(alt escape characater). The $(alt escape character) is the $(alt \\) symbol. When the $(alt \\) symbol appears in a string of text, it means, "The next symbol should be interpreted as part of the text."

You've already seen how some characters may be interpreted as special controls instead of text: the space character is used to mean, "That's the end of the command or the parameter; what comes after the space is a new and different parameter." You've seen how quotation marks can be used to mean, "Everything inside of this quotation is a single parameter."

So to get into the box, I invoke:

${SPELL}cd Daphne\'s\ Toothy\ \"Coffer\"${RESET}${SPEECH}

What's that? You think that's too much to type and a monster would surely catch you before you could type it all? But didn't you know? You almost *never* have to type an entire filename or path. I'll teach you the technique of $(alt tab completion):

After you have typed a character or a few that are part of a filename or directory, you can almost always tap the $(alt TAB) key on your keyboard to have the rest of the name magically filled in for you. How many characters do you need to type? You need to type only enough characters so that it is obvious to anyone which of the contents of the directory you mean. For example, suppose you are in a directory which contains the following three files:

${RESET}hand-axe.txt
halberd.txt
glaive.txt

${SPEECH}Let's suppose you want to $(alt cat) the contents of $(alt hand-axe.txt). You would have to type more than just $(alt cat ha) because there is more than one file that begins with $(alt ha). That means it's not obvious whether you mean to access $(alt hand-axe.txt) or $(alt halberd.txt). But if you type $(alt cat han) and then press $(alt TAB), then your command line will be automatically completed to read $(alt cat hand-axe.txt)

If you wanted to access $(alt glaive.txt), you could just type $(alt cat g) and then $(alt TAB) because there is only one item that matches $(alt g).

If you want to $(alt cd) into ${CYAN}Daphne's Toothy "Coffer"${RESET}${SPEECH}, you can just type $(alt cd D) and then $(alt TAB) because there is only one file or directory in this place that begins with $(alt D).

This works even for directories. Let's suppose you want to access $(alt ~/deep/stormy/wood). If there are no other matches, you could type $(alt '~/d<TAB>s<TAB>w<TAB>'). After each $(alt TAB), the command line would fill in some missing characters to reach the next level in the path.

${CONTINUE}
EOF

learned '(technique) escape-character'
learned '(technique) tab-completion'
