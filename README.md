## Getting Started

### Downloading

You have two options for downloading:

* In a terminal: `git clone --depth 1 git@github.com:entrity/Spell-Quest.git` \
(or)
* Save and then unzip the file at https://github.com/entrity/Spell-Quest/archive/master.zip

**Download**

![Download tutorial](https://i.imgur.com/H0oORB3.gif)

**Extract**

![Extract tutorial](https://i.imgur.com/QHBNnqO.gif)

### Running

In your terminal:

```bash
cd Spell-Quest || cd $HOME/Downloads/Spell-Quest-master; ./start.sh
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
