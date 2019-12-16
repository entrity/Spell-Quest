#!/bin/bash

if [[ $(pwd) =~ home/cave ]]; then
	speak <<-EOF
	${BRMAGENTA}
	PRO
	EOF
else
	speak <<-EOF
	${BRMAGENTA}
	Insolten
	$(pwd)

	$CONTINUE
	EOF
fi
