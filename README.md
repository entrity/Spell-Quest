## Getting Started

### Downloading

![Download tutorial](https://duck-of-doom.com/download.gif)

(You can download the zip file, as demonstrated in the screencap above, your you can clone this repository with `git`:


```bash
git clone --depth 1 git@github.com:entrity/Spell-Quest.git
```

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

```b  ash
cd Downloads # or wherever you downloaded the zip file
unzip Spell-Quest-master.zip
Spell-Quest-master/start.sh
```

![Terminal tutorial](https://duck-of-doom.com/terminal2.gif)

## Lessons

| | 1 | 2 | 3 |
| - | - | - | - |
| Transmutation | mv, rm, rmdir | cut, sort | sed |
| Teleportation | cd, ln | | ssh |
| Divination | ls, pwd, cat | find, grep, less |
| Conjuration | mkdir, curl, wget, seq |
| Illusion | 
| Obfuscation | base64 | openssl | gpg |


## Techniques

* pipe
* redirects
* for loops (with seq)
* ./../~

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
