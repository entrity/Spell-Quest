#!/bin/bash

# Set up forest northward

THISDIR=$(dirname "$(readlink -f "$0")")
mkdir -p north
cd north

RED_HERRING_PARTS=(academy forest academia academic forestry wood)

herring_part () {
	shuf -n 1 -e ${RED_HERRING_PARTS[@]}
}

for path in `seq 16`; do
	for tree in `seq 16`; do
		mkdir -p "forest/path-$path/tree-$tree"
		touch "forest/path-$path/tree-$tree/$(herring_part)-$(herring_part)"
	done
done

ln -s "$(readlink -f "$THISDIR/academy-sylphan")" path-143/tree-71/
