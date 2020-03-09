#!/bin/bash

tutorial () {
	speak <<-EOF
	$(art wiz-tiny.txt)
	${SPEECH}
	If you spoke to $(alt Primus), I suppose you learnt what a $(alt bit) is. What he probably didn't tell you is that everything you see is composed of bits.

	How is that possible? Just imagine that you had a friend who lived in the house next to yours. At night, you could each creep to the windows and use a flashlight to send signals to each other. You'd hold a notepad and pencil and write down the brightness of your friend's window each second:

	1. dark
	2. light
	3. light
	4. light
	5. dark
	6. dark
	7. light
	8. light
	9. ...

	A series of light and dark seconds doesn't mean anything by itself, but if you and your friend agree on a code before sending signals, you can interpret the series of lights and darks. Let's use $(alt 0) to signify $(alt dark) and $(alt 1) to signify $(alt light). That means that the 8 seconds we just wrote on our notepad gives us an 8-bit string: $(alt 01110011).

	Let's suppose that we and our friend didn't want to invest a great deal of time contriving a code to convert bit-strings to letters. Good news: there's already a well-established code for converting bit-strings to symbols. It's called $(alt ASCII) (American Standard Code for Information Interchange). According to ASCII, $(alt 01110011) signifies the letter $(alt s).

	Want to see something funny? Do you remember that ASCII isn't the only way to interpret a bit-string? Primus showed you that a bit-string can be interpreted as a binary number. Do you remember how $(alt 101) is binary for the number five? And $(alt 10) is binary for the number two? Well, $(alt 01110011) is binary for the number one hundred and fifteen! Isn't it funny how $(alt 01110011) can mean different things (a letter or a number) depending on how we choose to interpret it?

	With some practice, you _could_ use a notepad and pencil to encode your message as a very long bit-string, but with the power of a second-level Transmutation spell, you could use $(spell xxd) to do this work for you. You will want two particular parameters, though:

	1. $(spell xxd) will ordinarily output code in $(alt hexadecimal) instead of $(alt binary). (Do you remember that $(alt hexadecimal) is a numbering system with sixteen numerals?) Use the $(alt \-b) parameter to say, "Output in $(alt binary) instead of $(alt hexadecimal)"
	2. $(spell xxd) will ordinarily output multiple bit-strings in a single row, which is less convenient when piping content from one spell to the next. Use the parameters $(alt \-c 1) to say, "Only output one column of bit-strings."

	Let's try it now

	$(spell 'echo -n "hello" | xxd -b -c 1')

	Why did we include a $(alt \-n) parameter in our invocation of $(spell echo)? To $(spell echo), that $(alt \-n) means, "Don't include a newline at the end of my text." If we had allowed the newline to be included, then $(spell xxd) would actually output one additional bit-string: a bit-string representing $(alt newline). Want to know what the ASCII code for $(alt newline) is? It's 00001010!

	Let's see what $(spell xxd) outputs for our "hello" message:

	${RESET}$(echo -n "hello" | xxd -b -c 1)${SPEECH}

	It gives us three columns of information:

	1. The location of a single symbol
	2. The bit-string for the symbol
	3. The symbol being encoded

	If you wanted only the 2nd column, you could pipe the output to a clever invocation of $(spell grep) or an easy invocation of $(spell cut).

	...What if you want to do the reverse, convert a bitstring ($(alt 01110011)) to an ASCII character ($(alt s))? That's trickier, but doable. $(spell xxd) _can_ reverse the process, converting a number to an ascii value, but it can't do this on binary (base-$(alt 2)) numbers; it can only do it on hexadecimal (base-$(alt 16)) numbers. So we're going to have to add some steps to convert our binary representation $(alt 01110011) to the hexadecimal representation $(alt 73). It's going to be pretty convoluted, and you don't have to remember this, but let's make an exercise of reading through it together. Let's look at the sequence of commands and then explain how each one works:

	$(spell 'BITSTRING=01110011')
	$(spell 'DECIMAL=$((2#$BITSTRING))')
	$(spell 'printf -v HEXADECIMAL "%%x" $DECIMAL')
	$(spell 'echo $HEXADECIMAL | xxd -r -p')

	1. The first line just sets a base-$(alt 2) variable. This step is not strictly necessary because we could just write the literal value in the next line as $(alt '$((2#01110011))'). But I think this makes our work more readable.
	2. We're setting a base-$(alt 10) variable this time. The expression on the right side of the $(alt \=) sign is quite unusual. It means, "Evaluate the number on the right side of the $(alt \#) symbol using the numbering system defined by the number on the left side of the $(alt \#) symbol, then output the base-$(alt 10) representation." When we interpret our bitstring $(alt 01110011) according to the binary (i.e. base-$(alt 2)) numbering system, we get the decimal (i.e. base-$(alt 10)) number $(alt 115).
	3. We want to set another variable, this time in base-$(alt 16). Do you remember $(spell printf)? Well another thing that differentiates it from $(spell echo) is that you can send its output to a variable instead of to the terminal. Just add the parameters $(alt \-v VARIABLE_NAME). Do you remember some of the placeholders for $(spell printf), for instance $(alt %%d) and $(alt %%s)? $(alt %%x) is a placeholder that means, "Format a parameter as a hexadecimal number."
	4. Then we can finally invoke $(spell xxd), but we'll need two special parameters: $(alt \-r) is short for "reverse" and means, "Instead of converting real data to a numeric representation, convert a numeric representation into real data." $(alt \-p) means, "My input is _plain_; it has only the middle column, not all three columns of information."

	Whew! That was a bit of work. I recommend you write a $(alt bash script) whose purpose is to convert a bitstring to an ASCII character. (You could keep such a script in your $(alt bag).) Do you remember that you can use $(alt '$1') inside of your bash script to make use of a command-line parameter?

	If you want, you can practice with my two books here. One contains bit-strings, and the other contains a textual message. To people like you and me, who know how to interpret them, these two books contain the same message. Can you find a way to convert the contents of each one to match the other one?

	$CONTINUE
	EOF

	learned 'xxd -b -c 1'
	learned 'xxd -r -p'
	learned '(lore) ascii'
	learned '(technique) $((BASE#NUMBER))'
	learned 'echo -n'
	learned 'printf -v'
	learned '(printf placeholder) %x'

	wrap <<-EOF
	${SPEECH}
	Wow! You just learnt a lot! Here are two of the examples that Secundus just demonstrated:

	$(spell 'echo -n "hello" | xxd -b -c 1')

	$(spell 'BITSTRING=01110011')
	$(spell 'DECIMAL=$((2#$BITSTRING))')
	$(spell 'printf -v HEXADECIMAL "%%x" $DECIMAL')
	$(spell 'echo $HEXADECIMAL | xxd -r -p')
	EOF
}

tutorial
