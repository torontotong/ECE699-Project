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

# Include any dependencies generated for this target.
include CMakeFiles/ir_functor_test.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/ir_functor_test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ir_functor_test.dir/flags.make

CMakeFiles/ir_functor_test.dir/tests/cpp/ir_functor_test.cc.o: CMakeFiles/ir_functor_test.dir/flags.make
CMakeFiles/ir_functor_test.dir/tests/cpp/ir_functor_test.cc.o: ../tests/cpp/ir_functor_test.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/tliu/ECE699/tvm-repo/tvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/ir_functor_test.dir/tests/cpp/ir_functor_test.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ir_functor_test.dir/tests/cpp/ir_functor_test.cc.o -c /media/tliu/ECE699/tvm-repo/tvm/tests/cpp/ir_functor_test.cc

CMakeFiles/ir_functor_test.dir/tests/cpp/ir_functor_test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ir_functor_test.dir/tests/cpp/ir_functor_test.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /media/tliu/ECE699/tvm-repo/tvm/tests/cpp/ir_functor_test.cc > CMakeFiles/ir_functor_test.dir/tests/cpp/ir_functor_test.cc.i

CMakeFiles/ir_functor_test.dir/tests/cpp/ir_functor_test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ir_functor_test.dir/tests/cpp/ir_functor_test.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /media/tliu/ECE699/tvm-repo/tvm/tests/cpp/ir_functor_test.cc -o CMakeFiles/ir_functor_test.dir/tests/cpp/ir_functor_test.cc.s

CMakeFiles/ir_functor_test.dir/tests/cpp/ir_functor_test.cc.o.requires:

.PHONY : CMakeFiles/ir_functor_test.dir/tests/cpp/ir_functor_test.cc.o.requires

CMakeFiles/ir_functor_test.dir/tests/cpp/ir_functor_test.cc.o.provides: CMakeFiles/ir_functor_test.dir/tests/cpp/ir_functor_test.cc.o.requires
	$(MAKE) -f CMakeFiles/ir_functor_test.dir/build.make CMakeFiles/ir_functor_test.dir/tests/cpp/ir_functor_test.cc.o.provides.build
.PHONY : CMakeFiles/ir_functor_test.dir/tests/cpp/ir_functor_test.cc.o.provides

CMakeFiles/ir_functor_test.dir/tests/cpp/ir_functor_test.cc.o.provides.build: CMakeFiles/ir_functor_test.dir/tests/cpp/ir_functor_test.cc.o


# Object files for target ir_functor_test
ir_functor_test_OBJECTS = \
"CMakeFiles/ir_functor_test.dir/tests/cpp/ir_functor_test.cc.o"

# External object files for target ir_functor_test
ir_functor_test_EXTERNAL_OBJECTS =

ir_functor_test: CMakeFiles/ir_functor_test.dir/tests/cpp/ir_functor_test.cc.o
ir_functor_test: CMakeFiles/ir_functor_test.dir/build.make
ir_functor_test: libtvm.so
ir_functor_test: /usr/local/lib/libgtest.so
ir_functor_test: CMakeFiles/ir_functor_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/media/tliu/ECE699/tvm-repo/tvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ir_functor_test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ir_functor_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ir_functor_test.dir/build: ir_functor_test

.PHONY : CMakeFiles/ir_functor_test.dir/build

CMakeFiles/ir_functor_test.dir/requires: CMakeFiles/ir_functor_test.dir/tests/cpp/ir_functor_test.cc.o.requires

.PHONY : CMakeFiles/ir_functor_test.dir/requires

CMakeFiles/ir_functor_test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ir_functor_test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ir_functor_test.dir/clean

CMakeFiles/ir_functor_test.dir/depend:
	cd /media/tliu/ECE699/tvm-repo/tvm/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /media/tliu/ECE699/tvm-repo/tvm /media/tliu/ECE699/tvm-repo/tvm /media/tliu/ECE699/tvm-repo/tvm/build /media/tliu/ECE699/tvm-repo/tvm/build /media/tliu/ECE699/tvm-repo/tvm/build/CMakeFiles/ir_functor_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ir_functor_test.dir/depend

