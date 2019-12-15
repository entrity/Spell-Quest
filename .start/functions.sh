###########
# Functions
###########

spell () { printf "${SPELL}${*}${SPEECH_N}"; }
export -f spell
alt () { printf "${CYAN}${*}${SPEECH_N}"; }
export -f alt
red () { printf "${RED}${*}${SPEECH_N}"; }
export -f red
wrap () { python "$UTIL/my_formatter.py"; }
export -f wrap
speak () { wrap | less -r; }
export -f speak
learned () { touch "$HOME/../.lessons/$*"; }
export -f learned
lessons () { ls -1 "$HOME/../.lessons" | sort --version-sort; }
export -f lessons
thisdir () { dirname "$(readlink -f "$0")"; }
export -f thisdir
