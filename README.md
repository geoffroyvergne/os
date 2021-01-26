# os from scratch
https://github.com/cfenollosa/os-tutorial
https://wiki.osdev.org/Main_Page

## environment

brew install qemu nasm

## simple boot sector

### compile
nasm -f bin boot_sect_simple.asm -o bin/boot_sect_simple.bin

### run
qemu-system-x86_64 bin/boot_sect_simple.bin

## boot sector print
nasm -f bin boot_sect_hello.asm -o bin/boot_sect_hello.bin
qemu-system-x86_64 bin/boot_sect_hello.bin

## boot sector memory
nasm -f bin boot_sect_memory_org.asm -o bin/boot_sect_memory_org.bin
qemu-system-x86_64 bin/boot_sect_memory_org.bin

## boot sector stack
nasm -f bin boot_sect_stack.asm -o bin/boot_sect_stack.bin
qemu-system-x86_64 bin/boot_sect_stack.bin

## bootsector functions strings
