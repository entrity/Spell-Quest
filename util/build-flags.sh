#!/bin/bash

__DIR__="$HOME/.."

LICH_BOTTLE="$HOME/cave/tunnel/cavern/calm-pool/lich-bottle.txt"
[[ -f "$LICH_BOTTLE" ]] && echo LICH_BOTTLE

IMP_BAG="$HOME/cave/imp's-bag"
(( $(ls "$IMP_BAG" | grep -v hint.txt | wc -l) )) && echo IMP_WAND

if [[ `pwd` =~ rocky-spire/tip-top ]] && ! [[ -e "$HOME/bag/.gargoyle-slain" ]]; then
	echo GARGOYLE_LAIR
fi
