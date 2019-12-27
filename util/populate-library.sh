#!/bin/bash

LIBRARY=../backup/south/castle/library
mkdir -p "$LIBRARY"

function randword () {
	shuf -n1 /usr/share/dict/british-english | sed "s/'.*//" | tr -d '\n'
}

for i in `seq 100`; do
	if (( $RANDOM % 2 )); then
		if (( $RANDOM % 2 )); then
			TITLE=$(randword)-star
		else
			TITLE=star-$(randword)
		fi
	else
		TITLE=$(randword)-$(randword)
	fi
	echo $TITLE
	OUT="$LIBRARY/$TITLE"
	for i in `seq 1 1000`; do
		if (( $RANDOM % 16 )); then
			randword >> "$OUT"
		else
			echo -n darkness >> "$OUT"
		fi
		printf " " >> "$OUT"
	done
done
