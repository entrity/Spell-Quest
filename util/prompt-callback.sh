#!/bin/bash

export FLAGS_FILE="$__DIR__/util/flags"
export CBDIR=$(canpath "$__DIR__/util/callbacks")

BASH_ENV= DEBUG= bash "$__DIR__/util/build-flags.sh" > "$FLAGS_FILE"

my_prompt_callback () {
	read -r -a LAST < <(history | tail -n1 | sed 's/^\s\+[0-9]\+\s\+//')
	OLD_FLAGS=$(cat "$FLAGS_FILE")
	NEW_FLAGS=$(bash $__DIR__/util/build-flags.sh)
	if [[ "$OLD_FLAGS" != "$NEW_FLAGS" ]]; then
		# >&2 echo "CAHGED FLAGS"
		echo -e "$NEW_FLAGS" > "$FLAGS_FILE"
		while read -r NEW_FLAG; do
			# echo $NEW_FLAG
			case $NEW_FLAG in
				LICH_BOTTLE) bash "$CBDIR/lich.sh" ;;
				IMP_WAND) bash "$CBDIR/imp-wand.sh" ;;
				GARGOYLE_LAIR) bash "$CBDIR/gargoyle.sh" ;;
			esac
		done < <(echo -e "$OLD_FLAGS" | diff --changed-group-format='%<' --unchanged-group-format='' "$FLAGS_FILE" -)
	fi
}

export PROMPT_COMMAND='my_prompt_callback'
