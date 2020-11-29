## Getting Started

### Downloading
[Download the zip file](https://github.com/entrity/Spell-Quest/archive/master.zip)

![Download tutorial](https://duck-of-doom.com/spell-quest/download.gif)

* [Running on MacOS](#running-on-macos)
* [Running on Windows](#running-on-windows)
* [Running on Linux](#running-on-linux)

### Running on MacOS

![Startingfoo](https://duck-of-doom.com/spell-quest/start-macos2.gif)

1. Using Finder, look in your Downloads folder.
2. Double-click the `Spell-Quest-master.zip` file.
3. Look inside the newly extracted `Spell-Quest-master` folder.
4. Two-finger click the `start.command` file (or on the `restart.command` file if you want to restore your game from the beginning.)
5. Select 'Open' from the newly opened context menu.
6. This will open a terminal running the Spell-Quest game. Start reading the instructions! (Press <kbd>Cmd</kbd>+<kbd>+</kbd> to increase the size of the window. Use the arrow keys or <kbd>u</kbd>/<kbd>d</kbd> to move up and down.)

### Running on Windows

#### First time:
A Windows setup requires the most work, but it won't require you to do anything dangerous or technically challenging. It consists of:

1. Installing "Windows Subsystem for Linux (WSL)" from the Microsoft Store
2. Starting your WSL terminal for the first time and creating a user account
3. Downloading and extracting the "Spell Quest" [zip file](https://github.com/entrity/Spell-Quest/archive/master.zip).

Step one: install WSL

![Install WSL](https://duck-of-doom.com/spell-quest/wsl-install.gif)

1. Press the "Windows" key; type "store"; click on "Microsoft Store"
2. Search for "Ubuntu"; click on it
3. Click on Get or Download or Install
4. (Sign in to your Microsoft account if necessary)

Step two: set up your Ubuntu environment

![Install WSL](https://duck-of-doom.com/spell-quest/wsl-open-terminal.gif)

![Install WSL](https://duck-of-doom.com/spell-quest/wsl-create-user.gif)

1. Press the "Windows" key; type "Ubuntu"; click on "Ubuntu." (Ubuntu is one flavour of Linux. It has more "help" pages online than other flavours.)
2. A terminal will appear. It will say it's installing. Wait for a few minutes.
3. The terminal will prompt you to enter a username. Pick a username and enter it.
4. The terminal will prompt you to enter a password. The password will _NOT_ appear as you type it. Just go ahead and type it, then hit Enter.
5. Re-enter the same password to continue.
6. Remember this password. When the Linux (Ubuntu) terminal asks you for your password in future, this is the password that it will want.

Step three: extract the Spell-Quest zip file

![Install WSL](https://duck-of-doom.com/spell-quest/wsl-extract.gif)

1. Open File Explorer
2. Open "Downloads"
3. Click on "Spell-Quest-master.zip"; click "Extract"; click "Extract all"; approve the destination path.

#### Every time:

![Run on Windows Susbsystem for Linux](https://duck-of-doom.com/spell-quest/start-windows.gif)

1. Open "File Explorer"
2. Navigate to where you extracted the Spell-Quest files from `Spell-Quest-master.zip` (by default, this would be in Downloads > Spell-Quest-master
3. Double-click on the `start` file that has a gear icon. (Its true name is `start.bat`, but Windows tends to hide the filename's extension.)
4. (If prompted for a password, it's because the system wants to install dependencies. Type the password that you decided when you created a user in step 4 of **set up your Ubuntu environment**, described above. As before, the password will _NOT_ appear as you type it. Just type it and hit <kbd>Enter</kbd>.)

### Running on Linux

In your terminal:

```bash
# If this is your first time setting up the game,
# make sure you have the dependencies installed:
sudo apt install -y python unzip wget curl openssl
``` 

```bash
cd Downloads # or wherever you downloaded the zip file
unzip Spell-Quest-master.zip
Spell-Quest-master/start.sh
```

## Lessons

| | 1 | 2 | 3 |
| - | - | - | - |
| Transmutation | mv, rm, rmdir, chmod | cut, sort, head, tail | sed |
| Teleportation | cd, ln, mv | | ssh, scp, sftp, sshfs |
| Divination | ls, pwd, cat, man, read | find, grep, less |
| Conjuration | mkdir, curl, wget, seq, cp |
| Illusion | echo, alias, printf |
| Obfuscation | base64 | openssl | gpg |


## Techniques

* tab-completion
* pipe `|`
* redirects `>>`, `>`, `<`, `<<<`
* `for` loops
* `while` loops
* `if ...; then ...; fi`
* `.`/`..`/`~`
* variables
* regular expressions
* capturing groups with `sed`
* subshell

### BMP

32-bit has bgra pixels

```
ffmpeg -i src.png dst.bmp
```

https://commons.wikimedia.org/wiki/Category:Drawings_of_unicorns
https://en.wikipedia.org/wiki/BMP_file_format

```
# Get bytes 10-13 as uint. it should be the offset of the bmp body
xxd -s 10 
od -j 10 -N 4 -t d4 # unsigned 4-byte int, skip ahead 10 bytes
```

## ASCII art referenced from:

* https://www.oocities.org/spunk1111
* https://www.asciiart.eu
