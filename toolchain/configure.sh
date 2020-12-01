#!bin/bash

arch=""
extentions=""
abi=""
echo "Choose Doker image name with downlod toolchain(6GB+)"
read docker_image_name
images=$(docker images -a | awk  '{print $1}' | grep '<nake_riscv_toolchain>')
echo $imges
if [ $imges == "" ]
    then 
        echo "Image exisits"
    else
    $(dockr build -t $docker_image_name .)
fi
echo "Choose architecture"
echo "1.rv32"
echo "2.rv64"
read architecture_input
if [ "$architecture_input" == "1" ]
then
    arch="rv32"
else
    arch="rv64"
fi

echo "Choose extention"
echo "1.(G)General"
echo "2.Custom"
read extention_input
if [ "$extention_input" == "1" ]
then
    extentions="g"
else
    echo "Allowed extentions"
    echo "(a)tomics"
    echo "(m)ultiplication and division"
    echo "(f)loat"
    echo "(d)ouble"
    read extentions
fi
with_arch="$arch$extentions"
echo $with_arch
echo "Choose ABI"
echo "Supported ABIs are ilp32 (32-bit soft-float)"
echo  "1)ilp32d (32-bit hard-float)" 
echo  "2)ilp32f (32-bit with single-precision in registers and double in memory, niche use only)" 
echo  "3)lp64 (same but with 64-bit long and pointers)"
echo  "4)lp64f (same but with 64-bit long and pointers)" 
echo  "5)lp64d (same but with 64-bit long and pointers)" 
read abi_choose
case $abi_choose in 
    "1")
    abi="ilp32d"
    ;;
    "2")
    abi="ilp32f"
    ;;
    "3")
    abi="lp64"
    ;;
    "4")
    abi="lp64f"
    ;;
    "5")
    abi="lp64d"
    ;;
