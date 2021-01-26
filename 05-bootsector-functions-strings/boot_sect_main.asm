[org 0x7c00] ; tell asm that our offset is nootsector code

; the main routine makes sure the parameters are ready and then calls the function
mov bx, HELLO
call print

call print_nl

mov bx, GOODBYE
call print

call print_nl

mov dx, 0x12fe
call print_hex

; hang !
jmp $

; include subroutines bellow the hang
%include "boot_sect_print.asm"
%include "boot_sect_print_hex.asm"

; data
HELLO:
    db 'Hello, World', 0

GOODBYE:
    db 'Goodbye', 0

; finalize
times 510-($-$$) db 0
dw 0xaa55