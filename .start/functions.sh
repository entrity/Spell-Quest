###########
# Functions
###########

spell () { printf "${SPELL}${*}${SPEECH_N}"; }
export -f spell
alt () { printf "${CYAN}${*}${SPEECH_N}"; }
export -f alt
red () { printf "${RED}${*}${SPEECH_N}"; }
export -f red
learned () { touch "$HOME/.lessons/$*"; }
export -f learned
