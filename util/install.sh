#!/bin/bash

debug INSTALLING...

THISDIR=$(thisdir)
ROOTDIR=$(canpath "$THISDIR/..")

LOCKED_DIRS=(
	"$ROOTDIR/home/north/forest/path-5/tree-7/academy-sylphan/Locked Door"
	"$ROOTDIR/home/south/castle/library"
	"$ROOTDIR/home/south/castle/treasury"
	"$ROOTDIR/home/south/castle/workshop"
	"$ROOTDIR/home/south/castle/locked tower"
	"$ROOTDIR/home/south/castle/armory"
)

# Remove everything
debug ++Remove lessons
rm -r "$ROOTDIR/.lessons"* 2>/dev/null
find "$ROOTDIR/home" -not -writable 2>/dev/null | while read -r arg; do
	[[ -e "$arg" ]] && chmod +wrx "$arg"
done
for arg in "${LOCKED_DIRS[@]}"; do
	[[ -e "$arg" ]] && chmod +wrx "$arg"
done
[[ -e "$ROOTDIR/home" ]] && rm -r "$ROOTDIR/home"

# Make dirs
debug ++Make dirs
mkdir "$ROOTDIR/.lessons"
mkdir -p "$ROOTDIR/home/hut/trunk"
mkdir -p "$ROOTDIR/home/cave/tunnel/cavern/calm-pool"

# Copy from .backup
debug Copy from backup
cp -r "$ROOTDIR/backup/"* "$ROOTDIR/home"

# Make .less
if >/dev/null which lesskey; then
	lesskey "$ROOTDIR/.start/lesskey-config"
fi

# Lock doors
for arg in "${LOCKED_DIRS[@]}"; do
	chmod -x "$arg"
done

# Raleigh
debug Raleigh stuff
mkdir -p "$ROOTDIR/util/Raleigh"

cd "$ROOTDIR/util/Raleigh"
cp "scroll.txt" "$ROOTDIR/home/north/forest/path-11/tree-16/scroll.txt"
cp "spreadsheet.csv" "$ROOTDIR/home/north/forest/path-11/tree-16/spreadsheet.csv"
grep John spreadsheet.csv > John.csv
grep '[A-Z]\{3\}' spreadsheet.csv > with-capitals.csv
grep '[0-9]\{3\}-[0-9]\{3\}-[0-9]\{4\}' spreadsheet.csv > phone-numbers.csv
cd - >/dev/null

debug FINISHED INSTALLATION
