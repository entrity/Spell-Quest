#!/bin/bash

FOREST=../backup/north/forest

PART1=(wood forest forestry sylvan sylphan)
PART2=(wood forest forestry academic academy)

word () {
	grep -v \' /usr/share/dict/british-english | grep -v '[A-Z]' | shuf -n1
}
part1 () {
	I=$(( $RANDOM % ${#PART1[@]} ))
	echo -e "${PART1[$I]}"
}
part2 () {
	I=$(( $RANDOM % ${#PART2[@]} ))
	echo -e "${PART2[$I]}"
}

ls "$FOREST" | while read FP; do
	N=$(( $RANDOM % 10 ))
	for i in `seq $N`; do
		NEWDIR="$FOREST/$FP/tree-$(word)"
		mkdir -p "$NEWDIR"
		touch "$NEWDIR/.clearing"
	done
done
