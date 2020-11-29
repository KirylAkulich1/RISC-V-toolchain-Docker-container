#!bin/bash
RISCV=/opt/riscv
cd riscv-gnu-toolchain   
mkdir build 
cd build 
#parametrize
echo "$1"
echo "$2"
../configure --prefix=/opt/riscv --with-arch=$1 --with-abi=$2
make
#./configure --prefix=$RISCV --disable-linux --with-arch=rv64ima

git clone https://github.com/riscv/riscv-tests 
cd riscv-tests 
git submodule update --init --recursive
#autoconf
#./configure --prefix=$RISCV/target
#make
#make install