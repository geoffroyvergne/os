[bits 32]
[extern main] ; define calling point. must have same as kernel.c 'main' function
call main ; calls the C function. the linker will know where it is placed in memory
jmp $
