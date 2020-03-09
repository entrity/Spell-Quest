#!/bin/bash

tutorial () {
	speak <<-EOF
	   __      Z
	  ~  \    z
	 / _ _\ z 
	(____ _)

	${SPEECH}Zzzz. Wha--?

	Oh, you just learned about $(spell ssh), did you? Hmm. Well, I'm pretty busy, as you can see. But I guess I could tell you about four spells that make $(alt ssh) connections and use the connections for $(alt transferring files).

	* $(spell rsync) is perhaps the most useful of today's spells. It is used for sync-ing files (and directories) from one machine to another. The 'r' in $(spell rsync) is for 'recursive'; it's called that because if you cast $(spell rsync) on a directory, it will recurse into subdirectories and all of their files. You can set up an rsync task as a scheduled task with the use of $(spell cron) if you like.

	* $(spell scp) is a spell that works like $(spell cp) except that it creates an $(spell ssh) connection and copies files from one machine to another. This requires that you know both the local path and the remote path (whether you are uploading or downloading) and provide both paths as parameters when you invoke $(spell scp). If you don't want to have to type out the remote path from memory, you may find the next spell useful...

	* $(spell sftp) is used for copying files from one machine to another, but instead of using parameters to specify which files you want copied, invoking $(spell sftp) creates a limited command-line interface to a remote machine. Using that interface, you can use a few spells like $(spell ls), $(spell cd), $(spell get), and $(spell put) to look around and decide where you want to download or upload.

	* $(spell sshfs) can be used to link directories from a remote machine right into your local machine so that you can browse and interact with them as if they were plugged right into your computer. Beware that if you are working with a slow connection or with large files, this can result in slow interaction between you and the mounted remote files/directories.

	Any of these spells can be used to access any remote machine that can be accessed by $(spell ssh).

	I don't honestly know which, if any, of these might interest you, so I invite you to perform a websearch for more information on whichever you pleaszzzzZZZZ....

	$CONTINUE
	EOF

	wrap <<-EOF

	${SPEECH}Hmm... Did any of the spells $(spell rsync), $(spell scp), $(spell sftp), or $(spell sshfs) interest you? It might be worth performing a websearch and learning to use them.
	EOF
}

tutorial
