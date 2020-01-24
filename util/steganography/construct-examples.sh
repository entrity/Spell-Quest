#!/bin/bash

. steganography.sh

read_head o.bmp > a.bmp
read_head o.bmp > b.bmp

PRE_ENCRYPTED_MESSAGE="The first person who "
ENCRYPTED_MESSAGE=$(openssl enc -aes128 -base64 -pass pass:hippocampus <<< "$PRE_ENCRYPTED_MESSAGE")
PLAIN_MESSAGE="Transmute Tertius.sh into Hippocampus.sh, then speak with him again."
echo $ENCRYPTED_MESSAGE

read_body o.bmp | python steganography.py "$ENCRYPTED_MESSAGE" >> a.bmp
read_body o.bmp | python steganography.py "$PLAIN_MESSAGE" >> b.bmp

cp a.bmp b.bmp ../../data/hattifattener-academy/Path-of-Shadow/steganography/
