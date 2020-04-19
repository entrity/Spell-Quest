#!/bin/bash

>&2 echo INSTALLING...

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
>&2 echo 'Removing any existing files...'
for arg in "${LOCKED_DIRS[@]}"; do
	[[ -e "$arg" ]] && chmod +wr "$arg"
	[[ -d "$arg" ]] && chmod +x "$arg"
done
find "$ROOTDIR/home" -not -writable 2>/dev/null | while read -r arg; do
	[[ -e "$arg" ]] && chmod +wr "$arg"
	[[ -d "$arg" ]] && chmod +x "$arg"
done
[[ -e "$ROOTDIR/.lessons" ]] && rm -r "$ROOTDIR/.lessons"
[[ -e "$ROOTDIR/home" ]] && rm -r "$ROOTDIR/home"

# Make dirs
>&2 echo 'Making directories...'
mkdir -p "$ROOTDIR/.lessons"
mkdir -p "$ROOTDIR/home/hut/trunk"
mkdir -p "$ROOTDIR/home/cave/tunnel/cavern/calm-pool"

# Fail
if ! [[ -e "$ROOTDIR/home" ]]; then
	STYLE1=$'\033[0;31;1m'
	STYLE2=$'\033[0;41;30m'
	RESET=$'\033[0m'
	>&2 fold -w 50 -s <<-EOF
	${STYLE1}
	Rats. Seems like your system's config has blocked permission for this program's installation. That's okay. You can still install it by typing the following into your terminal and hitting Enter or Return. (Please include the quotation marks):${RESET}
	EOF
	>&2 echo "\"${ROOTDIR}/start.sh\" -r"
	exit 1
fi

# Copy from .backup
>&2 echo 'Copying from backup to home...'
cp -r "$ROOTDIR/backup/"* "$ROOTDIR/home"
>&2 echo 'Copying achieved'

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

>&2 echo "FINISHED INSTALLATION"
exit 0
