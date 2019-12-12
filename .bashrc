__FILE__=$(readlink -f $BASH_SOURCE)
export __DIR__=$(dirname "$__FILE__")
export HOME="$__DIR__"
IMGDIR="$__DIR__/.util/ascii"

###########
# Color
###########

export BRBLUE==$'\033[1;34m'
export BRGREEN=$'\033[1;32m'
export BRCYAN=$'\033[1;36m'
export GREEN=$'\033[32m'
export YELLOW=$'\033[33m'
export CYAN=$'\033[36m'
export RED=$'\033[31m'
export BOLD=$'\033[;1m'
export RESET=$'\033[0;0;0m'
export SPEECH=$YELLOW
export SPEECH_N=$'\033[0;33m'
export SPELL=$'\033[1;32m'

###########
# Settings
###########

export FOLD=65

###########
# ASCII Art
###########

export BOW=$( cat $IMGDIR/bow.txt )
export BIGBUN=$( cat $IMGDIR/big-bun.txt )
export LILBUN=$( cat $IMGDIR/lil-bun.txt )
export WIZARD_JAGGERS=$( cat $IMGDIR/wizard-jaggers.txt )

###########
# Strings
###########

export LEAVE="${RED}Press \"q\" to leave${SPEECH_N} "
export CONTINUE="${RED}Press \"q\" to continue${SPEECH_N} "

###########
# Functions
###########

spell () { printf "${SPELL}${*}${SPEECH_N}"; }
export -f spell
alt () { printf "${CYAN}${*}${SPEECH_N}"; }
export -f alt
red () { printf "${RED}${*}${SPEECH_N}"; }
export -f red

############
# Color Config
#############

case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac
if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


##############
# Start
##############

if [[ -f "$__DIR__/hut/.Hermit.sh" ]]; then
	cd "$__DIR__/hut"
	bash "./.Hermit.sh"
else
	>&2 echo "ERROR: hut or Hermit not found"
	exit 1
fi
