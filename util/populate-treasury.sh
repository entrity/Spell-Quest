#!/bin/bash

TREASURY=../backup/south/castle/treasury
mkdir -p "$TREASURY"

function randword () {
	shuf -n1 /usr/share/dict/british-english | sed "s/'.*//" | tr -d $'\n'
}
function randdigit () {
	echo -n $(( $RANDOM % 10 ))
}
function make_title () {
	for i in `seq $(randdigit)`; do
		if (( $RANDOM % 2 )); then
			randword
		else
			randdigit
		fi
	done | tr -d $'\n' | paste -sd ''
}

for i in `seq 100`; do
	TITLE=$(make_title)
	echo $TITLE
	OUT="$TREASURY/$TITLE"
	touch "$OUT"
done
