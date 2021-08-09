export TOOLCHAIN_ROOT=/home/tliu/UW/ECE699/gcc-linaro-7.2.1-2017.11-x86_64_aarch64-linux-gnu
export PATH=${TOOLCHAIN_ROOT}/bin:$PATH
export LD_LIBRARY_PATH=${TOOLCHAIN_ROOT}/aarch64-linux-gnu/lib64:${TOOLCHAIN_ROOT}/aarch64-linux-gnu/libc/lib:$LD_LIBRARY_PATH
export ARCH=arm64
export CROSS_COMPILE=${TOOLCHAIN_ROOT}/bin/aarch64-linux-gnu-
export CC=${CROSS_COMPILE}gcc
export CXX=${CROSS_COMPILE}g++
export SYSROOT="${TOOLCHAIN_ROOT}/aarch64-linux-gnu"

