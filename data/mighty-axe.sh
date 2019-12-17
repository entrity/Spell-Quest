#!/bin/bash

if (($#)); then
	if [[ -d "$1" ]]; then
		if [[ -x "$1" ]] && [[ -r "$1" ]]; then
			>&2 echo "$(basename "$1") is already open to you. You cannot use it on this target at this time."
		else
			chmod +rx "$1"
		fi
	elif [[ -f "$1" ]]; then
		echo "With a deft blow, $(basename "$1") is sundered"
		rm "$1"
	else
		>&2 echo "Error: the mighty axe cannot be wielded against this target."
	fi
else
	>&2 echo "The mighty axe requires a parameter to target."
fi
