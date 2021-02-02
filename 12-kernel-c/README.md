# 12-kernel-c

## compile
/usr/local/i386elfgcc/bin/i386-elf-gcc -ffreestanding -c function.c -o bin/function.o
/usr/local/i386elfgcc/bin/i386-elf-objdump -d bin/function.o

## link
/usr/local/i386elfgcc/bin/i386-elf-ld -o bin/function.bin -Ttext 0x0 --oformat binary bin/function.o

## decompile
ndisasm -b 32 bin/function.bin