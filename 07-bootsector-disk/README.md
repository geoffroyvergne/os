# 07-bootsector-disk

nasm -f bin boot_sect_main.asm -o bin/boot_sect_main.bin
qemu-system-x86_64 bin/boot_sect_main.bin