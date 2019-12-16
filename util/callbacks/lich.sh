#!/bin/bash


echo IN LC

if cmp -s "$LICH_BOTTLE" "$DATA/lich-bottle.txt"; then
		bash "$CB/lich.sh"
	else
		wrap <<-EOF
		${CYAN}
		You toss the bottle in an arc, and it plops with scarcely a splash into the cold, dark water. Within moments, the surface of the pool is once again as smooth as glass.

		Perhaps there was something wrong with the bottle?
		EOF
	fi

if [[ $(pwd) =~ home/cave ]]; then
	speak <<-EOF
	${CYAN}
	A 
	${BRMAGENTA}
	You poor fool. You've met with a horrible fate, haven't you?
	EOF
else
	speak <<-EOF
	${BRMAGENTA}
	Insolten
	$(pwd)

	$CONTINUE
	EOF
fi
