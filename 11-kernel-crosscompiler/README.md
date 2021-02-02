# 11-kernel-crosscompiler

# install tools

## gcc
brew install gcc

export CC=/usr/local/Cellar/gcc/10.2.0_3/bin/gcc-10
export LD=/usr/local/Cellar/gcc/10.2.0_3/bin/gcc-10
export PREFIX="/usr/local/i386elfgcc"
export TARGET=i386-elf
export PATH="$PREFIX/bin:$PATH"

## binutils
curl -O http://ftp.gnu.org/gnu/binutils/binutils-2.36.tar.gz
tar zxvf binutils-2.36.tar.gz
mkdir binutils-build
cd binutils-build
../binutils-2.36/configure --target=$TARGET --enable-interwork --enable-multilib --disable-nls --disable-werror --prefix=$PREFIX 2>&1 | tee configure.log
make all install 2>&1 | tee make.log

## gcc
curl -O https://ftp.gnu.org/gnu/gcc/gcc-10.2.0/gcc-10.2.0.tar.gz
tar zxvf gcc-10.2.0.tar.gz
mkdir gcc-build
cd gcc-build

../gcc-10.2.0/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --disable-libssp --enable-languages=c --without-headers \
--with-gmp=/usr/local/Cellar/gmp/6.2.1 --with-mpfr=/usr/local/Cellar/mpfr/4.1.0 --with-mpc=/usr/local/Cellar/libmpc/1.2.1

make all-gcc 
make all-target-libgcc 
make install-gcc 
make install-target-libgcc 

ls /usr/local/i386elfgcc/bin
make all-target-libgcc

## gdb
curl -O http://ftp.rediris.es/mirror/GNU/gdb/gdb-10.1.tar.gz  
tar zxvf gdb-10.1.tar.gz
mkdir gdb-build
cd gdb-build
../gdb-10.1/configure --target="$TARGET" --prefix="$PREFIX" --program-prefix=i386-elf-
make
make install
