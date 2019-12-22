#!/bin/bash

debug INSTALLING...

THISDIR=$(thisdir)
ROOTDIR=$(canpath "$THISDIR/..")

LOCKED_DIRS=(
	"$ROOTDIR/home/north/forest/path-5/tree-7/academy-sylphan/Locked Door"
)

# Remove everything
debug ++Remove lessons
rm -r "$ROOTDIR/.lessons"* 2>/dev/null
for arg in "${LOCKED_DIRS[@]}"; do
	chmod +wrx "$arg"
done
rm -r "$ROOTDIR/home" 2>/dev/null

# Make dirs
debug ++Make dirs
mkdir "$ROOTDIR/.lessons"
mkdir -p "$ROOTDIR/home/hut/trunk"
mkdir -p "$ROOTDIR/home/cave/tunnel/cavern/calm-pool"

# Copy from .backup
debug Copy from backup
cp -r "$ROOTDIR/backup/"* "$ROOTDIR/home"

# Lock doors
for arg in "${LOCKED_DIRS[@]}"; do
	chmod 0 "$arg"
done

# Raleigh
debug Raleigh stuff
mkdir -p "$ROOTDIR/util/Raleigh"

cd "$ROOTDIR/util/Raleigh"
cp "scroll.txt" "$ROOTDIR/home/north/forest/path-11/tree-16/scroll.txt"
cp "spreadsheet.csv" "$ROOTDIR/home/north/forest/path-11/tree-16/spreadsheet.csv"
grep John spreadsheet.csv > John.csv
grep '[A-Z]\{3\}' spreadsheet.csv > with-capitals.csv
grep '[0-9]\{3\}[) -]\{1,2\}[0-9]\{3\}-[0-9]\{4\}' spreadsheet.csv > phone-numbers.csv
cd - >/dev/null

debug FINISHED INSTALLATION
