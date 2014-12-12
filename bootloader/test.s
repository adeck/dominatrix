
/*
 * Most of this is copied verbatim from the OSDev wiki, except I modified
 *  the string to align with line length, so the ``marching letters''
 *  effect isn't present. And I added a BIOS delay IVT call (int $0x15)
 *  between printing each char so I don't burn a ridiculous number of
 *  clock cycles
 */

  .globl _start
  .code16
_start:
  .text
  jmp Start
str:
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














