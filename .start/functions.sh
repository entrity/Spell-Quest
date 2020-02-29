###########
# Functions
###########

spell () { printf "${SPELL}${*}${SPEECH_N}"; }
export -f spell
alt () { printf "${CYAN}${*}${SPEECH_N}"; }
export -f alt
red () { printf "${RED}${*}${SPEECH_N}"; }
export -f red
wrap () { python "$UTIL/my_formatter.py" $(tput cols); }
export -f wrap
speak () { wrap | less -r; }
export -f speak
learned () {
	printf -v LESSON "%-24s (from $(basename "$0"))" "$*"
	touch "$HOME/../.lessons/$LESSON"
}
export -f learned
lessons () { ls -1 "$HOME/../.lessons" | sort --version-sort; }
export -f lessons
thisdir () { dirname "$(canpath "$0")"; }
export -f thisdir
# Get ascii art
art () { cat "$HOME/../util/ascii/$1"; }
export -f art
# Get canonical path
canpath () { python -c "import sys, os; print(os.path.realpath(sys.argv[1]))" "$1"; }
export -f canpath
# Flash function
reverse_video () { printf '\e[?5h'; }
export -f reverse_video
# Flash function
normal_video () { printf '\e[?5l'; }
export -f normal_video
# Prompt with a default of no
prompt_no () {
	echo -n "$1 [y/N] "
	read -n1 CHOICE
	echo
	[[ $CHOICE =~ y|Y ]]
	return $?
}
export -f prompt_no
