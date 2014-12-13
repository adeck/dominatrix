trix
==========

A UNIX-like operating system with bootloader

But right now...
----------------

...It's just a simple bootloader.
Currently, my focus for this project is on:
- making a simple interactive REPL for the bootloader,
- storing config information on the first few sectors of the drive,
- scanning the drive for potentially viable operating systems and branching to them,
- configuring hardware, and (of course)
- entering a more conventional operating mode (in preparation for more traditional operating system operation).

The bootloader itself is all assembly thus far, but once I've reverse-engineered the BIOS interrupt routines (which I'll do by copying the BIOS from 0xFFFF0000 --> 0xFFFFFFFF onto some free drive sectors and then disassembling) I'll be able to easily transition to C or C++. OTOH, I'll only see transitioning to an HLL as necessary IFF the bootloader starts to bloat to >2 KB.

