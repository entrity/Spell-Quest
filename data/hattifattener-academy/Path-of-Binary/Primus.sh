#!/bin/bash

strange_speak () {
	sed -e 's/o/0/g' -e 's/l/1/g' | speak
}

tutorial () {
	speak <<-EOF
	$(art frog-wizard.txt)

	${SPEECH}Hello, young pupil! Have you come to uncover the secrets of binary?

	No? Well, I suppose I shouldn't be suprised. I suppose everybody thinks this subject is pretty musty and dusty. Ah, but there is a joy in being able to use even just a little bit of binary. I'll show you:

	There is a spell $(spell stat), which can be used to view a few details of any file or directory. Let me show you an example. Here's what we see when I $(spell stat Primus.sh):

	${RESET}File: Primus.sh
	  Size: 321       	Blocks: 24         IO Block: 4096   regular file
	Device: 37h/55d	Inode: 793941      Links: 1
	Access: (0755/-rwxr-xr-x)  Uid: ( 1000/ markham)   Gid: ( 1000/ markham)
	Access: 2020-01-22 17:49:45.390778982 -0800
	Modify: 2020-01-22 17:49:45.390778982 -0800
	Change: 2020-01-22 17:49:45.390778982 -0800
	 Birth: -${SPEECH}

	Maybe that's pretty uninteresting, but look at the line that begins with the word $(alt Access). Do you see that there is a number $(alt 0755) there? That number indicates what access different users have for this file (me).

	* The first digit is not important. (It is a convention that tells us that no digit in the rest of the number will be larger than 8.)
	* The second digit tells us what permissions this file grants to the owner of this file. Who is the owner? Well, just check the username inside the parentheses after $(alt Uid) on that same line.
	* The third digit tells us what permissions this file grants to the group for this file. Who is the group? Well, just check the group name inside the parentheses after $(alt Gid) on that same line. (A group can include many users.)
	* The fourth and final digit tells us what permissions are granted to users who are not the owner and not in the group for this file.

	What kind of permissions exist? There are three:

	1. Permission to write to the file
	2. Permission to read from the file
	3. Permission to execute the file

	And now you get an explanation for why some files can be activated (like me) and others cannot (like this $(alt book.txt) here): files that can be activated have the $(alt execute) permission.

	Here we come to the magic of numbers: to calculate what value each of those digits in the Access number should hold, start with zero, then follow these steps:

	1. Add $(alt 1) if the user/group/all has permission to $(alt execute) the file/directory.
	2. Add $(alt 2) if the user/group/all has permission to $(alt write) the file/directory.
	3. Add $(alt 4) if the user/group/all has permission to $(alt read) the file/directory.

	Wait--what? Why are we adding 1, 2, and 4 instead of 1, 2, and 3? Because these numbers have a special property: whatever the sum is, you can unequivocally tell what the permissions are, for instance:

	* 7 is the sum of 1, 2, and 4
	* 6 is the sum of 2 and 4
	* 5 is the sum of 1 and 4
	* 4 is the sum of 4
	* ...and so on

	There's no way to make a mistake about what numbers were added together to compute the permission number. There's a smarter way of looking at this, but it requires a very basic understanding of $(alt binary).

	Ordinarily, when you work with numbers, you have 10 numerals: 0, 1, 2, 3, 4, 5, 6, 7, 8, and 9. When you are adding numbers, sometimes you have to go above 9, for example in the expression $(alt 1 + 9). What do you do then? Why, you add another digit and roll the previous digit back around to 0. That gives us $(alt 10).

	What if you didn't have 10 numerals? What if you had, say... 11? Let's pretend we have the numerals 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, $(red and A). Now when we compute $(alt 1 + 9), we don't have to add a digit, we just get $(alt A). But when we add $(alt 1 + A), we have to add a digit and end up getting $(alt 10). (But here, $(alt 10) doesn't signify ten because $(alt A) signifies ten; $(alt 10) is one more than $(alt A), so $(alt 10) signifies eleven!)

	Okay, so what if we didn't have ten or eleven numerals? What if we had only two? Well, if we have only the numerals 0 and 1, then $(alt 1 + 1) requires us to add a digit, and we get $(alt 10). (In a system with only two numerals, that doesn't signify ten; it signifies two). A numeric system consisting of only two numerals is what is meant by the word $(alt binary). How would we write the first few numbers in binary? Let's see...

	1.   1
	2.  10
	3.  11
	4. 100
	5. 101
	6. 110
	7. 111

	You might not have noticed anything remarkable about these numbers, but let's look again: these are the numbers that we can use to specify permissions on the Access which we viewed earlier, and what's important is that you can tell $(alt at a glance) which of the three permissions is turned on!

	* Any number with a $(alt 1) in the right digit offers $(alt execute) permission
	* Any number with a $(alt 1) in the middle digit offers $(alt write) permission
	* Any number with a $(alt 1) in the left digit offers $(alt read) permission

	Looking at a number in binary gives us the opportunity to interpret it as a series of true-false values. Each digit is one true-false value.

	Each digit in a binary number is called a $(alt bit). The word $(alt bit) is a portmanteau of "$(alt b)inary dig$(alt it)." Isn't that neat?

	Well, you can use the spell $(spell chmod) to set the permissions number on a file or directory, for example: $(spell chmod 777 Primus.sh). That value of 777 grants all permissions to all users. (There are actually easier ways to use $(spell chmod), but I won't take your time to teach them to you. You can use a web search or $(spell man) if you want to discover them.)

	When you write your own bash scripts, you can use $(spell chmod) to set the $(alt execute) permission, and then you can activate them!

	Before you go, let's take one more glance at numbering systems. We've looked at a system with two numerals ($(alt binary)) and a system with ten numerals (our ordinary numbering). But there are two more pretty common numbering systems. Let me list them all together right here:

	* $(alt binary): a numbering system with only two numerals
	* $(alt octal): a numbering system with eight numerals
	* $(alt decimal): a numbering system with ten numerals
	* $(alt hexadecimal): a numbering system with sixteen numerals

	Believe it or not, $(alt hexadecimal) is actually pretty common. Can you guess why? Perhaps it will be revealed in time.

	$CONTINUE
	EOF

	learned stat
	learned chmod

	wrap <<-EOF

	${SPEECH}Primus just lectured about representing numbers as binary bit-strings. He also introduced the spells $(spell chmod) and $(spell stat). Neat!

	...But this probably isn't enough to start studying $(alt steganography).
	EOF
}

tutorial
