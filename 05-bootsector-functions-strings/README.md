# 05-bootsector-functions-strings

cd 05-bootsector-functions-strings
nasm -f bin boot_sect_main.asm -o bin/boot_sect_main.asm
qemu-system-x86_64 bin/boot_sect_main.asm