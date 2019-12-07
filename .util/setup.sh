#!/bin/bash

# Set up forest northward
mkdir -p north
cd north
RED_HERRING_PARTS=(academy forest academia academic forestry wood)
for path in `seq 999`; do
	for tree in `seq 99`; do
		mkdir -p "path-$path/tree-$tree"
		touch "path-$path/tree-$tree/"
	done
done
