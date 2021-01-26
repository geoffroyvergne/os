[org 0x7c00]
mov ah, 0x0e

; Solved the memory offset problem with 'org'
;mov al, "1"
;int 0x10
mov al, [the_secret]
int 0x10

jmp $ ; infinit loop

the_secret:
    db "X"

; zero padding and magic bios number
times 510-($-$$) db 0
dw 0xaa55
