# CMA: Kernel Module for Contiguous Memory Allocation

This is a fork from http://git.edi.lv/rihards.novickis/FPSoC_Linux_drivers

Copyright (c) 2017 Institute of Electronics and Computer Science (EDI), Latvia. 

Copyright (c) 2018-2019 Liangfu Chen

Licensed under [MIT License](https://opensource.org/licenses/MIT)

## Introduction

This repository contains a Linux kernel module implementation for contiguous memory allocation.
Both cached and non-cached memory allocation has been supported.

## Installation

Cross compile toolchains are required to build the kernel module.

The following example assumes SYSROOT folder name `arm-linux-gnueabihf` exists under the toolchain directory, and setup the environment varilables for cross compilation targeting ARM based Linux systems.

```bash
### cross compile for Cyclone V linux
export TOOLCHAIN_ROOT=<your-toolchain-root>
export PATH=${TOOLCHAIN_ROOT}/bin:$PATH
export LD_LIBRARY_PATH=${TOOLCHAIN_ROOT}/arm-linux-gnueabihf/lib:$LD_LIBRARY_PATH
export ARCH=arm
export CROSS_COMPILE=${TOOLCHAIN_ROOT}/bin/arm-linux-gnueabihf-
export CC=${CROSS_COMPILE}gcc
export CXX=${CROSS_COMPILE}g++
export SYSROOT="${TOOLCHAIN_ROOT}/arm-linux-gnueabihf"
```

Then it's good to build the kernel model `cma.ko` with a simple make command.

## Getting Started

The following example shows how to allocate and release contiguous memory.

```c
#include <stdio.h>
#include <cma_api.h>

int main() {
  // initialize /dev/cma device
  cma_init();
  
  // allocate contiguous memory
  void * ptr = cma_alloc(256, CMA_ALLOC_CACHED);
  
  // get physical address and print it out
  unsigned phy_addr = cma_get_phy_addr(ptr);
  printf("cached address: 0x%x\n", phy_addr);
  
  // release memory
  cma_free(ptr);
}
```
