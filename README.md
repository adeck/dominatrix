trix
==========

A UNIX-like operating system with bootloader

But right now...
----------------

...It's just a simple bootloader.
Currently, my focus for this project is on:
- making a simple interactive REPL for the bootloader,
- storing config information on the first few sectors of the drive,
- scanning the drive for potentially viable operating systems and branching to them (at the moment I'd only be looking to support the multiboot spec. as it applies to ELF),
- graphics (just a bit),
- networking (Y'know what's cooler than having a bootloader? Having a bootloader that can negotiate a DHCP lease and, if desired, boot an O/S over the network),
- configuring hardware, and (of course)
- entering a more conventional operating mode (in preparation for more traditional operating system operation).

The bootloader itself is all assembly thus far, but once I have a large enough corpus of assembly subroutines / procedures to make subsequent development in C not require constantly switching between assembly and C, then the cross compilation may begin.

