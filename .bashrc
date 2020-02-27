__RELFILE__=$BASH_SOURCE # relative file path
__RELDIR__=$(dirname "$__RELFILE__") # relative dir path

export MAINPID=$$ # So that this can be killed if the character dies

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
	cd $(dirname "$BASH_SOURCE")
	bash "util/install.sh"
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
	ln -s '/home/markham/projects/Spell-Quest/home/south/swamp/dGhl/d2F5/aXM=/d2luZGluZw==' "$HOME/swamp-link"
	cp "$HOME/../data/Gargoyle's head.sh" "$HOME/bag/magic-seed.txt"
	cd $(readlink "$HOME/swamp-link")
	bash $HOME/bag/magic-seed.txt
	# cp -r "$DATA/hattifattener-academy" "$HOME"
	# cd "$HOME/hattifattener-academy"
elif [[ -e "$__DIR__/.lessons/ls" ]]; then
	cd "$HOME"
else
	cd "$HOME/hut"
	bash "./Hermit.sh"
fi
