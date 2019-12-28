#!/bin/bash

cd ../backup/south/swamp

LVL1=(the many some few)
LVL2=(roads ways way road)
LVL3=(stretch is are go)
LVL4=(further endless all winding)

make_and_enter () {
	local NAME=$(echo -n "$*" | base64)
	mkdir "$NAME"
	cd "$NAME"
}

for word1 in "${LVL1[@]}"; do
	make_and_enter "$word1"
	for word2 in "${LVL2[@]}"; do
		make_and_enter "$word2"
		for word3 in "${LVL3[@]}"; do
			make_and_enter "$word3"
			for word4 in "${LVL4[@]}"; do
				make_and_enter "$word4"
				touch .bog
				cd ..
			done
			cd ..
		done
		cd ..
	done
	cd ..
done
