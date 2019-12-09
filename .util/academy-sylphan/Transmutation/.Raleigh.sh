#!/bin/bash

THISDIR=$(dirname "$(readlink -f "$0")")
ROOTDIR="${THISDIR%/Spell-Quest/*}/Spell-Quest"
. "$ROOTDIR/.util/shared.sh"

fold -w $FOLD -s <<HEREDOC | less -r
${SPEECH}
${BOW}
HEREDOC
