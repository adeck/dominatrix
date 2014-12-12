
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
  jmp init
prompt_str:
  .ascii "trix >"
prompt_str_end:


init:
        call print_prompt
loop:
        call wait
        call read
        or %ah,%ah
        je loop
        call eval
        jmp init

print_prompt: 
        /* mov $0x0000,%dx */
        xor %dx,%dx
        mov %dx,%es  /* apparently, segment registers can only be
                      *   set by weird, special instructions or by
                      *   copying from a general register. So, since
                      *   %dx happens to be null already...
                      */
        /* because "trix >" is six characters */
        mov $0x0006,%cx
        mov $prompt_str,%bp
        call print
        ret

/*  dh, dl -- row and column
 *  cx -- string length
 *  es:bp -- pointer to string
 */
print:
        /* chars only, move cursor */
        mov $0x1301,%ax
        /* page 0, bgcolor 0 (black), color 2 (green) */
        mov $0x0002,%bx
        int $0x10
        ret


/* doesn't modify any registers */
wait:   
        push %ax
        push %cx
        push %dx
        mov $0x86,%ah
        /* each tick is 1 us, so 200,000 (0x00030d40) is
         *    0.2 seconds, or 5 chars / second
         */
        mov $0x0003,%cx
        mov $0x0d40,%dx 
        int $0x15
        pop %dx
        pop %cx
        pop %ax
        ret

/* TODO */
read:   mov 0,%ah
        ret

/* TODO */
eval:   ret


