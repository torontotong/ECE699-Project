# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /media/tliu/ECE699/tvm-repo/tvm

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /media/tliu/ECE699/tvm-repo/tvm/build

# Utility rule file for cpptest.

# Include the progress variables for this target.
include CMakeFiles/cpptest.dir/progress.make

CMakeFiles/cpptest: arith_simplify_test
CMakeFiles/cpptest: attrs_test
CMakeFiles/cpptest: auto_scheduler_test
CMakeFiles/cpptest: build_module_test
CMakeFiles/cpptest: container_test
CMakeFiles/cpptest: dataflow_pattern_test
CMakeFiles/cpptest: expr_test
CMakeFiles/cpptest: ir_functor_test
CMakeFiles/cpptest: object_protocol_test
CMakeFiles/cpptest: packed_func_test
CMakeFiles/cpptest: parallel_for_test
CMakeFiles/cpptest: pattern_match_test
CMakeFiles/cpptest: profiling_test
CMakeFiles/cpptest: relay_build_module_test
CMakeFiles/cpptest: relay_dismantler_test
CMakeFiles/cpptest: relay_pass_type_infer_test
CMakeFiles/cpptest: relay_text_printer_test
CMakeFiles/cpptest: relay_transform_sequential_test
CMakeFiles/cpptest: support_test
CMakeFiles/cpptest: target_test
CMakeFiles/cpptest: tensor_test
CMakeFiles/cpptest: threading_backend_test
CMakeFiles/cpptest: tir_analysis_side_effect
CMakeFiles/cpptest: topi_ewise_test
CMakeFiles/cpptest: utvm_runtime_standalone_test


cpptest: CMakeFiles/cpptest
cpptest: CMakeFiles/cpptest.dir/build.make

.PHONY : cpptest

# Rule to build all files generated by this target.
CMakeFiles/cpptest.dir/build: cpptest

.PHONY : CMakeFiles/cpptest.dir/build

CMakeFiles/cpptest.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/cpptest.dir/cmake_clean.cmake
.PHONY : CMakeFiles/cpptest.dir/clean

CMakeFiles/cpptest.dir/depend:
	cd /media/tliu/ECE699/tvm-repo/tvm/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /media/tliu/ECE699/tvm-repo/tvm /media/tliu/ECE699/tvm-repo/tvm /media/tliu/ECE699/tvm-repo/tvm/build /media/tliu/ECE699/tvm-repo/tvm/build /media/tliu/ECE699/tvm-repo/tvm/build/CMakeFiles/cpptest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/cpptest.dir/depend

