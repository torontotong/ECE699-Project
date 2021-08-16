/*
 * The MIT License (MIT)
 *
 * COPYRIGHT (C) 2017 Institute of Electronics and Computer Science (EDI), Latvia.
 * AUTHOR: Rihards Novickis (rihards.novickis@edi.lv)
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

/*!
 *  Copyright (c) 2018 by Contributors
 * \file cma_api.cc
 * \brief Application layer implementation for contigous memory allocation.
 */

#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <unistd.h>

#include "cma_api.h"

#ifndef CMA_IOCTL_MAGIC
#define CMA_IOCTL_MAGIC 0xf2
#endif

#define CMA_ALLOC_CACHED _IOC(_IOC_WRITE | _IOC_READ, CMA_IOCTL_MAGIC, 1, 4)
#define CMA_ALLOC_NONCACHED _IOC(_IOC_WRITE | _IOC_READ, CMA_IOCTL_MAGIC, 2, 4)
#define CMA_FREE _IOC(_IOC_WRITE, CMA_IOCTL_MAGIC, 3, 4)
#define CMA_GET_PHY_ADDR _IOC(_IOC_WRITE | _IOC_READ, CMA_IOCTL_MAGIC, 4, 4)
#define CMA_GET_SIZE _IOC(_IOC_WRITE | _IOC_READ, CMA_IOCTL_MAGIC, 5, 4)
#define CMA_SET_WRITE_TARGET_ADDR _IOC(_IOC_WRITE | _IOC_READ, CMA_IOCTL_MAGIC, 6, 4)
#define CMA_GET_READ_SRC_ADDR _IOC(_IOC_WRITE | _IOC_READ, CMA_IOCTL_MAGIC, 7, 4)


#define CMA_IOCTL_MAXNR 5

#ifndef CMA_DEBUG
#define CMA_DEBUG 1
#endif
#ifndef DRIVER_NODE_NAME
#define DRIVER_NODE_NAME "cma"
#endif

#if CMA_DEBUG == 1
#define __DEBUG(fmt, args...) printf("CMA_API_DEBUG: " fmt, ##args)
#else
#define __DEBUG(fmt, args...)
#endif

#define ROUND_UP(N, S) ((((N) + (S)-1) / (S)) * (S))

/* Private functions */
void* cma_alloc(size_t size, unsigned ioctl_cmd);

/* Global file descriptor */
int cma_fd = 0;

int cma_init(void) {
  __DEBUG("Opening \"/dev/" DRIVER_NODE_NAME "\" file\n");

  cma_fd = open("/dev/" DRIVER_NODE_NAME, O_RDWR);
  if (cma_fd == -1) {
    __DEBUG("Failed to initialize api - \"%s\"\n", strerror(errno));
    return -1;
  }

  return 0;
}

int cma_release(void) {
  __DEBUG("Closing \"/dev/" DRIVER_NODE_NAME "\" file\n");

  if (close(cma_fd) == -1) {
    __DEBUG("Failed to finilize api - \"%s\"\n", strerror(errno));
    return -1;
  }

  return 0;
}

void* cma_alloc_cached(size_t size) { return cma_alloc(size, CMA_ALLOC_CACHED); }

void* cma_alloc_noncached(size_t size) { return cma_alloc(size, CMA_ALLOC_NONCACHED); }

int cma_free(void* mem) {
  __DEBUG("Releasing contigous memory from 0x%llx\n", (unsigned long)mem);
  unsigned long data, v_addr;

  /* save user space pointer value */
  data = (unsigned long)mem;
  v_addr = (unsigned long)mem;

  if (ioctl(cma_fd, CMA_GET_SIZE, &data) == -1) {
    __DEBUG("cma_free - ioctl command unsuccsessful - 0\n");
    return -1;
  }
  /* data now contains size */

  /* unmap memory */
  munmap(mem, data);

  /* free cma entry */
  if (ioctl(cma_fd, CMA_FREE, &v_addr) == -1) {
    __DEBUG("cma_free - ioctl command unsuccsessful - 1\n");
    return -1;
  }

  return 0;
}

unsigned long cma_get_phy_addr(void* mem) {
  unsigned long data;
  __DEBUG("Getting physical address from 0x%llx\n", (unsigned long)mem);

  /* save user space pointer value */
  data = (unsigned long)mem;

  /* get physical address */
  if (ioctl(cma_fd, CMA_GET_PHY_ADDR, &data) == -1) {
    __DEBUG("cma_get_phy_addr - ioctl command unsuccsessful\n");
    return 0;
  }
  /* data now contains physical address */

  __DEBUG("cma_get_phy_addr(0x%llx) return physical address:0x%llx \n", mem, data);
  return data;
}

void* cma_alloc(size_t size, unsigned ioctl_cmd) {
  unsigned long data;
  void* mem;
  __DEBUG("Allocating 0x%x bytes of contigous memory\n", size);

  /* Page align size */
  size = ROUND_UP(size, getpagesize());

  /* ioctl cmd to allocate contigous memory */
  data = (unsigned long)size;
  __DEBUG("ioctl cmd 0x%x to allocate contigous memory for %d bytes\n", ioctl_cmd, data);
  if (ioctl(cma_fd, ioctl_cmd, &data) == -1) {
    __DEBUG("cma_alloc - ioctl command unsuccsessful\n");
    return NULL;
  }

  /* at this point phy_addr is written to data */

  /* mmap memory */
  __DEBUG("mmap memory size:%d, data:0x%x \n", size, data);
  mem = mmap(NULL, size, PROT_WRITE | PROT_READ, MAP_SHARED, cma_fd, data);
  __DEBUG("mmap memory returned 0x%llx \n", mem);
  if (mem == MAP_FAILED) {
    __DEBUG("cma_alloc returned 0x%x - mmap unsuccsessful\n", mem);
    return NULL;
  }
  return mem;
}

/* ECE699 ==> */
int cma_memcpy_from_host(void* dst, const void* src, size_t size){
  unsigned long data;
  data = dst;
  if (ioctl(cma_fd, CMA_SET_WRITE_TARGET_ADDR, &data) == -1) {
    __DEBUG("cma_memcpy_to_vta - ioctl CMA_SET_WRITE_TARGET_ADDR unsuccsessful\n");
    return -1;
  }
  write(cma_fd, src, size);
  return 0;
}

int cma_memcpy_to_host(void* dst, const void* src, size_t size){
  unsigned long data;
  data = src;
  __DEBUG("cma_memcpy_to_vta - ioctl CMA_GET_READ_SRC_ADDR for birtual addr 0x%llx \n", data);
  if (ioctl(cma_fd, CMA_GET_READ_SRC_ADDR, &data) == -1) {
    __DEBUG("cma_memcpy_to_vta - ioctl CMA_GET_READ_SRC_ADDR unsuccsessful\n");
    return -1;
  }    
  read(cma_fd, dst, size);
  return 0;
}

/* <== ECE699 */
