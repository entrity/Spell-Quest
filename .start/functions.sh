###########
# Functions
###########

# This fn is used because WSL (Linux on Windows) does not install anything for
# 'python' but does install something for 'python3'.
python_exec() { which python || which python3; }
export -f python_exec
spell () { printf "${SPELL}${*}${SPEECH_N}"; }
export -f spell
alt () { printf "${CYAN}${*}${SPEECH_N}"; }
export -f alt
red () { printf "${RED}${*}${SPEECH_N}"; }
export -f red
wrap () { $(python_exec) "$UTIL/my_formatter.py" $(tput cols); }
export -f wrap
speak () { wrap | less -r; }
export -f speak
learned () {
	printf -v LESSON "%-24s (from $(basename "$0"))" "$*"
	touch "$HOME/../.lessons/$LESSON"
}
export -f learned
lessons () { ls -1 "$HOME/../.lessons" | sort --version-sort; }
export -f lessons
thisdir () { dirname "$(canpath "$0")"; }
export -f thisdir
# Get ascii art
art () { cat "$HOME/../util/ascii/$1"; }
export -f art
# Get canonical path
canpath () { $(python_exec) -c "import sys, os; print(os.path.realpath(sys.argv[1]))" "$1"; }
export -f canpath
# Flash function
reverse_video () { printf '\e[?5h'; }
export -f reverse_video
# Flash function
normal_video () { printf '\e[?5l'; }
export -f normal_video
# Prompt with a default of no
prompt_no () {
	echo -e -n "$(wrap <<< "$1 [y/N] ${RESET}")"
	</dev/tty read -n1 CHOICE
	echo
	[[ $CHOICE =~ y|Y ]]
	return $?
}
export -f prompt_no
prompt_repeat () {
	echo
	if prompt_no "Do you want me to repeat my instruction?"; then
		tutorial
	fi
}
export -f prompt_repeat
function run_exercise () {
	ANSWER="$1"
	REGEX="$2"
	while ! prompt_exercise "$REGEX"; do
		if [[ $# -gt 2 ]]; then
			wrap <<< "${SPEECH}Free Hint: $3 (This hint is not necessarily useful; I did not consider whether this hint reflects your error before I shared it.)${RESET}"
			shift
		else
			wrap <<< "${SPEECH}Alas! I'm looking for $(alt "$ANSWER"). Would you try entering exactly that?${RESET}"
		fi
	done
	echo
	echo "${SPEECH}Good job!${RESET}"
	echo
}
export -f run_exercise
# Prompt for command. If it matches regex, then evaluate the command.
prompt_exercise () {
	read -e -p "${RESET}\$ " -a PP
	if [[ ${PP[@]} =~ $1 ]]; then
		[[ -n $NO_EXEC_EXERCISE ]] || "${PP[@]}"
		return 0
	else
		return 2
	fi
}
export -f prompt_exercise
# Base64-decode all inputs
mjdecode64 () {
	while read x; do
		printf "%s  %s\n" "$x" "$(base64 -i -d <<< "$x")"
	done
}
export -f mjdecode64
mjlower () {
	echo -n -e "$*" | tr '[:upper:]' '[:lower:]'
}
export -f mjlower
# Stub ssh
ssh () {
	host=${1#*@}
	user=${1%@*}
	if [[ $host != shell.xshellz.com ]]; then
		>&2 echo "ssh: Could not resolve hostname ${host}: Name or service not known"
		return 1
	fi
	echo -n "${1}'s password: "
	read -s password
	FAKEPW=$(base64 -d <<< "bW9vbiBmZXN0aXZhbC5jYW1lcmEuc2FpbGluZy5tYXRpbGRh")
	if [[ "$user" != "spellcaster" ]] || [[ "$password" != "$FAKEPW" ]]; then
		>&2 echo "Permission denied."
		return 1
	fi
	[[ -e "$HOME/../xshellz" ]] && rm -r "$HOME/../xshellz"
	cp -r "$HOME/../data/ssh" "$HOME/../xshellz"
	touch "$HOME/../xshellz/.sudo_as_admin_successful"
	echo
	bash --rcfile "$HOME/../xshellz/.bashrc"
}
export -f ssh
