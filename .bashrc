__FILE__=$(readlink -f $BASH_SOURCE)
export __DIR__=$(dirname "$__FILE__")
export HOME="$__DIR__/home"
IMGDIR="$__DIR__/util/ascii"

. "$__DIR__/.start/ascii-art.sh"
. "$__DIR__/.start/color.sh"
. "$__DIR__/.start/aliases.sh"
. "$__DIR__/.start/functions.sh"

###########
# Settings
###########

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

if ! [[ -e "$__DIR__/home" ]]; then
	bash "util/install.sh"
fi
if [[ -e "$__DIR__/.lessons/ls" ]]; then
	cd "$HOME"
else
	cd "$HOME/hut"
	bash "./.Hermit.sh"
fi
