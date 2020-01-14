##############
# Aliases
##############

if [[ $(uname) =~ Linux ]]; then
	export EDITOR=gedit
	export IMAGER=eog

	alias ls='ls --color=auto'
elif [[ $(uname) =~ Darwin ]]; then
	osascript -e 'tell application "Terminal" to set current settings of front window to first settings set whose name is "Homebrew"'
	export EDITOR="open -e"
	export IMAGER="open"

	ENVSUBST_PATH="$(find /usr/local -name envsubst)"
	alias envsubst="$ENVSUBST_PATH"
	alias ls='ls -G'
	alias tac='tail -r'
else
	>&2 echo "ERR: Unrecognized Operating System: $(uname)"
fi

alias gs='git status'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

shopt -s expand_aliases
