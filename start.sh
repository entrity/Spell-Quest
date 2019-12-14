#!/bin/bash

if [[ $* =~ -r ]]; then
	RESTART=1
fi

THISDIR=$(dirname "$(readlink -f $0)")
if (( $RESTART )); then
	rm "$THISDIR/.lessons/"* 2>/dev/null
	rm -r "$THISDIR/bag" 2>/dev/null
	# Raleigh
	cd "$THISDIR/.util/Raleigh"
	cp "scroll.txt" "$THISDIR/north/forest/path-11/tree-16/scroll.txt"
	cp "spreadsheet.csv" "$THISDIR/north/forest/path-11/tree-16/spreadsheet.csv"
	grep John .spreadsheet.csv > John.csv
	grep '[A-Z]\{3\}' .spreadsheet.csv > with-capitals.csv
	grep '[0-9]\{3\}[) -]\{1,2\}[0-9]\{3\}-[0-9]\{4\}' spreadsheet.csv > phone-numbers.csv
fi
mkdir -p "$THISDIR/hut/trunk"
bash --rcfile "$THISDIR/.bashrc"
