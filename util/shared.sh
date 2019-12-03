#!/bin/bash

FOLD=65

spell () {
	printf "${SPELL}${*}${RESET}${SPEECH}"
}
export -f spell
alt () {
	printf "${COLOR_Cyan}${*}${RESET}${SPEECH}"
}

############
# COLORS
############
COLOR_Black=$'\u001b[30m'
COLOR_Red=$'\u001b[31m'
COLOR_Blue=$'\u001b[34m'
COLOR_Magenta=$'\u001b[35m'
COLOR_Cyan=$'\u001b[36m'
COLOR_White=$'\u001b[37m'
COLOR_Reset=$'\u001b[0m'
COLOR_BR_Black=$'\u001b[30;1m'
COLOR_BR_Red=$'\u001b[31;1m'

GREEN=$'\033[32m'
YELLOW=$'\033[33m'
BOLD=$'\033[;1m'
RESET=$'\033[0;0;0m'
SPEECH=$YELLOW
SPELL=${BOLD}${GREEN}

############
# COLORS
############
BG_Black=$'\u001b[40m'
BG_Red=$'\u001b[41m'
BG_Green=$'\u001b[42m'
BG_Yellow=$'\u001b[43m'
BG_Blue=$'\u001b[44m'
BG_Magenta=$'\u001b[45m'
BG_Cyan=$'\u001b[46m'
BG_White=$'\u001b[47m'
BG_BR_Black=$'\u001b[40;1m'
BG_BR_Red=$'\u001b[41;1m'
BG_BR_Green=$'\u001b[42;1m'
BG_BR_Yellow=$'\u001b[43;1m'
BG_BR_Blue=$'\u001b[44;1m'
BG_BR_Magenta=$'\u001b[45;1m'
BG_BR_Cyan=$'\u001b[46;1m'
BG_BR_White=$'\u001b[47;1m'

if [[ $BASH_SOURCE == $0 ]]; then
	echo DEMO
	printf "${COLOR_Black} Black"
	printf "${COLOR_Red} Red"
	printf "${COLOR_Green} Green"
	printf "${COLOR_Yellow} Yellow"
	printf "${COLOR_Blue} Blue"
	printf "${COLOR_Magenta} Magenta"
	printf "${COLOR_Cyan} Cyan"
	printf "${COLOR_White} White"
	printf "${COLOR_Reset} Reset"
	printf "${COLOR_BR_Black} BR_Black"
	printf "${COLOR_BR_Red} BR_Red"
	printf "${COLOR_BR_Green} BR_Green"
	printf "${COLOR_BR_Yellow} BR_Yellow"
	printf "${COLOR_BR_Blue} BR_Blue"
	printf "${COLOR_BR_Magenta} BR_Magenta"
	printf "${COLOR_BR_Cyan} BR_Cyan"
	printf "${COLOR_BR_White} BR_White"
	echo
	printf "${BG_Black} BG_Black"
	printf "${BG_Red} BG_Red"
	printf "${BG_Green} BG_Green"
	printf "${BG_Yellow} BG_Yellow"
	printf "${BG_Blue} BG_Blue"
	printf "${BG_Magenta} BG_Magenta"
	printf "${BG_Cyan} BG_Cyan"
	printf "${BG_White} BG_White"
	printf "${BG_BR_Black} BG_BR_Black"
	printf "${BG_BR_Red} BG_BR_Red"
	printf "${BG_BR_Green} BG_BR_Green"
	printf "${BG_BR_Yellow} BG_BR_Yellow"
	printf "${BG_BR_Blue} BG_BR_Blue"
	printf "${BG_BR_Magenta} BG_BR_Magenta"
	printf "${BG_BR_Cyan} BG_BR_Cyan"
	printf "${BG_BR_White} BG_BR_White"
fi
