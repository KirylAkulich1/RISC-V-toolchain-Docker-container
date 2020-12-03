#!bin/bash
files=$(ls /tests/benchmarks -a | grep  "\.riscv$")
echo $files
for file in $files
do
        echo "*** ${file} ***"
        /mipt-mips/build/mipt-mips  -b /tests/benchmarks/$file  --isa riscv64 -d       
done

isa_files=$(ls /tests/benchmarks -a | grep  "[^\.dump]$")
for file in $isa_files
do
        echo "*** ${file} ***"
        /mipt-mips/build/mipt-mips  -b /tests/isa/$file  -isa riscv64 -n 800        
done