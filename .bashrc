__FILE__=$(readlink -f $BASH_SOURCE)
export __DIR__=$(dirname "$__FILE__")
export HOME="$__DIR__"
IMGDIR="$__DIR__/.util/ascii"

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
elif [[ $(uname) =~ Mac ]]; then
	export EDITOR="open -e"
	osascript -e 'tell application "Terminal" to set current settings of front window to first settings set whose name is "Homebrew"'
fi

###########
# Strings
###########

export LEAVE="${RED}Press \"q\" to leave${SPEECH_N} "
export CONTINUE="${RED}Press \"q\" to continue${SPEECH_N} "
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

mkdir -p $HOME/.lessons
if [[ -f "$__DIR__/hut/.Hermit.sh" ]]; then
	cd "$__DIR__/hut"
	(($#)) || bash "./.Hermit.sh"
else
	>&2 echo "ERROR: hut or Hermit not found"
	exit 1
fi
