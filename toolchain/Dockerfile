FROM ubuntu:18.04
ENV RISCV=/opt/riscv
RUN apt-get update 
RUN apt-get install -y git
RUN apt install tree
RUN apt-get install -y autoconf automake autotools-dev curl python3 libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev 
RUN  git clone --recursive https://github.com/riscv/riscv-gnu-toolchain
RUN mkdir /riscv-gnu-toolchain/build 
WORKDIR  /riscv-gnu-toolchain/build
ARG with_arch
ARG with_abi=abi
RUN ../configure --prefix=/opt/riscv --with-arch=${arch} --with-abi=${with_abi}
RUN make 
RUN export PATH=/opt/riscv/bin:$PATH
RUN mkdir build 
RUN cd build 
RUN ../configure --prefix=/opt/riscv --with-arch=$1 --with-abi=$2
RUN make && make install 

WORKDIR /
VOLUME [ "/tests" ]
RUN clone https://github.com/riscv/riscv-tests
RUN cd riscv-tests
RUN git submodule update --init --recursive
RUN autoconf
RUN ./configure --prefix=/opt/riscv/target
COPY patch.txt /riscv-tests/
RUN git apply patch.txt
RUN make
RUN make install
RUN cp -avf /riscv-tests/benchmarks /tests/
RUN cp -avf  /riscv-tests/isa /tests/
