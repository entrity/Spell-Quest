#!/bin/bash

PORTAL="$(thisdir)/portal"
PORTAL_DST=$(canpath "$PORTAL")

read -r -d '' MAIN_TEXT <<-EOF
$(spell ln -s DESTINATION PORTAL)

* $(alt ln) is the name of the spell, and it's short for "link" because it creates a link from PORTAL to DESTINATION (but not the other direction)

* $(alt DESTINATION) is the location where you want the portal to take you. *However*, the DESTINATION should be an $(alt absolute path), not a $(spell relative path). That means it should begin with the $(alt /) symbol. If you make a symlink using a relative path for the DESTINATION, then the portal will not always work. (You might be able to riddle out why after hearing the rest of what I have to say.)

* $(alt PORTAL) is where you want the portal to be found. The PORTAL parameter does not need to be an absolute path. Usually, you want it in your current directory. And if you want it to have the same name as the DESTINATION, then you can just specify a directory for PORTAL. A common invocation would be $(spell 'ln -s /foo/bar .').

* $(alt \-s) means that the link is a "symbolic" link. We Teleporters usually call it a "symlink." What that means is that the portal doesn't link fixedly to any location; instead, it just holds a $(alt path) and tries to teleport you thither. I'll give you an example. Suppose that the following commands are executed:

$(spell "ln /home/me/myfile.txt hardlink.txt\nmv /home/me/myfile.txt /tmp/lostfile.txt\ncat hardlink.txt")

These commands create a hard link (not a symlink) to a file. Even after the file is moved, the hard link is intact, and the $(spell cat) invocation succeeds. But if we try this with a symlink...

$(spell "ln -s /home/me/myfile.txt symlink.txt\nmv /home/me/myfile.txt /tmp/lostfile.txt\ncat symlink.txt\necho 'new content' > /home/me/myfile.txt\ncat symlink.txt")

These commands create a symlink, which is not bound to a file but instead to a path. The first call to $(spell cat) fails because there is no file at the path $(alt /home/me/myfile.txt), but the second call to $(spell cat) succeeds because a file has been created there. But the file there is different from the file for which the symlink was originally created! So beware.

Oh, I had better teach you another spell in case you need to remove a link. This is a Destruction spell, so it's pretty dangerous, but you look like someone I can trust. $(spell rm) can be used to remove any file, not just a link but any file. It won't remove a directory, though. It's pretty easy, just invoke $(spell rm TARGET), and the TARGET will disappear. I warn you, though, there's no getting the TARGET back. It isn't as if it will go away into a recycling bin somewhere. Though I have heard tell of a tool that will perform a safe removal of that sort, it's not a standard spell; you would have to obtain it through special means. (See $(alt https://github.com/andreafrancia/trash-cli) when you have the time.)

I'll teach you another neat trick. You know the spell $(spell ls)? Well, you can add a parameter to it to get additional information about the files and directories around you: $(spell ls -l) will show you who the owner is, when each entity was last modified, and (in the case of symlinks) what the destination is. You can use this to check your work.
EOF

if [[ -e "$PORTAL"  ]] && [[ $ACADEMYN =~ $PORTAL_DST ]]; then
	touch "$HOME/iron-gauntlet.txt"
	speak <<-EOF
	$(art 'halberd-knight.txt')
	${SPEECH}Oh, thank you! This is just what I need! I have but a small token of gratitude to bestow upon you. Perhaps it shall come in useful.

	$(alt He drops an iron gauntlet into your bag.)

	Do you want me to repeat my instruction?

	$(echo -e "$MAIN_TEXT")

	$CONTINUE
	EOF
elif [[ -e "$PORTAL" ]]; then
	speak <<-EOF
	$(art 'halberd-knight.txt')
	${SPEECH}Hmm. That portal doesn't quite work. Do you need me to repeat my instruction?

	$(echo -e "$MAIN_TEXT")

	$CONTINUE
	EOF
else
	speak <<-EOF
	$(art 'halberd-knight.txt')
	${SPEECH}[Sigh] I wish I could go meet some new wizards. I've spoken with all of the magic users here a dozen times over. What I really want is to go visit the forest academy north of here, but I can't leave my post long enough to go searching through the forest for it. That could take weeks!

	I know a good deal of Teleportation magic, so I know I could open a portal there if only I knew where it was!

	Have you been to the academy? Would you open a portal for me if I teach you how?

	It's really quite easy. This is a first-level spell:

	$(echo -e "$MAIN_TEXT")
	
	What I want you to do is open a portal here, right next to me, pointing to the academy in the north forest. (Hard links can only be created for files, not directories, so I need you to create a symlink.) And please name the symlink $(alt scary-portal) so that no one else will want to go through it.

	When you've done so, please talk to me again. You wonder what's so special about the north forest academy? I've heard tell that there is a $(alt Gnome) there who can teach a $(alt third-level spell)!

	$CONTINUE
	EOF

	wrap <<-EOF
	It sounds like a good idea: use the $(spell ln)${RESET} spell to create a symlink to the academy in the north forest. Remember to name the link $(alt scary-portal).
	EOF
fi

learned 'ln -s'
learned rm
learned 'ls -l'
