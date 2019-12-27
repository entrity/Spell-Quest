__RELFILE__=$BASH_SOURCE # relative file path
__RELDIR__=$(dirname "$__FILE__") # relative dir path

debug () { [[ $(whoami) == markham ]] && echo "++DEBUG>> $*"; }
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
export CASTLE="$HOME/south/castle"
export DATA=$(canpath "$__DIR__/data")

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

if (($RESTART)) || ! [[ -e "$__DIR__/home" ]]; then
	debug Install
	cd "$HOME"
	bash "../util/install.sh"
fi

##############
# Start
##############

debug Start
if [[ -e "$HOME/../skip" ]] && [[ -e "$__DIR__/.lessons" ]]; then
	mkdir -p "$HOME/bag"
	learned ls
	grep '[0-9]\{3\}[) -]\{1,2\}[0-9]\{3\}-[0-9]\{4\}' "$HOME/north/forest/path-11/tree-16/spreadsheet.csv" > "$HOME/bag/phone-numbers.csv"
	grep '[A-Z]\{3\}' "$HOME/north/forest/path-11/tree-16/spreadsheet.csv" > "$HOME/bag/with-capitals.csv"
	grep 'John' "$HOME/north/forest/path-11/tree-16/spreadsheet.csv" > "$HOME/bag/John.csv"
	sed -e 's/SALUTARY/INIMICAL/' "$HOME/../backup/north/forest/path-11/tree-16/scroll.txt" > "$HOME/north/forest/path-11/tree-16/scroll.txt"
	cp "$__DIR__/data/mighty-axe.sh" "$HOME/bag"
	cp "$__DIR__/data/Lich.sh" "$HOME/cave/tunnel/cavern"
	cd "$ACADEMYN/Transmutation"
	cd "$HOME/south/castle"
elif [[ -e "$__DIR__/.lessons/ls" ]]; then
	cd "$HOME"
else
	cd "$HOME/hut"
	bash "./.Hermit.sh"
fi
