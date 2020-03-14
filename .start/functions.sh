###########
# Functions
###########

spell () { printf "${SPELL}${*}${SPEECH_N}"; }
export -f spell
alt () { printf "${CYAN}${*}${SPEECH_N}"; }
export -f alt
red () { printf "${RED}${*}${SPEECH_N}"; }
export -f red
wrap () { python "$UTIL/my_formatter.py" $(tput cols); }
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
canpath () { python -c "import sys, os; print(os.path.realpath(sys.argv[1]))" "$1"; }
export -f canpath
# Flash function
reverse_video () { printf '\e[?5h'; }
export -f reverse_video
# Flash function
normal_video () { printf '\e[?5l'; }
export -f normal_video
# Prompt with a default of no
prompt_no () {
	echo -n "$1 [y/N] "
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
# Base64-decode all inputs
mjdecode64 () {
	while read x; do
		printf "%s  %s\n" "$x" "$(base64 -i -d <<< "$x")"
	done
}
export -f mjdecode64
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
