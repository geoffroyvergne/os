[org 0x7c00]
KERNEL_OFFSET equ 0x1000 ; the same one we used when linking the kernel

    mov [BOOT_DRIVE], dl ; the BIOS sets us the boot drive in 'dl' on boot
    mov bp, 0x9000
    mov sp, bp

    mov bx, MSG_REAL_MODE
    call print
    call print_nl

    call load_kernel ; read the kernel from disk
    call switch_to_pm
    jmp $ ; never executed

%include "boot/print.asm"
%include "boot/print_hex.asm"
%include "boot/disk.asm"
%include "boot/gdt.asm"
%include "boot/32bit_print.asm"
%include "boot/switch_pm.asm"

[bits 16]
load_kernel:
    mov bx, MSG_LOAD_KERNEL
    call print
    call print_nl

    mov bx, KERNEL_OFFSET ; read from disk and store in 0x1000
    mov dh, 16 ; our futur kernel will be larger, make this big
    mov dl, [BOOT_DRIVE]
    call disk_load
    ret

[bits 32]
BEGIN_PM:
    mov ebx, MSG_PROT_MODE
    call print_string_pm
    call KERNEL_OFFSET ; give control to the kernel
    jmp $ ; stay here when the kernel returns control to us (if ever)

BOOT_DRIVE db 0 ; it is a good idea to store it in memory because 'dl' may get overwritten
MSG_REAL_MODE db "Started in 16-bit Real Mode", 0
MSG_PROT_MODE db "Landed in 32-bit Protected Mode", 0
MSG_LOAD_KERNEL db "Loading kernel into memory", 0

; padding
times 510 - ($-$$) db 0
dw 0xaa55
