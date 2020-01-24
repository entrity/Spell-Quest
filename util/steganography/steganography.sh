#!/bin/bash


read_offset () { od -j 10 -A n -N 4 -t u4 "$1" | grep -o '[0-9]\+' ; }
read_head () { head -c $(read_offset "$1") "$1" ; }
read_body () { tail -c +$(( 1 + $(read_offset "$1") )) "$1"; }
read_msg () { od -j $(read_offset "$1") -A n -w1 -t u1 -v "$1" | lsb_to_bin | bin_to_msg ;}
chr_to_int () { printf "%d" "'$1"; }
chr_to_bin () { int_to_bin $(chr_to_int $1) ;}
int_to_bin () { echo "obase=2; ${1:- }" | bc | xargs printf "%08d"; }
int_to_chr () {
	if [[ -n $2 ]] && [[ $1 -eq 0 ]]; then
		printf "$2"
	else
		echo $1 | awk '{printf("%c",$1)}'
	fi
}

lsb_to_bin () { # extract LSB from every byte, print a new binary string from all these
	while read -r BYTE; do
		LSB=$(( $BYTE & 1 ))
		echo -n $LSB
	done
}
bin_to_msg () {
	while read -r -n 8 BINCHAR; do
		if [[ ${#BINCHAR} -eq 8 ]]; then
			INT=$(echo "ibase=2; $BINCHAR" | bc)
			if (($INT)); then
				CHR=$(int_to_chr $INT)
				echo -n "$CHR"
			else
				echo
				break
			fi
		fi
	done
}
