#!/bin/bash

AZRIEL=$RESET$BRBLUE
FLAVIUS=$RESET$BRMAGENTA

tutorial () {
	local WIDTH=$(tput cols)
	if [[ -z $WIDTH ]] || [[ $WIDTH -gt 65 ]]; then
		WIDTH=65
	fi
	speak <<-EOF

	$(art duo.txt | cut -c -$WIDTH)
	${AZRIEL}Oy there! I'm Azriel.

	${FLAVIUS}And I am Flavius. We are instructors in the Path of Shadow. Have you learned the level-3 spell $(spell gpg)${FLAVIUS} yet?

	${AZRIEL}If you've come this far, you must know how to encrypt messages or files using $(spell openssl)${AZRIEL}, but $(spell gpg)${AZRIEL} is different in this respect:

	* $(spell openssl)${AZRIEL} makes use of only one key/password; when it's time to decrypt a message, you must use the same key/password that was used to encrypt the message.
	* $(spell gpg)${AZRIEL} makes use of two different key/passwords; one key is used the encrypt the message and the other key is used to decrypt it.

	${FLAVIUS}We call the first scheme (using only one key) $(alt symmetric-key)${FLAVIUS} cryptography. The second scheme (using two different keys) is $(alt asymmetric-key)${FLAVIUS} cryptography. It may sound inconvenient to need two different keys, but it is extremely useful:

	${FLAVIUS}Suppose that Azriel has travelled to a faraway land and needs to send me a secret. He could encrypt the file and send it to me by email, but how would I know what the password to decrypt the file is? It's true that he might send the password by email as well, but email is not a highly secure method of communication. (If it were secure, he wouldn't need to encrypt my file in the first place.)

	${FLAVIUS}We have a problem on our hands. And it gets worse! Azriel is even less reliable than email!

	${AZRIEL}Oy!

	${FLAVIUS}It's the truth! Whenever he comes up with a password, he writes it down on little notes and leaves them all over the academy. Sometimes he even tells his friends what his passwords are.

	${AZRIEL}Oh, I'm sure everyone does that from time to time.

	${FLAVIUS}But asymmetric-key cryptography provides a solution to both of these problems. Under this scheme, I create $(alt two)${FLAVIUS} keys: a private one, which I keep secret, and a public one, which I can share with everyone.

	I send the public key to all my friends and family, including Azriel. I can even share the public key with strangers! Azriel will use my public key to encrypt the file for me. Once it is encrypted this way, only my private key will unlock it. No one else, not even Azriel, can decrypt the file.

	${AZRIEL}Here are the common tasks that you will want to perform using $(spell gpg)${AZRIEL}:

	1. Create a pair of keys
	2. List the keys in your keyring (The keyring is a structure that helps you keep track of your keys. You could potentially accrue many keys if all of your friends and family send you their public keys.)
	3. Export a public key from your keyring to share with others
	4. Add a public key from someone else to your keyring
	5. Encrypt a file using a key from your keyring
	6. Decrypt a file using a key from your keyring

	Let's look at each task. You'll want to write these down in your notebook, but they'll also show up in your $(spell lessons)${AZRIEL}:

	Create a pair of keys
	* $(spell gpg --gen-key)${AZRIEL}
	* This will result in you being prompted for information and a password to protect your key. (When entering a password on the command line, you can type and type, but your password will not appear on the command line. Your typing is hidden to protect it from being seen. You can actually enter a blank password if you want.) Your keys will automatically be added to your keyring.

	List the keys on your keyring
	* List the private keys on your keyring:
	* $(spell gpg --list-keys)${AZRIEL}
	* List the public keys on your keyring:
	* $(spell gpg --list-public-keys)${AZRIEL}
	* Keys will appear as triplets with the three pieces of information labelled 'pub', 'uid', and 'sid'. The 'uid' section shows the name and/or email of the key's owner. That's the section you will care about.

	Export a public key from your keying
	* $(spell gpg --export -a USERNAME)${AZRIEL}
	* The USERNAME can be either the name or the email address that appears in the 'uid' section when you list the keys on your keyring.
	* This will actually print a public key to the terminal. You can use a redirect to write it to a file.

	Add a public key to your keying
	* $(spell gpg --import KEYFILE)${AZRIEL}

	Encrypt a file using a key on your keyring
	* $(spell gpg -e -r "RECIPIENT" INPUTFILE)${AZRIEL}
	* The RECIPIENT can be either the name or the email address that appears in the 'uid' section when you list the keys on your keyring.
	* If you know that the recipient has your public key on his or her keyring, you can add an $(alt \-s)${AZRIEL} parameter to "sign" the encrypted file. Signing is like a two-step encryption: the file is first encrypted with the recipient's public key, then it is encrypted with your _private_ key. That means that the recipient needs to decrypt it using your _public_ key, then using their own private key. "Signing" tells the recipient that the file is really from you and not from someone else because when he or she attempts to decrypt it using your public key, it will only work if it was encrypted using your private key, and the only person who should ever have your private key is you!
	
	Decrypt a file using a key on your keyring
	* $(spell gpg -d INPUTFILE)${AZRIEL}
	* This was easier than encrypting a file. You didn't have to specify which key to use because $(spell gpg)${AZRIEL} automatically tries all of the keys on your keyring!
	* This will write the decrypted content to your terminal, so be sure to use a redirect if you want to write it to a file. (This is very important if the file is large.)

	${FLAVIUS}Oh, but that was a lot of material. Be sure to use $(spell lessons)${FLAVIUS} to review all of these invocations. (You might want to pipe its output to $(spell grep)${FLAVIUS} and use $(spell grep)${FLAVIUS} to just search for lessons that include the word $(alt gpg)${FLAVIUS}.)

	${FLAVIUS}You probably had better practice this just a bit. Try each of these tasks:

	1. Generate a key pair
	2. List your public keys
	3. List your private keys
	4. Export your public key and write it to a file
	5. Encrypt the file $(alt plain.txt)${FLAVIUS} (for your own key)
	6. $(spell cat)${FLAVIUS} the encrypted file to get a sense of what encrypted files look like
	7. Decrypt the file you just encrypted

	$CONTINUE
	EOF

	learned 'gpg --gen-key'
	learned 'gpg --list-keys'
	learned 'gpg --list-public-keys'
	learned 'gpg --export -a USERNAME'
	learned 'gpg --import KEYFILE'
	learned 'gpg -e -r RECIPIENT FILE'
	learned 'gpg -d FILE'

	wrap <<-EOF
	${SPEECH}You've just received a lot of instruction. Use $(spell lessons) to see the list of spells and techniques you've learned.

	You should really practice using $(spell gpg). Here are the tasks that Flavius said you should try:

	1. Generate a key pair
	2. List your public keys
	3. List your private keys
	4. Export your public key and write it to a file
	5. Encrypt the file $(alt plain.txt) (for your own key)
	6. $(spell cat) the encrypted file to get a sense of what encrypted files look like
	7. Decrypt the file you just encrypted
	EOF
}

tutorial
