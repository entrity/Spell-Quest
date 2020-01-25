#!/bin/bash

# The goblins beneath the mountain bestow four treasures which will lead to the password to the xshellz account.
# 
# These must be encrypted with the gpg key found at Hattifattener Academy.

KEY=../data/hattifattener-academy/Path-of-Teleportation/private.key
KEYRING=tmp.gnupg

gpg --import --keyring "$KEYRING" --no-default-keyring "$KEY"

function encrypt () {
	FBASE=$(basename "$1")
	INFILE="$1.plain"
	OUTFILE="../data/$FBASE"
	if [[ -e "$INFILE" ]]; then
		gpg --output "$OUTFILE" --no-default-keyring --keyring "$KEYRING" --trust-model always -e -r qwerty "$INFILE"
	else
		>&2 echo -e "\033[31mERR file not found ${1}\033[0m"
		exit 5
	fi
}

encrypt ../data/yellow-mushroom
encrypt ../data/rabbits-foot
encrypt ../data/carbuncle
encrypt ../data/wishbone
