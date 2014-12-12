
/*
 * Most of this is from the OSDev wiki, except of course translated from
 *  NASM to GAS syntax, and I modified the string to align with line
 *  length on VirtualBox, so the ``marching letters''
 *  effect isn't present. And I added a BIOS delay IVT call (int $0x15)
 *  between printing each char so I don't burn a ridiculous number of
 *  clock cycles
 *
 *  Worth noting that, unlike in NASM, the linker must handle any
 *    relocations, so remember all of this is happening at 0x7c00 (at
 *    least for the moment, and of course initially)
 */

  .globl _start
  .code16
_start:
  .text
  jmp Start
str:
  /* from what I can tell, the screen's 57 chars wide, so 3*19 chars
   *  is precisely one line. I know that's not how the code below
   *  behaves, and I'm also aware that this should be determined via
   *  another int $0x10 call. */
  .ascii "Hello World!       "
str_end:

Start:  mov $0x0002,%bx
        mov $1,%cx
        xor %dx,%dx
        mov %dx,%ds
        cld

Print:  mov $str,%si

Char:   mov $0x2,%ah
        int $0x10
        lodsb

        mov $0x9,%ah
        int $0x10
Wait:   
        push %ax
        push %cx
        push %dx
        mov $0x86,%ah
        /* each tick is 1 us, so 200,000 (0x00030d40) is
         *    0.2 seconds, or 5 chars / second */
        mov $0x0003,%cx
        mov $0x0d40,%dx 
        int $0x15
        pop %dx
        pop %cx
        pop %ax

        inc %dl

        cmp %dl,80
        jne Skip
        xor %dl,%dl
        inc %dh

        cmp %dh,25
        jne Skip
        xor %dh,%dh


Skip:   cmp $str_end,%si
        jne Char
        jmp Print














