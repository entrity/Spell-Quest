#!/bin/bash

INGREDIENTS=(
	saffron
	barley
	pond\ scum
	ginger
	frog\ mucus
	hog\'s\ breath
	hound\ drool
	powdered\ hen\'s\ teeth
	coffin\ nails
	soot
	white\ fungus
	dead\ man\'s\ hair
	black\ toenails
	rancid\ butter
)

for i in `seq 89`; do
	shuf -n2 /usr/share/dict/british-english | tr $'\n' ' '
	echo
	N=$(( $RANDOM % 3 + 2 ))
	printf "%s\n" "${INGREDIENTS[@]}" | shuf -n $N | tr $'\n' ,
	echo
	echo
done
