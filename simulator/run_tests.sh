#!bin/bash
files=$(ls /tests/benchmarks -a | grep  "\.riscv$")
echo $files
for file in $files
do
        echo "*** ${file} ***"
        /mipt-mips/build/mipt-mips  -b /tests/benchmarks/$file  -I riscv64        
done