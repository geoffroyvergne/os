[org 0x7c00] ; bootloader offset
    mov bp, 0x9000 ; set the stack
    mov sp, bp

    mov bx, MSG_REAL_MODE
    call print ; this will be written after BIOS messages

    call switch_to_pm
    jmp $ ; this actually be never executed

%include "../05-bootsector-functions-strings/boot_sect_print.asm"
%include "../32bit-gdt.asm"
%include "../32bit-print.asm"
%include "32bit-switch.asm"

[bits 32]
BEGIN_PM:  ; after the switch we will get here
    mov ebx, MSG_PROT_MODE
    call print_string_pm ; note that this will be written at the top left corner
    jmp $

MSG_REAL_MODE db "Start in 16-bit real mode", 0
MSG_PROT_MODE db "Loaded 32-bit protected mode", 0

; bootsector
times 510-($-$$) db 0
dw 0xaa55
