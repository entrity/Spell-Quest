#!/bin/bash

THISDIR=$(dirname $(readlink -f "$0"))
BOOKCASE="$THISDIR/../data/mountain-path/under-the-mountain/kitchen/bookcase"
CHECKCASE="$THISDIR/../data/bookcase-check"

word () {
    shuf -n1 /usr/share/dict/british-english
}
not_dust () {
    txt=$(word)
    while [[ $txt == dust ]]; do
        txt=$(word)
    done
    echo $txt
}
add () {
    printf "$* " >> "$BOOK"
}

for i in `seq 20`; do
    BOOK="$BOOKCASE/cookbook-${i}.txt"
    CHECK="$CHECKCASE/cookbook-${i}.txt"
    echo -n > "$BOOK"
    add `not_dust`
    add `not_dust`
    for j in `seq 50`; do
        if (( $RANDOM % 5 )); then
            add `not_dust`
        else
            add dust
            add `not_dust`
            add `not_dust`
        fi
    done
    sed 's/\(\S\+\) \(\S\+\) dust/dust \2\ \1/g' "$BOOK" > "$CHECK"
done
