![Print memory screen shot](https://user-images.githubusercontent.com/3808/131069348-f74a8ee2-414b-41bf-a1ec-1d5e8fbf3736.png)

Squanchy BASIC
==============
This is a version of Color BASIC for the Radio Shack Color Computer. It has been reassembled to be at the top of RAM on a 64K machine.

This will let BASIC programs be much larger than the stock ROMs allow.

The goal is to remain 100% compatible with Color BASIC programs. Except those programs that rely on any aspect of the internals of Color BASIC's implementation.

Build:
======
Use Make to build. Requires LWTools and Toolshed.

http://www.lwtools.ca
https://sourceforge.net/projects/toolshed/

Usage:
======
On a Color Computer (with 64K of RAM) or CoCo 3 type:
```RUN "SB"```
The computer will reboot to Squanchy BASIC.

Current progress:
=================
Color BASIC works after must testing. Starting the process to include Extended Color BASIC.

To Do List:
===========
1. ~~Test Color BASIC fully.~~
2. Add Extended Color BASIC
3. Add Disk BASIC
4. Modify ROM to be even more compact.
5. Fix Color BASIC bugs.


--
tim lindner
tlindner@macmess.org
