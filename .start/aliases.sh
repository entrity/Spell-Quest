##############
# Aliases
##############

EDITOR=$(which gedit || which kate || which xed || which pluma || which nano || which geany || which atom || which /Applications/TextEdit.app/Contents/MacOS/TextEdit || which xdg-open || echo -n 'open -e')
export EDITOR=$(basename "$EDITOR")
IMAGER=$(which eog || which eom || which feh || which vlc || which /Applications/Preview.app/Contents/MacOS/Preview || which xdg-open || echo -n open)
export IMAGER=$(basename "$IMAGER")

if [[ $(uname) =~ Linux ]]; then
	alias ls='ls --color=auto'
elif [[ $(uname) =~ Darwin ]]; then
	osascript -e 'tell application "Terminal" to set current settings of front window to first settings set whose name is "Pro"'

	ENVSUBST_PATH="$(find /usr/local -name envsubst)"
	alias envsubst="$ENVSUBST_PATH"
	alias ls='ls -G'
	alias tac='tail -r'
else
	>&2 echo "ERR: Unrecognized Operating System: $(uname)"
fi

alias ll='ls -l'
alias gs='git status'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

shopt -s expand_aliases
