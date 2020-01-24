#!/bin/bash

. steganography.sh

read_head o.bmp > a.bmp
read_head o.bmp > b.bmp

A_MESSAGE="Contact the maker and tell him the password \"panacea\""
A_MESSAGE=$(base64 <<< "$A_MESSAGE")
# ENCRYPTED_MESSAGE=$(openssl enc -aes128 -base64 -pass pass:hippocampus <<< "$A_MESSAGE")
B_MESSAGE="Transmute Tertius.sh into Hippocampus.sh, then speak with him again."

read_body o.bmp | python steganography.py "$A_MESSAGE" >> a.bmp
read_body o.bmp | python steganography.py "$B_MESSAGE" >> b.bmp

cp a.bmp b.bmp ../../data/hattifattener-academy/Path-of-Shadow/steganography/
