##############
# Aliases
##############

EDITOR=$(which gedit || which kate || which xed || which pluma || which nano || which geany || which atom || which /Applications/TextEdit.app/Contents/MacOS/TextEdit || which xdg-open || echo -n 'open -e')
export EDITOR=$(basename "$EDITOR")
IMAGER=$(which eog || which eom || which feh || which vlc || which /Applications/Preview.app/Contents/MacOS/Preview || which xdg-open || echo -n open)
export IMAGER=$(basename "$IMAGER")

if [[ $(uname) =~ Linux ]]; then
	if >/dev/null which cmd.exe; then
		OS=WSL # Linux as a Subsystem in Windows
		EDITOR='cmd.exe /c notepad'
		IMAGER='cmd.exe /c start'
		WSL_EXPLANATION="\n\nBut here's a tricky thing because your Linux environment is running as a subsystem within Windows: one of the subsystem's limitations is that it can't run any graphical programs (such as image-viewers or text-editors). So you must run a Windows command to open a program in Windows (not in Linux), using a path which your Windows environment will understand. These paths will be long and look broken.\n\nHow can you craft such a path? That's not too hard: first, make sure you're starting with an $(alt absolute path); second, change all of the $(alt /) symbols to $(alt \\); finally, prepend $(alt \\\\wsl$\\Ubuntu\\) to the front. Here's an example:\n\n$(alt '\\wsl$\Ubuntu\home\gregory\hut\Hermit.sh')"
	else
		OS=Linux
	fi
	alias ls='ls --color=always'
elif [[ $(uname) =~ Darwin ]]; then
	OS=MACOS
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
