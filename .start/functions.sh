###########
# Functions
###########

spell () { printf "${SPELL}${*}${SPEECH_N}"; }
export -f spell
alt () { printf "${CYAN}${*}${SPEECH_N}"; }
export -f alt
red () { printf "${RED}${*}${SPEECH_N}"; }
export -f red
speak () { myfmt | less -r; }
export -f speak
learned () { touch "$HOME/.lessons/$*"; }
export -f learned
lessons () { ls -1 ~/.lessons; }
export -f lessons
