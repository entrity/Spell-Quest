## Getting Started

### Downloading

![Download tutorial](https://duck-of-doom.com/download.gif)

### Running on MacOS

![Startingfoo](https://duck-of-doom.com/start-macos2.gif)

1. Using Finder, look in your Downloads folder.
2. Double-click the `Spell-Quest-master.zip` file.
3. Look inside the newly extracted `Spell-Quest-master` folder.
4. Two-finger click the `start.command` file (or on the `restart.command` file if you want to restore your game from the beginning.)
5. Select 'Open' from the newly opened context menu.
6. This will open a terminal running the Spell-Quest game. Start reading the instructions! (Use the arrow keys or <kbd>u</kbd>/<kbd>d</kbd> to move up and down)

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
