FROM ubuntu:latest
RUN apt-get update 
RUN apt-get install -y git

RUN sudo apt install build-essential
RUN apt-get install -y cmake
RUN apt-get install -y libboost-all-dev
RUN apt-get install -y gcc-10 && apt-get install g++-10
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 100 --slave /usr/bin/g++ g++ /usr/bin/g++-10 --slave /usr/bin/gcov gcov /usr/bin/gcov-10

RUN git clone --recursive https://github.com/MIPT-ILab/mipt-mips.git
RUN apt-get install ninja-build
RUN mkdir build && cd build
RUN cmake /mipt-mips/simulator -G "Ninja"
RUN ninja
COPY "run_tests.sh" "/"
ENTRYPOINT [ "run_tests.sh" ]