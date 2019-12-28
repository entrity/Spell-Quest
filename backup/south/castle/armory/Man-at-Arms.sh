#!/bin/bash

tutorial () {
	speak <<-EOF
	Have you ever seen an axe as fine as this? I'll wager you haven't!

	Oh, you're hear for magic training, aren't you? Well, let me tell you about a special term that will help you understand the spells you've been casting: $(alt '$PATH')

	$(alt '$PATH') is a special term which holds a list of paths. Let's look at it together. Here's what gets printed when I $(spell 'echo $PATH'):

	${RESET}$PATH

	${SPEECH}That's a list of paths, separated with the $(alt ':') symbol. When you invoke a spell, in most cases, that spell is actually an activate-able file which resides somewhere in the world. But where? Well, the command-line interpreter searches all of the directories in $(alt '$PATH'), and as soon as it finds a file of a matching name, it activates that file!

	For example, $(spell find) is a file located at $(alt $(which find)). How did I know that? I used the spell $(spell type). Watch this:

	$(spell type find)
	${RESET}$(type find)

	${SPEECH}Can you see that the $(alt $(dirname "$(which find)")) directory is in your $(alt '$PATH')?

	${SPEECH}Isn't that something? Usually, you have to specify at least one directory to activate a file, as in the example $(spell '~/bag/mighty-axe.sh') or $(spell ./Man-at-Arms.sh), but if the file you want to activate is in one of your $(alt '$PATH') directories, then you don't need to specify any directories.

	Well, not all spells exist as files in your $(alt '$PATH'). There are three common kinds of spell:

	1. Files in your $(alt '$PATH') that can be activated

	2. Commands that interpreted directly by the command-line interpreter, such as $(spell echo). (There aren't many of these. When you invoke $(spell type) for such a spell, it will identify these by saying, "$(alt ...is a shell builtin).")

	3. Aliases: these are shortcuts that you create yourself. What? You don't know how to make such a shortcut? I'll have to teach you before I send you on your way.

	Suppose you think that you might want to $(spell grep) for the pattern $(alt '[0-9]\{3\}') often. You could make a shortcut for it by use of the $(spell alias) spell. You can call your shortcut anything you want, so long as it begins with a letter and contains only letters, numbers, and the $(alt _) symbol. Let's call our shortcut $(alt gnum):

	$(spell "alias gnum=\"grep '[0-9]\{3\}'\"")

	Then we can invoke the shortcut as if it were a spell:

	$(spell gnum some-file.txt)

	Your aliases will disappear each time you close your command-line interpreter. But you can preserve them by putting them into any file you like and then $(alt sourcing) that file. $(alt Sourcing) means bringing something from a file into your current environment. How do you do it? Suppose we have a file $(alt my-aliases) which contains the following:

	${RESET}alias gnum="grep '[0-9]\{3\}'"
	alias findhere="find . -iname"${SPEECH}

	We can source that file by invoking:

	$(spell '. my-aliases')

	(If you've learned about $(alt variables) already, I should tell you that you can also put $(alt variables) into a file and then $(alt source) that file! Or you can put $(alt aliases) and $(alt variables) into the same file!)

	That's all I have to teach you. But if you can demonstrate your skills, then I'll tell you a secret that will help you traverse the swamp. I want you to to and then speak to me again, $(alt but provide 3 parameters when you speak to me).

	1. I want your first parameter to be any spell you know which is an activatable file
	2. I want your second paramter to be any spell you know which is a shell builtin.
	3. I want your third parameter to be something special: I've created a file right here called $(alt bash_aliases). I want you to write an alias into that file and then give the alias' name as your third parameter.

	If you're having trouble remembering what spells you have learned, you can invoke $(spell lessons). You might even redirect the output of that invocation into a file which you can open with $(spell $EDITOR).

	$CONTINUE
	EOF

	touch "$(thisdir)/bash_aliases"

	learned '(variable) $PATH'
	learned 'type'
	learned 'alias'
	learned '(technique) sourcing'

	wrap <<-EOF
	${SPEECH}Use $(spell type) to discover which of the spells you know is a file, a shell builtin, or an alias. Then speak to the Man-at-Arms again, this time activating him with three $(alt parameters): a spell which is a file, one which is a shell builtin, and one which is an alias. (Remember to write the alias into $(alt ./bash_aliases).)
	EOF
}
is_alias () {
	2>/dev/null type "$*" | grep -q 'is aliased to'
	return $?
}
is_shell_builtin () {
	2>/dev/null type "$*" | grep -q 'is a shell builtin'
	return $?
}
is_file () {
	2>/dev/null >/dev/null type "$*" && ! is_alias "$*" && ! is_shell_builtin "$*"
	return $?
}

if (($#)); then
	shopt -s expand_aliases
	. "$(thisdir)/bash_aliases"
	if ! is_file "$1"; then
		wrap <<-EOF
		${SPEECH}Hm. That first parameter is not correct. I'm looking for a spell which is actually a $(alt file).
		EOF
	elif ! is_shell_builtin "$2"; then
		wrap <<-EOF
		${SPEECH}Hm. That second parameter is not correct. I'm looking for a spell which is actually a $(alt shell builtin).
		EOF
	elif ! is_alias "$3"; then
		wrap <<-EOF
		${SPEECH}Hm. That third parameter is not correct. I'm looking for a spell which is actually an $(alt alias).
		EOF
	else
		wrap <<-EOF
		${SPEECH}You did it! As promised, here is something to help you through the swamp:

		The keyword for the second segment of your path through the swamp is $(alt way).
		EOF
	fi
else
	tutorial
fi
