# The set of languages for which implicit dependencies are needed:
set(CMAKE_DEPENDS_LANGUAGES
  "CXX"
  )
# The set of files for implicit dependencies of each language:
set(CMAKE_DEPENDS_CHECK_CXX
  "/home/terasic/workspace/tvm/3rdparty/vta-hw/src/sim/sim_driver.cc" "/home/terasic/workspace/tvm/build/CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_driver.cc.o"
  "/home/terasic/workspace/tvm/3rdparty/vta-hw/src/sim/sim_tlpp.cc" "/home/terasic/workspace/tvm/build/CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_tlpp.cc.o"
  "/home/terasic/workspace/tvm/3rdparty/vta-hw/src/vmem/virtual_memory.cc" "/home/terasic/workspace/tvm/build/CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/vmem/virtual_memory.cc.o"
  "/home/terasic/workspace/tvm/vta/runtime/device_api.cc" "/home/terasic/workspace/tvm/build/CMakeFiles/vta_fsim.dir/vta/runtime/device_api.cc.o"
  "/home/terasic/workspace/tvm/vta/runtime/runtime.cc" "/home/terasic/workspace/tvm/build/CMakeFiles/vta_fsim.dir/vta/runtime/runtime.cc.o"
  )
set(CMAKE_CXX_COMPILER_ID "GNU")

# Preprocessor definitions for this target.
set(CMAKE_TARGET_DEFINITIONS_CXX
  "DMLC_USE_FOPEN64=0"
  "DMLC_USE_LOGGING_LIBRARY=<tvm/runtime/logging.h>"
  "NDEBUG=1"
  "TA_TARGET=de10pro"
  "TVM_INDEX_DEFAULT_I64=1"
  "TVM_LLVM_VERSION=100"
  "TVM_THREADPOOL_USE_OPENMP=0"
  "USE_FSIM_TLPP"
  "VTA_COHERENT_ACCESSES=true"
  "VTA_COMPUTE_ADDR=0xFF222000"
  "VTA_COMPUTE_BIAS_ADDR_OFFSET=40"
  "VTA_COMPUTE_DONE_RD_OFFSET=24"
  "VTA_COMPUTE_DONE_WR_OFFSET=16"
  "VTA_COMPUTE_UOP_ADDR_OFFSET=32"
  "VTA_FETCH_ADDR=0xFF220000"
  "VTA_FETCH_INSN_ADDR_OFFSET=24"
  "VTA_FETCH_INSN_COUNT_OFFSET=16"
  "VTA_HW_VER=0.0.2"
  "VTA_IP_REG_MAP_RANGE=0x1000"
  "VTA_LOAD_ADDR=0xFF221000"
  "VTA_LOAD_INP_ADDR_OFFSET=16"
  "VTA_LOAD_WGT_ADDR_OFFSET=24"
  "VTA_LOG_ACC_BUFF_SIZE=17"
  "VTA_LOG_ACC_WIDTH=5"
  "VTA_LOG_BATCH=0"
  "VTA_LOG_BLOCK=4"
  "VTA_LOG_BLOCK_IN=4"
  "VTA_LOG_BLOCK_OUT=4"
  "VTA_LOG_BUS_WIDTH=6"
  "VTA_LOG_INP_BUFF_SIZE=15"
  "VTA_LOG_INP_WIDTH=3"
  "VTA_LOG_OUT_BUFF_SIZE=15"
  "VTA_LOG_OUT_WIDTH=3"
  "VTA_LOG_UOP_BUFF_SIZE=15"
  "VTA_LOG_WGT_BUFF_SIZE=18"
  "VTA_LOG_WGT_WIDTH=3"
  "VTA_STORE_ADDR=0xFF223000"
  "VTA_STORE_OUT_ADDR_OFFSET=16"
  "_GNU_SOURCE"
  "__STDC_CONSTANT_MACROS"
  "__STDC_FORMAT_MACROS"
  "__STDC_LIMIT_MACROS"
  )

# The include file search paths:
set(CMAKE_CXX_TARGET_INCLUDE_PATH
  "../include"
  "../3rdparty/dlpack/include"
  "../3rdparty/dmlc-core/include"
  "../3rdparty/rang/include"
  "../3rdparty/compiler-rt"
  "../3rdparty/picojson"
  "../3rdparty/vta-hw/include"
  "/usr/lib/llvm-10/include"
  )

# Targets to which this target links.
set(CMAKE_TARGET_LINKED_INFO_FILES
  )

# Fortran module output directory.
set(CMAKE_Fortran_TARGET_MODULE_DIR "")
