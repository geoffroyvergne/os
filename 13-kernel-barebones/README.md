# 13-kernel-barebones

## build the kernel
/usr/local/i386elfgcc/bin/i386-elf-gcc -ffreestanding -c kernel.c -o kernel.o
nasm kernel_entry.asm -f elf -o kernel_entry.o

## linker
/usr/local/i386elfgcc/bin/i386-elf-ld -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o --oformat binary

## bootsector
nasm bootsect.asm -f bin -o bootsect.bin

## putting all together
cat bootsect.bin kernel.bin > os-image.bin

## run
qemu-system-i386 -fda os-image.bin

## Makefile

make
make clean
