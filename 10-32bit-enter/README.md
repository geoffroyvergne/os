# 10-32bit-enter

nasm -f bin 32bit-main.asm -o bin/32bit-main.bin
qemu-system-x86_64 bin/32bit-main.bin