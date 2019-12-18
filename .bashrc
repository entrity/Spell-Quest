__FILE__=$(readlink -f $BASH_SOURCE)
export __DIR__=$(dirname "$__FILE__")
export HOME="$__DIR__/home"
IMGDIR="$__DIR__/util/ascii"
export DEBUG=1

debug () { ((1)) && echo "++DEBUG>> $*"; }
export -f debug

debug Source .start
. "$__DIR__/.start/color.sh"
debug Sourced color
. "$__DIR__/.start/aliases.sh"
debug Sourced aliases
. "$__DIR__/.start/functions.sh"
debug Sourced functions
. "$__DIR__/util/prompt-callback.sh"
debug Sourced prompt-callback

###########
# Settings
###########

debug Settings
export FOLD=65
if [[ $(uname) =~ Linux ]]; then
	export EDITOR=gedit
elif [[ $(uname) =~ Darwin ]]; then
	osascript -e 'tell application "Terminal" to set current settings of front window to first settings set whose name is "Homebrew"'
	export EDITOR="open -e"
	ENVSUBST_PATH="$(find /usr/local -name envsubst)"
	alias envsubst="$ENVSUBST_PATH"
fi

###########
# Strings
###########

export LEAVE="${RED}Press \"q\" to leave${SPEECH_N} "
export CONTINUE="${RED}Press \"q\" to continue${SPEECH_N} "
export UTIL="$__DIR__/util"
export ACADEMYN="$HOME/north/forest/path-5/tree-7/academy-sylphan"
export DATA=$(readlink -f "$__DIR__/data")

############
# Color Config
#############

case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac
if [ "$color_prompt" = yes ]; then
	export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	export PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

##############
# Install
##############

if ! [[ -e "$__DIR__/home" ]]; then
	debug Install
	bash "util/install.sh"
fi

##############
# Start
##############

debug Start
if [[ -e "$HOME/../skip" ]]; then
	mkdir -p "$HOME/bag"
	learned ls
	grep '[0-9]\{3\}[) -]\{1,2\}[0-9]\{3\}-[0-9]\{4\}' "$HOME/north/forest/path-11/tree-16/spreadsheet.csv" > "$HOME/bag/phone-numbers.csv"
	grep '[A-Z]\{3\}' "$HOME/north/forest/path-11/tree-16/spreadsheet.csv" > "$HOME/bag/with-capitals.csv"
	grep 'John' "$HOME/north/forest/path-11/tree-16/spreadsheet.csv" > "$HOME/bag/John.csv"
	sed -e 's/SALUTARY/INIMICAL/' "$HOME/../backup/north/forest/path-11/tree-16/scroll.txt" > "$HOME/north/forest/path-11/tree-16/scroll.txt"
	cd "$ACADEMYN/Transmutation"
	# cd "$HOME/cave/tunnel/cavern/calm-pool"
	cd "$HOME"
elif [[ -e "$__DIR__/.lessons/ls" ]]; then
	cd "$HOME"
else
	cd "$HOME/hut"
	bash "./.Hermit.sh"
fi
