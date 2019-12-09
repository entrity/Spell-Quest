#!/bin/bash

# Set up forest northward

THISDIR=$(dirname "$(readlink -f "$0")")
ROOTDIR=$(readlink -f "$THISDIR/..")
cd "$ROOTDIR"
mkdir -p north
cd north

for classroom in Transmutation Divination Conjuration Shadow Illusion Destruction; do
	mkdir $THISDIR/academy-sylphan/$classroom
done

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

ln -s "$(readlink -f "$THISDIR/academy-sylphan")" "$ROOTDIR/north/forest/path-5/tree-7/"
mkdir -p "$THISDIR/academy-sylphan/Transmutation/Cupboard"
mkdir -p "$THISDIR/academy-sylphan/Transmutation/Closet"
touch "$THISDIR/academy-sylphan/Transmutation/Closet/broom"
touch "$THISDIR/academy-sylphan/Transmutation/Closet/mop"
touch "$THISDIR/academy-sylphan/Transmutation/Closet/bucket"
