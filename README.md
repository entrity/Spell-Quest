## Getting Started

### Downloading

You have two options for downloading:

1. Save and then unzip the file at https://github.com/entrity/Spell-Quest/archive/master.zip
2. In a terminal: `git clone --depth 1 git@github.com:entrity/Spell-Quest.git`

### Running on Mac OS

Double-click the `start.command` file (or the `restart.command` file, since they both do the same thing on your first execution).

If this doesn't work because of a lack of permissions to execute a file downloaded from the internet, open a **Terminal** (from your Applications), then follow the instructions listed under **Linux** below.

### Running on Linux

In your terminal:

```bash
cd Spell-Quest || cd $HOME/Downloads/Spell-Quest-master
./start.sh
```

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
