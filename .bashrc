__RELFILE__=$BASH_SOURCE # relative file path
__RELDIR__=$(dirname "$__RELFILE__") # relative dir path

export MAINPID=$$ # So that this can be killed if the character dies

debug () { [[ $(whoami) == markham1 ]] && echo "++DEBUG>> $*"; }
export -f debug

debug Source .start
. "$__RELDIR__/.start/functions.sh"
debug Sourced functions
export __DIR__=$(canpath "$__RELDIR__")
export HOME="$__DIR__/home"
. "$__RELDIR__/.start/color.sh"
debug Sourced color
. "$__RELDIR__/.start/aliases.sh"
debug Sourced aliases
. "$__RELDIR__/util/prompt-callback.sh"
debug Sourced prompt-callback

###########
# Settings
###########

debug Settings
IMGDIR=$(canpath "$__DIR__/util/ascii")
export FOLD=65

###########
# Strings
###########

export LEAVE="${RED}Press \"q\" to leave${SPEECH_N} "
export CONTINUE="${RED}Press \"q\" to continue${SPEECH_N} "
export UTIL="$__DIR__/util"
export ACADEMYN="$HOME/north/forest/path-5/tree-7/academy-sylphan"
export CASTLE="$HOME/south/castle"
export DATA=$(canpath "$__DIR__/data")

############
# Color Config
#############

case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac
if [ "$color_prompt" = yes ]; then
	export PS1='${debian_chroot:+($debian_chroot)}\[\033[32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	export PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

##############
# Install
##############

if (($RESTART)) || ! [[ -e "$__DIR__/home" ]]; then
	debug Install
	cd $(dirname "$BASH_SOURCE")
	bash "util/install.sh"
fi

##############
# Start
##############

debug Start
if [[ $(whoami) == markham ]] && ((1)); then
	mkdir -p "$HOME/bag"
	ln -s "$HOME/north/forest/path-5/tree-7/academy-sylphan" "$HOME"
	ln -s "$HOME/north/forest/path-11/tree-16/" "$HOME"
	cd "$HOME"
else
	cd "$HOME/hut"
	bash "./Hermit.sh"
fi
