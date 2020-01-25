#!/bin/bash

# The server to which the user needs to ssh has a file named `treasure-key.txt`

function fmt_line () {
	echo "The treasure at the top of the mountain is encrypted with the '${1#-}' cipher. The password is '$2'."
}

function red_herrings () {
	openssl enc -ciphers | tr -s ' ' '\n' | tail -n +3 | while read CIPHER; do
		PASS=$(shuf -n1 /usr/share/dict/british-english)
		fmt_line "$CIPHER" "$PASS"
	done
}

function all_lines () {
	fmt_line 'blowfish' 'Nevrast'
	red_herrings
}

all_lines | shuf | base64 > treasure-key.txt
