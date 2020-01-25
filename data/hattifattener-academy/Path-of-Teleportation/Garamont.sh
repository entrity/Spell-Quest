#!/bin/bash

tutorial () {
	speak <<-EOF

	$(art deer.txt)
	${SPEECH}Did you think you could sneak up on me? Ha! It takes a rare creature to accomplish that, but I applaud your attempt.

	Let me instruct you in the use of $(spell ssh). This is a very common Teleportation spell which connects your terminal to another computer. That means that whatever incantations you invoke will be executed on another machine.

	There are innumerable scenarios in which this is useful, but let's just look at a few.

	* Suppose that you back up your files to a fileserver in your home. When you want to $(spell grep) all of the files on the fileserver for a phone number, you don't need to actually walk to the server and plug in a keyboard or a monitor; you can access it from anywhere in the home by using $(spell ssh).
	* Suppose that you are running a website on a webserver and you want to make changes or investigate a problem; just run $(spell ssh), and in half a moment, you'll have all of the programs and files of the webserver at your fingertips.
	* Suppose it's too snowy to drive on the road, but your computer at work has a program that you need to run. You can $(spell ssh) to the work computer and run the program while you drink cocoa in front of the fire at home.
	* Suppose you are performing research as a university student and you have terabytes of data to process. You can't copy that data to your own computer, but you can still access that data from home by connecting to the university computer via $(spell ssh).

	What is the form of the incantation?

	$(spell ssh USERNAME@HOST)

	* USERNAME does not mean your username on your current computer; it means the username on the remote computer. (If the username on the remote computer is the same as your username on your local computer, you can skip the $(alt USERNAME@) part of this invocation.)
	* HOST is an identifier for the remote computer. It could be a web address, such as $(alt mywebsite.com), or it could be an IP address, such as $(alt 192.168.0.10).

	Do you know what an IP address is? It's a series of numbers which works a bit like a phone number. Each machine on a network is identified by an IP address, just like each phone is identified by a phone number. Let's look at how this works.

	1. Inside your home network: Your home's wifi is a wireless network, and the router is in charge of it. When your phone connects to the home wifi, the wifi router assigns an IP address to it. Any device on the home network can send a message to the IP address of any other device on the home network.
	2. Outside the home network: If your home network is configured correctly and the phone lines are connected, then devices on your home network can also send messages outside of the home network: they just specify an IP address outside the range of numbers which the router uses for the home, and the router is smart enough to send the request out to the internet. Devices on the internet can't send messages to devices on your home network, but they can send messages to your router, and the router can forward those messages to your home devices if it's expecting such a message.

	Unless you have set up an $(alt ssh key), you will be prompted to enter a password upon invoking $(spell ssh). As you type a password onto the terminal, nothing will appear. The terminal will hide your password in order to provide a little bit of protection against prying eyes. (There is nothing you can do about this. If your password is hard to type, you might wish to type it in a text editor, then copy and paste it into your terminal. Even when pasting it, your password will not appear in the terminal. Press Enter or Return when you're done.)

	Once you find yourself in an $(spell ssh) session. You can exit and return to your own machine by invoking $(spell exit) or by pressing $(alt 'Ctrl+d').

	Now, I understand that you are a treasure hunter. Doubtless you seek the treasure of treasure mountain. If you wish to lay claim to it, you must complete the following task:

	There is a certain machine on the internet which is running an $(alt ssh server). (That means the computer can accept $(spell ssh) connections.) I wish you to $(spell ssh) to that machine and retrieve some information.

	* The hostname for the remote computer is $(alt shell.xshellz.com)
	* The username for the ssh account is $(alt spellcaster)
	* The password for the ssh account is something you should be able to puzzle out. If you travel beneath the mountain south of the Hermit's hut, you should be able to discover four items: a wishbone, a yellow mushroom, a carbuncle, and a rabbit's foot. These four items have encrypted messages, which you can decrypt using the spell taught in $(alt level-2 of the encryption study in the Path of Shadow). You will also need the $(alt private.key) found in this room. Once you have decrypted and read all four messages, you should know what the password is that will gain you access to the $(spell ssh) account at $(alt shell.xshellz.com).

	Once you have managed to $(spell ssh) to $(alt shell.xshellz.com), you should find a file named 'treasure-key.txt' there. It is base-64 encoded. It contains instructions for opening the treasure at the mountaintop. But it also contains many lines with incorrect advice for opening the treasure. You will want only the line which includes a password that begins with a capital letter and is seven letters long and does not end in the letter $(alt s).

	Further research:

	* If you don't like typing your password every time you want to start an $(spell ssh) connection, read up on how to create and use an $(alt ssh key). Using such a key can also improves the security of your user account.
	* If you don't want to remember the IP address or hostname of your remote computer, read up on how to use an $(alt ssh config) file. This makes organizing and starting $(spell ssh) connections much faster and easier.

	$CONTINUE
	EOF

	learned ssh

	wrap <<-EOF
	EOF
}

tutorial
