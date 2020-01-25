#!/bin/bash

PLAINTEXT="Just pancakes"
PASS=snafu
CIPHERTEXT=$(2>/dev/null openssl enc -aes128 -a -pass pass:$PASS <<< "$PLAINTEXT")

tutorial () {
	speak <<-EOF

	$(art orb-wizard.txt)
	${SPEECH}
	So you desire the secrets of encryption? You might suppose that encryption is similar to base-64 encoding, but not so. An encoding such as $(alt base-64) or $(alt ascii) requires knowledge of the encoding rules, but it doesn't require a secret password or key. Encryption requires both knowledge of the encryption rules and also a secret.

	I can teach you a second-level Shadow spell to perform encryption: $(spell openssl). This spell actually has several uses, and its very first parameter needs to specify the intended use. Our purpose is encryption and decryption, so we will use $(alt enc) as the first parameter for every invocation of $(spell openssl). Yes, encrypting and decrypting will be done the same way; the only difference will be that to decrypt a message with this spell, you must add the paramter $(alt \-d)

	There are many, many ways to perform an encryption, and the word for these different ways is $(alt ciphers). You can get a list of ciphers available to you by invoking $(spell openssl enc -ciphers). Let's do it right now. (I'll pipe the output to $(spell head) so that we only see the first several results.)

	${RESET}$(openssl enc -ciphers | cut -d' ' -f1 | head )${SPEECH}

	To use openssl for encryption or decryption, we need to specify a cipher as our second parameter. Let's choose $(alt -aes128) because it's pretty easy to type.

	Lastly, we need to specify a password. Let's put it all together:

	$(spell openssl enc -aes128 -pass pass:$PASS '<<<' "\"$PLAINTEXT\"")

	You might be surprised to see how I specified the password. I chose $(alt snafu) as my password, and I specified it with the parameters $(alt '-pass pass:snafu'). The reason for the $(alt pass:) is because $(spell openssl) lets us specify a password in multiple different ways:

	* it can be written on the command line: $(alt pass:$PASS)
	* it can be contained in a file: $(alt file:filepath)
	* it can be contained in an environment variable $(alt env:varname)
	* ...(and more)

	That's almost all you need to know before setting off on your own, but before you go, let's look at three optional parameters and two usages for encrypting:

	1. You might want to encrypt an entire file
	2. You might just want to encrypt a string of text (as I did in the example above)

	If you want to encrypt a file, you can provide parameters $(alt \-in filepath) and $(alt \-out filepath). But you could also use $(alt \<) and $(alt \>) redirects.

	If you want to encrypt a string of text and then view the output on the terminal, you need to know something more: much of the encrypted output will be unprintable. Did you know that many bytes don't correspond to printable symbols? (If you have completed the Path of Binary, your familiarity with $(alt ascii) might make this apparent.) Therefore, if you want an output that you can copy and paste or read and write, you should add the $(alt \-a) parameter. What this does is to base-64 encode the output. All of the symbols in the base-64 alphabet are printable.

	Let's try encrypting and decrypting a message using what we've learnt:

	$(spell openssl enc -aes128 -a -pass pass:$PASS '<<<' "\"$PLAINTEXT\"")
	${RESET}$CIPHERTEXT
	$(spell openssl enc -aes128 -d -a -pass pass:$PASS '<<<' "\"$CIPHERTEXT\"")
	${RESET}$PLAINTEXT${SPEECH}

	When you encrypt something using these commands, a warning like this one might be printed to your terminal:

	${RESET}*** WARNING : deprecated key derivation used.
	Using -iter or -pbkdf2 would be better.${SPEECH}

	These are optional parameters you can add that will make your encryption process take longer (which can make it stronger against attacks). The $(alt \-iter) parameter must be followed by a number, which signifies how many times the encryption process should be run. The $(alt \-pbkdf2) parameter does not need a following parameter.

	Do you want to practice? I have two exercises which you may complete if you wish:

	1. Decrypt the file cipher.bin using the password 'off to the market'
	2. Encrypt the file plain.txt using the password 'grapes on the vine'. Use the base-64 option. Save the output as $(alt cipher.txt), and talk to me again.

	$CONTINUE
	EOF

	learned 'openssl enc'

	wrap <<-EOF
	${SPEECH}
	You have two exercises from Etzel:

	1. Decrypt the file cipher.bin using the password 'off to the market'. Is the result readable?
	2. Encrypt the file plain.txt using the password 'grapes on the vine'. Use the base-64 option. Save the output as $(alt cipher.txt), and talk to him again.
	EOF
}
_check_cipher_txt () {
	GOAL="SCENE I. A cavern. In the middle, a boiling cauldron."
	ANS=$(openssl enc -d -aes128 -a -pass "pass:grapes on the vine" -in "cipher.txt")
	[[ $GOAL == $ANS ]]
}

if [[ -e cipher.txt ]]; then
	if _check_cipher_txt; then
		wrap <<-EOF

		${SPEECH}Well done! You are truly ready to proceed on your own!
		EOF
	else
		wrap <<-EOF

		${SPEECH}Welllllllll... Your $(alt cipher.txt) file is not quite right. Please try again.
		EOF
	fi
else
	tutorial
fi
