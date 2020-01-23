#!/bin/bash

. steganography.sh

INFILE=o.bmp
OUTFILE=m.bmp
MESSAGE="Here is my message: let there be peace on earth"

read_head "$INFILE" > "$OUTFILE"
echo "...Head copied"
read_body "$INFILE" | python steganography.py "$MESSAGE" >> "$OUTFILE"
echo "...Message embedded"
read_body "$OUTFILE" | python steganography.py
echo "...Message read"
