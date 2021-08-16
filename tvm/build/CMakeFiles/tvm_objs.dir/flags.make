# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# compile CXX with /usr/bin/c++
CXX_FLAGS = -std=c++14 -faligned-new -O2 -Wall -fPIC  -fpermissive  

CXX_DEFINES = -DDMLC_USE_FOPEN64=0 -DDMLC_USE_LOGGING_LIBRARY="<tvm/runtime/logging.h>" -DNDEBUG=1 -DTVM_INDEX_DEFAULT_I64=1 -DTVM_LLVM_VERSION=120 -DTVM_LOG_DEBUG -DTVM_THREADPOOL_USE_OPENMP=0 -DTVM_USE_LIBBACKTRACE=1 -DUSE_FALLBACK_STL_MAP=0 -DUSE_RELAY_DEBUG -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS

CXX_INCLUDES = -I/media/tliu/ECE699/tvm-repo/tvm/include -isystem /media/tliu/ECE699/tvm-repo/tvm/3rdparty/dlpack/include -isystem /media/tliu/ECE699/tvm-repo/tvm/3rdparty/dmlc-core/include -isystem /media/tliu/ECE699/tvm-repo/tvm/3rdparty/rang/include -isystem /media/tliu/ECE699/tvm-repo/tvm/3rdparty/compiler-rt -isystem /media/tliu/ECE699/tvm-repo/tvm/3rdparty/picojson -isystem /usr/lib/llvm-12/include -I/media/tliu/ECE699/tvm-repo/tvm/build/libbacktrace/include -I/media/tliu/ECE699/tvm-repo/tvm/topi/include -I/media/tliu/ECE699/tvm-repo/tvm/3rdparty/libcrc/include 

# Custom defines: CMakeFiles/tvm_objs.dir/src/support/libinfo.cc.o_DEFINES = TVM_INFO_GIT_COMMIT_HASH="36fbbaacb754d3daf02032624b4b9e9e2b7ca8ad";TVM_INFO_USE_CUDA="OFF";TVM_INFO_USE_OPENCL="OFF";TVM_INFO_USE_VULKAN="OFF";TVM_INFO_USE_METAL="OFF";TVM_INFO_USE_ROCM="OFF";TVM_INFO_ROCM_PATH="/opt/rocm";TVM_INFO_USE_HEXAGON_DEVICE="OFF";TVM_INFO_USE_HEXAGON_SDK="/path/to/sdk";TVM_INFO_USE_RPC="ON";TVM_INFO_USE_THREADS="ON";TVM_INFO_USE_LLVM="llvm-config-12";TVM_INFO_LLVM_VERSION="12.0.1";TVM_INFO_USE_STACKVM_RUNTIME="OFF";TVM_INFO_USE_GRAPH_EXECUTOR="ON";TVM_INFO_USE_GRAPH_EXECUTOR_DEBUG="";TVM_INFO_USE_OPENMP="none";TVM_INFO_USE_RELAY_DEBUG="ON";TVM_INFO_USE_RTTI="ON";TVM_INFO_USE_MSVC_MT="OFF";TVM_INFO_USE_MICRO="OFF";TVM_INFO_INSTALL_DEV="OFF";TVM_INFO_HIDE_PRIVATE_SYMBOLS="OFF";TVM_INFO_USE_TF_TVMDSOOP="OFF";TVM_INFO_USE_FALLBACK_STL_MAP="OFF";TVM_INFO_USE_BYODT_POSIT="OFF";TVM_INFO_USE_BLAS="none";TVM_INFO_USE_MKL="OFF";TVM_INFO_USE_MKLDNN="OFF";TVM_INFO_USE_DNNL_CODEGEN="OFF";TVM_INFO_USE_CUDNN="OFF";TVM_INFO_USE_CUBLAS="OFF";TVM_INFO_USE_THRUST="OFF";TVM_INFO_USE_MIOPEN="OFF";TVM_INFO_USE_ROCBLAS="OFF";TVM_INFO_USE_SORT="ON";TVM_INFO_USE_NNPACK="OFF";TVM_INFO_USE_RANDOM="ON";TVM_INFO_USE_MICRO_STANDALONE_RUNTIME="OFF";TVM_INFO_USE_CPP_RPC="OFF";TVM_INFO_USE_TFLITE="OFF";TVM_INFO_USE_TENSORFLOW_PATH="none";TVM_INFO_USE_COREML="OFF";TVM_INFO_USE_TARGET_ONNX="OFF";TVM_INFO_USE_ARM_COMPUTE_LIB="OFF";TVM_INFO_USE_ARM_COMPUTE_LIB_GRAPH_EXECUTOR="OFF";TVM_INFO_INDEX_DEFAULT_I64="ON";TVM_CXX_COMPILER_PATH="/usr/bin/c++"

# Custom flags: CMakeFiles/tvm_objs.dir/src/target/llvm/codegen_amdgpu.cc.o_FLAGS = -fno-rtti

# Custom defines: CMakeFiles/tvm_objs.dir/src/target/llvm/codegen_amdgpu.cc.o_DEFINES = DMLC_ENABLE_RTTI=0

# Custom flags: CMakeFiles/tvm_objs.dir/src/target/llvm/codegen_arm.cc.o_FLAGS = -fno-rtti

# Custom defines: CMakeFiles/tvm_objs.dir/src/target/llvm/codegen_arm.cc.o_DEFINES = DMLC_ENABLE_RTTI=0

# Custom flags: CMakeFiles/tvm_objs.dir/src/target/llvm/codegen_blob.cc.o_FLAGS = -fno-rtti

# Custom defines: CMakeFiles/tvm_objs.dir/src/target/llvm/codegen_blob.cc.o_DEFINES = DMLC_ENABLE_RTTI=0

# Custom flags: CMakeFiles/tvm_objs.dir/src/target/llvm/codegen_cpu.cc.o_FLAGS = -fno-rtti

# Custom defines: CMakeFiles/tvm_objs.dir/src/target/llvm/codegen_cpu.cc.o_DEFINES = DMLC_ENABLE_RTTI=0

# Custom flags: CMakeFiles/tvm_objs.dir/src/target/llvm/codegen_hexagon.cc.o_FLAGS = -fno-rtti

# Custom defines: CMakeFiles/tvm_objs.dir/src/target/llvm/codegen_hexagon.cc.o_DEFINES = DMLC_ENABLE_RTTI=0

# Custom flags: CMakeFiles/tvm_objs.dir/src/target/llvm/codegen_llvm.cc.o_FLAGS = -fno-rtti

# Custom defines: CMakeFiles/tvm_objs.dir/src/target/llvm/codegen_llvm.cc.o_DEFINES = DMLC_ENABLE_RTTI=0

# Custom flags: CMakeFiles/tvm_objs.dir/src/target/llvm/codegen_nvptx.cc.o_FLAGS = -fno-rtti

# Custom defines: CMakeFiles/tvm_objs.dir/src/target/llvm/codegen_nvptx.cc.o_DEFINES = DMLC_ENABLE_RTTI=0

# Custom flags: CMakeFiles/tvm_objs.dir/src/target/llvm/codegen_params.cc.o_FLAGS = -fno-rtti

# Custom defines: CMakeFiles/tvm_objs.dir/src/target/llvm/codegen_params.cc.o_DEFINES = DMLC_ENABLE_RTTI=0

# Custom flags: CMakeFiles/tvm_objs.dir/src/target/llvm/codegen_x86_64.cc.o_FLAGS = -fno-rtti

# Custom defines: CMakeFiles/tvm_objs.dir/src/target/llvm/codegen_x86_64.cc.o_DEFINES = DMLC_ENABLE_RTTI=0

# Custom flags: CMakeFiles/tvm_objs.dir/src/target/llvm/intrin_rule_hexagon.cc.o_FLAGS = -fno-rtti

# Custom defines: CMakeFiles/tvm_objs.dir/src/target/llvm/intrin_rule_hexagon.cc.o_DEFINES = DMLC_ENABLE_RTTI=0

# Custom flags: CMakeFiles/tvm_objs.dir/src/target/llvm/intrin_rule_llvm.cc.o_FLAGS = -fno-rtti

# Custom defines: CMakeFiles/tvm_objs.dir/src/target/llvm/intrin_rule_llvm.cc.o_DEFINES = DMLC_ENABLE_RTTI=0

# Custom flags: CMakeFiles/tvm_objs.dir/src/target/llvm/intrin_rule_nvptx.cc.o_FLAGS = -fno-rtti

# Custom defines: CMakeFiles/tvm_objs.dir/src/target/llvm/intrin_rule_nvptx.cc.o_DEFINES = DMLC_ENABLE_RTTI=0

# Custom flags: CMakeFiles/tvm_objs.dir/src/target/llvm/intrin_rule_rocm.cc.o_FLAGS = -fno-rtti

# Custom defines: CMakeFiles/tvm_objs.dir/src/target/llvm/intrin_rule_rocm.cc.o_DEFINES = DMLC_ENABLE_RTTI=0

# Custom flags: CMakeFiles/tvm_objs.dir/src/target/llvm/llvm_common.cc.o_FLAGS = -fno-rtti

# Custom defines: CMakeFiles/tvm_objs.dir/src/target/llvm/llvm_common.cc.o_DEFINES = DMLC_ENABLE_RTTI=0

# Custom flags: CMakeFiles/tvm_objs.dir/src/target/llvm/llvm_module.cc.o_FLAGS = -fno-rtti

# Custom defines: CMakeFiles/tvm_objs.dir/src/target/llvm/llvm_module.cc.o_DEFINES = DMLC_ENABLE_RTTI=0

