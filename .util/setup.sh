#!/bin/bash

THISDIR=$(dirname "$(readlink -f "$0")")
ROOTDIR="${THISDIR%/Spell-Quest/*}/Spell-Quest"
. "$ROOTDIR/.util/shared.sh"

# Set up forest northward
bash "$ROOTDIR/.util/setup-north-forest.sh"
