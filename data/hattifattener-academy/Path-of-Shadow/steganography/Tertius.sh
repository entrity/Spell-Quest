#!/bin/bash

SPEECH_N=$BRMAGENTA
SPEECH=$SPEECH_N

intro () {
	speak <<-EOF
	$(art hippocampus.txt)

	${SPEECH_N}
	So you want to keep things hidden, really hidden? So secret that nobody even knows to that there are secrets to be probed? You have come to the right place. But proceed no further if you have not learnt the ways of the $(alt Path of Binary) yet. Return here after completing that path.

	If you are ready to go on, take a minute to look at the two images I have here. Do you remember the use of $(spell $IMAGER)? That's one way to open an image file.

	See if you can spot any differences between the two. After you've finished looking, come back and speak with me again. When you come back, use a parameter to tell me what creature you saw in the images.

	$CONTINUE
	EOF

	wrap <<-EOF

	${SPEECH}Have a look at the two images here, then speak with Tertius again, providing a parameter that tells him what creature you saw in the images.
	EOF
}
tutorial_1 () {
	speak <<-EOF
	$(art hippocampus.txt)

	${SPEECH_N}The two images appear to be identical, but they aren't. One of them has a message hidden within it. How is that possible, you ask? Let me tell you a thing or two about how images.

	Each dot in a video screen is actually composed of three tinier dots: one red, one green, one blue. A combination of these three colours makes every colour you ever see on a video screen. Now, each dot in an image is called a $(alt pixel). (The word "pixel" is a portmanteau of "$(alt pic)ture $(alt el)ement.") Each pixel can be represented by quadruplet of numbers: one for red, one for green, one for blue, and one for opacity (commonly called "alpha" channel).

	Each of these four numbers can have a value between 0 and 255. That's a pretty wide range, so if we make a small change to any of these four values, say plus or minus one, then no human can detect the difference. We can make tiny changes to _every_ pixel in an image, if we want, and no one would know.

	Here's how we can hide a message in the image:

	1. Decide on a message
	2. Compute the bit-string encoding for this message. (This requires some understanding of binary and ascii, so consult the instructors on the Path of Binary if you haven't already.)
	3. Change every pixel value to be odd or even, depending on the bit-string encoding

	Here's an example:

	Let decide that our message is just the word $(alt ok). Ascii encoding of the two characters $(alt o) and $(alt k) gives us the following two bit-strings: $(alt 01101111 01101011).

	Let's line up the red, green, blue, and alpha values from the first few pixels of one of these unicorn images, along with the bits from these two bit-strings. Then look at the "modified" column.

	Can you see what changes I've made to transform the "original" column into the "modified" column?

	${RESET}
	                  orig   bit   modified
	                  ---- : --- : --------
	pixel 1 :   red :    2 :  0  :    2
	        : green :  121 :  1  :  121
	        :  blue :   50 :  1  :   51
	        : alpha :  156 :  0  :  156
	pixel 2 :   red :  114 :  1  :  115
	        : green :  127 :  1  :  127
	        :  blue :    3 :  1  :    3
	        : alpha :  187 :  1  :  187
	pixel 3 :   red :   15 :  0  :   14
	        : green :  221 :  1  :  221
	        :  blue :   44 :  1  :   45
	        : alpha :   58 :  0  :   58
	pixel 4 :   red :  211 :  1  :  211
	        : green :  224 :  0  :  224
	        :  blue :   14 :  1  :   15
	        : alpha :  150 :  1  :  151

	${SPEECH}Everywhere that the bit-string indicated an even number ($(alt 0)), I altered the pixel value to be even; everywhere that the bit-string indicated an odd number ($(alt 1)), I altered the pixel value to be odd. These modifications never changed any pixel value by more than 1 (and sometimes, it didn't change the pixel value at all), but anyone who knows to look for the message can find it: just read the new pixel values from the "modified" column and write down the sequence of evens and odds:

	If we are given only the "modified" image, we can see the following in the pixel values: $(alt even, odd, odd, even, odd, odd, odd, ...) That gives us the bit-string $(alt 0, 1, 1, 0, 1, 1, 1, ...) Looking at these values, we actually recover the secret message bit-strings: $(alt 01101111 01101011). And using our knowledge of $(alt binary) and $(alt ascii), we can recover the textual message $(alt ok).

	I've hidden a message in $(alt b.bmp). I'll help you recover it, and if you do, I'll tell you a secret.

	Here's step number one:

	Except for plain text files and program code, most files consist of two parts: a header and a body. The body of an image file contains the pixel values. The header contains other information, such as how wide and how tall the image is supposed to be. Your first task is to extract $(alt only the body) from $(alt b.bmp) and save it to a new file. Let's name the new file $(alt body.bin) and save it to this directory.

	So how much of the file constitutes the header of $(alt b.bmp)? Since you're new to image files, I'll spare you the trouble of discovering it on your own; it's $(red 54 bytes). Oh, you don't know what a $(alt byte) is? A byte is the smallest piece of information that a file can hold. It is enough information to write one character, such as the letter $(alt a) or the numeral $(alt 8) or the symbol $(alt \=). If you can write a single character with one byte, can you use your knowledge of $(alt ascii) to figure out how many $(alt bits) are in a byte? ... There are 8 bits in a byte!

	You've already learnt some basic skill with $(spell read), $(spell head), and $(spell tail). I'll teach you that each of these spells can take a parameter to tell them exactly how many bytes you want them to take. Suppose you want exactly $(alt N) bytes, you'd invoke the following:

	$(spell read -n N)
	$(spell head -c N)
	$(spell tail -c N)

	You want the last bytes of the file, so the spell you need to invoke is $(spell tail). But you don't know how big the body is, do you? Well, you can actually make use of a $(alt \+) symbol to tell $(spell tail), "Start at the Nth byte, and read all the way to the end of the file."

	$(spell tail -c +N)

	Since the header is 54 bytes long, you'll want to start $(spell tail) at the 55th byte.

	Talk to me again when you've created the $(alt body.bin) file.
	
	$CONTINUE
	EOF

	learned 'read -n N'
	learned 'head -c N'
	learned 'tail -c N'
	learned 'tail -c +N'

	wrap <<-EOF

	${SPEECH}Did you understand what Tertius wants? You should $(spell tail) the $(alt b.bmp) file to extract the image body into a new file named $(alt body.bin). The body begins at byte #55. Talk to him again when you've finished.
	EOF
}
tutorial_2 () {
	speak <<-EOF
	$(art hippocampus.txt)
	$SPEECH
	Good on you! You'll be a fine Shadowcaster yet!

	Now for the true challenge: extract the hidden message. If you've already completed the Path of Binary, this should be no insurmountable challenge, but I'm sure it will be complicated enough that you shall wish to write one or more bash scripts to invoke all of the necessary spells.

	Before you get started, I'll caution you that in addition to what you learnt on the Path of Binary, you'll want to use $(spell cut).

	Here's what you must do with $(alt body.bin):

	1. Use a spell from the Path of Binary to convert the contents of the file to bit-strings.
	2. Take only the last bit from each of the bit-strings. (The last bit of each byte indicates whether the byte is even or odd.)
	3. Save these bits to a temporary file. Call your file $(alt bitstrings.txt) and save it in this directory. Once you have it, talk with me again.
	
	I'll teach you something to get rid of the $(alt newline) characters in your temporary file: use the $(spell tr) spell. $(spell tr) is an abbreviation for "translate" because its primary use is to replace one set of characters with another set of characters. But in truth, I've never used it for that purpose. I usually use it for the sole purpose of deleting newline characters from another spell's output. You can use it to delete any character you like by use of the $(alt \-d) paramter, which must be followed by the character that you wish to delete. So how to you type a $(alt newline) character? The answer is that you should write a combination of two symbols to signify a $(alt newline): $(alt '\n'). I like to pipe the output of one spell into $(spell tr) like so:

	$(spell "somespell | tr -d '\\\n'")

	You might think that you could pipe to $(spell "sed 's/\\\n//'") to remove the $(alt newline) characters that way, but $(spell sed) has a limitation: whenever it encounters a $(alt newline) character, it stops editing its existing line and starts looking at the next line. That makes it impossible to remove newlines with $(spell sed)!

	$CONTINUE
	EOF

	learned 'tr -d'

	wrap <<-EOF
	
	${SPEECH}Wow, you have a lot to do!

	1. Use a spell from the Path of Binary to convert the contents of the file to bit-strings.
	2. Take only the last bit from each of the bit-strings.
	3. Save these bits to a temporary file. Call your file $(alt bitstrings.txt) and save it in this directory.

	Then talk with Tertius again.
	EOF
}
tutorial_3 () {
	speak <<-EOF
	$(art hippocampus.txt)
	${SPEECH}
	Alright, now that you have your bitstrings, you are ready to press onward. Before you do, though, I'll caution you that in addition to what you learnt on the Path of Binary, you'll want to use a $(alt while) loop and $(spell read \-n N).

	Do the following in a $(alt while) loop:

	1. Read eight characters from your temporary file. These constitue a new bit-string.
	2. Convert the new bit-string into an ascii character (i.e. a letter, number, or symbol)
	3. Output the ascii character
	
	If any bit-string is all zeros ($(alt 00000000)), that signifies that the end of the secret message has been reached, and you don't need to continue processing the rest of the file. How can you halt your loop? With an $(alt if) expression and the $(alt break) keyword. Let's see what the expression looks like then explain it:

	$(spell 'if [[ $MYBITS == 00000000 ]]; then break; fi')

	* The $(spell '[[ $MYBITS == 00000000 ]]') section tests whether a variable named $(alt MYBITS) is equal to $(alt 00000000). (You can use whatever variable you want. In fact, you could use a variable for both sides of the $(alt '==') test if you wanted.)
	* The $(spell 'if ...; then ...; fi') construction allows you to specify a condition and what should happen if the condition is met.
	* The $(spell break) token means "stop looping." (Therefore, it should only be placed inside of a loop.)

	The output should hold your secret message. Follow the instructions contained in the secret message, and I'll tell you a secret!

	$CONTINUE
	EOF

	learned '(technique) if ...; then ...; fi'
	learned '(technique) break'

	wrap <<-EOF
	
	${SPEECH}Tertius said you should do the following in a $(alt while) loop:

	1. Read eight characters from your temporary file. These constitue a new bit-string.
	2. Convert the new bit-string into an ascii character
	3. Output the ascii character

	And stop when you get a bit-string of $(alt 00000000).
	EOF
}
reward () {
	wrap <<-EOF
	
	${SPEECH}Oh, thank you, thank you! I feel myself again. You have earned this secret, to be sure!

	The secret is that $(alt a.bmp) also contains a hidden message, but its message has been $(alt base-64 encoded). Did you ever imagine that you could make a hidden message more hidden? Can you imagine using something even stronger than base-64 encoding, such as encryption, to conceal your information?

	Do you think you can use what you've learnt so far to extract the message from $(alt a.bmp)?
	EOF
}

_check_body () { &>/dev/null diff -q body.bin <(tail -c +55 b.bmp); }
_check_bitstrings () { &>/dev/null diff -q bitstrings.txt <(tail -c +55 b.bmp | xxd -b -c 1 | cut -d' ' -f2 | cut -c8 | tr -d '\n'); }

prompt_repeat () {
	echo
	if [[ $1 -gt 3 ]]; then
		echo -n 'Do you wish me to repeat my third tutorial? [y/N]'
		read -n1 OPT
		echo
		if [[ $(mjlower $OPT) == y ]]; then
			tutorial_3
		fi;
	fi
	if [[ $1 -gt 2 ]]; then
		echo -n 'Do you wish me to repeat my second tutorial? [y/N]'
		read -n1 OPT
		echo
		if [[ $(mjlower $OPT) == y ]]; then
			tutorial_2
		fi;
	fi
	if [[ $1 -gt 1 ]]; then
		echo -n 'Do you wish me to repeat my first tutorial? [y/N]'
		read -n1 OPT
		echo
		if [[ $(mjlower $OPT) == y ]]; then
			tutorial_1
		fi;
	fi
}

if [[ $0 =~ ippocampus ]]; then
	reward
	prompt_repeat 4
elif [[ -e bitstrings.txt ]]; then
	if _check_bitstrings; then
		tutorial_3
	else
		wrap <<-EOF
		$SPEECH
		Tsk. The contents of your $(alt bitstrings.txt) are not as expected. Please try again.
		EOF
	fi
	prompt_repeat 3
elif [[ -e body.bin ]]; then
	if _check_body; then
		tutorial_2
	else
		wrap <<-EOF
		$SPEECH
		Tsk. The contents of your $(alt body.bin) are not as expected. Please try again.
		EOF
	fi
	prompt_repeat 2
elif (($#)); then
	tutorial_1
else
	intro
fi
