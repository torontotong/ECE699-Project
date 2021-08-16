/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 *
 * \file de10-nano_driver.cc
 * \brief VTA driver for DE10_Nano board.
 */

#include "de10pro_driver.h"
#include "de10pro_mgr.h"

#include <string.h>
#include <vta/driver.h>
#include <tvm/runtime/registry.h>
#include <dmlc/logging.h>
#include <thread>
#include <string>
#include "cma_api.h"

#define USE_MMAP 0    // 0: use linux driver read/write, 1: use memory mapping
static   void *stored_buf_vir_addr = 0;

void* VTAMemAlloc(size_t size, int cached) {
  unsigned long *return_ptr = NULL;
  printf("DE10pro_DRIVER::Calling De10pro::VTAMemAlloc\n");
  static int _ = cma_init(); (void)_;
  if (cached) {
    printf("DE10pro_DRIVER::Calling cma_alloc_cached size:%d\n", size);
    return_ptr = (unsigned long*)cma_alloc_cached(size);
    printf("DE10pro_DRIVER::cma_alloc_cached returned:0x%llx\n", return_ptr);
    return (void*)return_ptr;
  } else {
    printf("DE10pro_DRIVER::Calling cma_alloc_noncached() size:%d\n", size);
    return cma_alloc_noncached(size);
  }
}

void VTAMemFree(void* buf) {
  printf("DE10pro_DRIVER::Calling VTAMemFree\n");
  cma_free(buf);
}

vta_phy_addr_t VTAMemGetPhyAddr(void* buf) {
  vta_phy_addr_t ret_val;
  ret_val = cma_get_phy_addr(buf);
  printf("DE10pro_DRIVER::Calling VTAMemGetPhyAddr for addrss 0x%llx, return 0x%llx\n", buf, ret_val);

  return ret_val;//+0x80000000;
}

void VTAMemCopyFromHost(void* dst, const void* src, size_t size) {
  // For SoC-based FPGAs that used shared memory with the CPU, use memcopy()
  printf("\nDE10pro_DRIVER::VTAMemCopyFromHost from 0x%llx to 0x%llx for 0x%x bytes\n\n", src, dst, size);
  #if USE_MMAP
    memcpy(dst, src, size);
  #else
    cma_memcpy_from_host(dst, src, size);
  #endif
#if 1
  unsigned short* data_ptr = (unsigned short*)dst;
  unsigned int loop, offset;
  offset = 0;
  if ( size < 0x2000){
    while(offset < size){
      printf("0x%08llx: ", data_ptr);
      for ( loop = 0; loop < 8; loop++ ){
        printf("0x%04x ", *data_ptr++);
        offset+=2;
      }
      printf("\n");
    }
  }
#endif
}


void VTAMemCopyToHost(void* dst, const void* src, size_t size) {
  // For SoC-based FPGAs that used shared memory with the CPU, use memcopy()
  #if USE_MMAP
    memcpy(dst, src, size);
  #else
    cma_memcpy_to_host(dst, src, size);
  //if ( stored_buf_vir_addr!= 0)
  //  printf("\nDE10pro_DRIVER::VTAMemCopyToHost from 0x%llx to 0x%llx for 0x%x bytes\n\n", stored_buf_vir_addr, dst, size);
  //  cma_memcpy_to_host(dst, (void*)stored_buf_vir_addr, size);
  #endif
#if 1
  unsigned short* data_ptr = (unsigned short*)dst;
  unsigned int loop, offset = 0;
  if ( size < 0x2000){
    while(offset < size){
      printf("0x%08llx: ", data_ptr);
      for ( loop = 0; loop < 8; loop++ ){
        printf("0x%04x ", *data_ptr);
	      data_ptr++;
        offset+=2;
      }
      printf("\n");
    }
  }
#endif
}

void VTAFlushCache(void * offset, vta_phy_addr_t buf, int size) {
  CHECK(false) << "VTAFlushCache not implemented for de10pro";
  printf("DE10pro_DRIVER VTAFlushCache not implemented for de10pro\n");
}

void VTAInvalidateCache(void * offset, vta_phy_addr_t buf, int size) {
  CHECK(false) << "VTAInvalidateCache not implemented for de10pro";
  printf("DE10pro_DRIVER::VTAInvalidateCache not implemented for de10pro\n");
}

void *VTAMapRegister(uint64_t addr) {
  // Align the base address with the pages
  uint64_t virt_base = addr & ~(getpagesize() - 1);
  // Calculate base address offset w.r.t the base address
  uint64_t virt_offset = addr - virt_base;
  // Open file and mmap
  uint32_t mmap_file = open("/dev/mem", O_RDWR|O_SYNC);
  // Note that if virt_offset != 0, i.e. addr is not page aligned
  // munmap will not be unmapping all memory.
  void *vmem = mmap(NULL,
              (VTA_IP_REG_MAP_RANGE + virt_offset),
              PROT_READ|PROT_WRITE,
              MAP_SHARED,
              mmap_file,
              virt_base);
  close(mmap_file);
  //vmem = vmem + VTA_FETCH_ADDR;
  printf("DE10pro_DRIVER::Calling VTAMapRegister for addrss 0x%llx, return 0x%llx\n", addr, vmem);
  return vmem;
}

void VTAUnmapRegister(void *vta) {
  // Unmap memory
  //printf("DE10pro_DRIVER::Calling VTAUnmapRegister\n");
  int status = munmap(vta, VTA_IP_REG_MAP_RANGE);
  assert(status == 0);
}

void VTAWriteMappedReg(void* base_addr, uint32_t offset, uint32_t val) {
  void* reg_addr;
  reg_addr = base_addr + offset;
  //printf("DE10pro_DRIVER::Calling VTAWriteMappedReg base_addr:0x%llx, value:0x%x\n", reg_addr,val);
  //*(volatile uint32_t *) reg_addr = val;
  *((volatile uint32_t *) (reinterpret_cast<char *>(base_addr) + offset)) = val;
}

uint32_t VTAReadMappedReg(void* base_addr, uint32_t offset) {
  uint32_t ret_val;
  volatile uint64_t* reg_addr;
  ret_val = *((volatile uint32_t *) (reinterpret_cast<char *>(base_addr) + offset));
  //reg_addr =(volatile uint64_t*) base_addr + offset;
  //ret_val = *reg_addr;
  //printf("Read Register 0x%llx = 0x%x\n",base_addr+offset, ret_val);
  return ret_val;
}

#if 1
class VTADevice {

 public:
  VTADevice() {
    // VTA stage handles
    vta_host_handle_ = VTAMapRegister(VTA_HOST_ADDR);
  }

  ~VTADevice() {
    // Close VTA stage handle
    VTAUnmapRegister(vta_host_handle_);
  }

  int Run(vta_phy_addr_t insn_phy_addr,
          uint32_t insn_count,
          uint32_t wait_cycles) {
    VTAWriteMappedReg(vta_host_handle_, 0x04, 0);
    VTAWriteMappedReg(vta_host_handle_, 0x08, insn_count);
    VTAWriteMappedReg(vta_host_handle_, 0x0c, insn_phy_addr);
    printf("DE10pro_DRIVER::Run() Set DMA physical addr:0x%x\n", insn_phy_addr);

    // VTA start
    VTAWriteMappedReg(vta_host_handle_, 0x0, 0x0 );
    VTAWriteMappedReg(vta_host_handle_, 0x0, VTA_START );
    // Loop until the VTA is done
    printf("DE10pro_DRIVER::Calling VTAReadMappedReg base_addr:0x%x, offset:0x%x\n", vta_host_handle_, 0x0);
    uint32_t t, past_cyc = 0, flag = 0;
    for (t = 0; t < wait_cycles; ++t) {
//    if (past_cyc < (t / 1000000)){
        flag = VTAReadMappedReg(vta_host_handle_, 0x00);
        flag &= 0x2;
        if (flag == 0x2) break;
//        past_cyc = t / 1000000;
//        printf("Waited %d million cycles\n", past_cyc);
//      }
      std::this_thread::yield();
    }
    printf("DE10pro_DRIVER:: VTAReadMappedReg return bit 0x2 VTA done!\n");    
    usleep(1000);
    // Report error if timeout
    return t < wait_cycles ? 0 : 1;
  }

  private:
  // VTA handles (register maps)
  void* vta_host_handle_{nullptr};
};

  #else

#endif

VTADeviceHandle VTADeviceAlloc() {
  printf("DE10pro_DRIVER::Calling VTADeviceAlloc\n");
  return new VTADevice();
}

void VTADeviceFree(VTADeviceHandle handle) {
  printf("DE10pro_DRIVER::Calling VTADeviceFree\n");
  delete static_cast<VTADevice*>(handle);
}

int VTADeviceRun(VTADeviceHandle handle,
                 vta_phy_addr_t insn_phy_addr,
                 uint32_t insn_count,
                 uint32_t wait_cycles) {
  return static_cast<VTADevice*>(handle)->Run(
      insn_phy_addr, insn_count, wait_cycles);
}

/*
void VTASetStoreBufferVirAddr(void* storedbuf_viraddr){
  stored_buf_vir_addr = storedbuf_viraddr;
  printf("DE10pro_DRIVER::VTASetStoreBufferVirAddr() Set Stored Buffer Vir Addr as 0x%llx\n", stored_buf_vir_addr);

}
*/

/* 
Unmodified function only works for DE10nano
*/
void VTAProgram(const char *rbf) {
  De10ProMgr mgr;
  printf("DE10pro_DRIVER::Calling VTAProgram\n");
  CHECK(mgr.mapped()) << "de10pro: mapping of /dev/mem failed";
  CHECK(mgr.program_rbf(rbf)) << "Programming of the de10pro failed.\n"
  "This is usually due to the use of an RBF file that is incompatible "
  "with the MSEL switches on the DE10-Pro board. The recommended RBF "
  "format is FastPassiveParallel32 with compression enabled, "
  "corresponding to MSEL 01010. An RBF file in FPP32 mode can be "
  "generated in a Quartus session with the command "
  "'quartus_cpf -o bitstream_compression=on -c <file>.sof <file>.rbf'.";
}

using tvm::runtime::TVMRetValue;
using tvm::runtime::TVMArgs;

TVM_REGISTER_GLOBAL("vta.de10pro.program")
.set_body([](TVMArgs args, TVMRetValue* rv) {
    std::string bitstream = args[0];
    VTAProgram(bitstream.c_str());
});


