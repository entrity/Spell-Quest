#!/bin/bash

rename () {
	if [[ ${1,,} =~ ${2,,} ]]; then
		NEWNAME=$(sed s@^$2\\s*@@i <<< "$1")
		if [[ $1 =~ $NEWNAME ]]; then
			echo "$1 was renamed to $NEWNAME"
		fi
		mv "$1" "$NEWNAME"
	fi
}

if (($#)); then
	if [[ -d "$1" ]]; then
		if [[ -x "$1" ]] && [[ -r "$1" ]]; then
			>&2 echo "$(basename "$1") is already open to you. You cannot use it on this target at this time."
		else
			chmod +rx "$1"
			echo "With a mighty blow, ${1%/} is opened"
			rename "$1" Barricaded
			rename "$1" Blocked
			rename "$1" Locked
		fi
	elif [[ -f "$1" ]]; then
		echo "With a deft blow, $(basename "${1%/}") is sundered"
		rm "$1"
	else
		>&2 echo "Error: the mighty axe cannot be wielded against this target."
	fi
else
	>&2 echo "The mighty axe requires a parameter to target."
fi
