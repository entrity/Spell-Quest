my_prompt_callback () { echo -n; }
export PS1='spellcaster@xshellz:~\$ '

__RELFILE__=$BASH_SOURCE # relative file path
__RELDIR__=$(dirname "$__RELFILE__") # relative dir path
export __DIR__=$(canpath "$__RELDIR__")
export HOME="$__DIR__"

cd "$HOME"
cat <<-EOF
	Welcome to xshellz.
	Enter "exit" to leave this ssh session and return to your own machine.

EOF
