FROM ubuntu:18.04
ENV RISCV=/opt/riscv32
RUN apt-get update 
RUN apt-get install -y git
RUN apt install tree
RUN apt-get install -y autoconf automake autotools-dev curl python3 libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev 
RUN  git clone --recursive https://github.com/riscv/riscv-gnu-toolchain
WORKDIR "/riscv-gnu-toolchain"
#WORKDIR "/riscv-gnu-toolchain/build" 
RUN ./configure --prefix=/opt/riscv --with-arch=rv32g --with-abi=ilp32d
RUN make linux
WORKDIR "/"
#RUN rm -rf riscv-gnu-toolchain

#COPY "entrypoint.sh" "/"



