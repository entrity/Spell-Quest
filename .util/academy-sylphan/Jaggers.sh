#!/bin/bash

THISDIR=$(dirname "$(readlink -f "$0")")
. "$THISDIR/../shared.sh"

fold -w $FOLD -s <<HEREDOC | less -r
${SPEECH}
Oh! Hello there. It has been quite a long time since we had any visitors in the academy.
HEREDOC
