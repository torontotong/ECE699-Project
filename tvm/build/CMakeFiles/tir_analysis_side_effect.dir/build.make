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
include CMakeFiles/tir_analysis_side_effect.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/tir_analysis_side_effect.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/tir_analysis_side_effect.dir/flags.make

CMakeFiles/tir_analysis_side_effect.dir/tests/cpp/tir_analysis_side_effect.cc.o: CMakeFiles/tir_analysis_side_effect.dir/flags.make
CMakeFiles/tir_analysis_side_effect.dir/tests/cpp/tir_analysis_side_effect.cc.o: ../tests/cpp/tir_analysis_side_effect.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/tliu/ECE699/tvm-repo/tvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/tir_analysis_side_effect.dir/tests/cpp/tir_analysis_side_effect.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tir_analysis_side_effect.dir/tests/cpp/tir_analysis_side_effect.cc.o -c /media/tliu/ECE699/tvm-repo/tvm/tests/cpp/tir_analysis_side_effect.cc

CMakeFiles/tir_analysis_side_effect.dir/tests/cpp/tir_analysis_side_effect.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tir_analysis_side_effect.dir/tests/cpp/tir_analysis_side_effect.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /media/tliu/ECE699/tvm-repo/tvm/tests/cpp/tir_analysis_side_effect.cc > CMakeFiles/tir_analysis_side_effect.dir/tests/cpp/tir_analysis_side_effect.cc.i

CMakeFiles/tir_analysis_side_effect.dir/tests/cpp/tir_analysis_side_effect.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tir_analysis_side_effect.dir/tests/cpp/tir_analysis_side_effect.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /media/tliu/ECE699/tvm-repo/tvm/tests/cpp/tir_analysis_side_effect.cc -o CMakeFiles/tir_analysis_side_effect.dir/tests/cpp/tir_analysis_side_effect.cc.s

CMakeFiles/tir_analysis_side_effect.dir/tests/cpp/tir_analysis_side_effect.cc.o.requires:

.PHONY : CMakeFiles/tir_analysis_side_effect.dir/tests/cpp/tir_analysis_side_effect.cc.o.requires

CMakeFiles/tir_analysis_side_effect.dir/tests/cpp/tir_analysis_side_effect.cc.o.provides: CMakeFiles/tir_analysis_side_effect.dir/tests/cpp/tir_analysis_side_effect.cc.o.requires
	$(MAKE) -f CMakeFiles/tir_analysis_side_effect.dir/build.make CMakeFiles/tir_analysis_side_effect.dir/tests/cpp/tir_analysis_side_effect.cc.o.provides.build
.PHONY : CMakeFiles/tir_analysis_side_effect.dir/tests/cpp/tir_analysis_side_effect.cc.o.provides

CMakeFiles/tir_analysis_side_effect.dir/tests/cpp/tir_analysis_side_effect.cc.o.provides.build: CMakeFiles/tir_analysis_side_effect.dir/tests/cpp/tir_analysis_side_effect.cc.o


# Object files for target tir_analysis_side_effect
tir_analysis_side_effect_OBJECTS = \
"CMakeFiles/tir_analysis_side_effect.dir/tests/cpp/tir_analysis_side_effect.cc.o"

# External object files for target tir_analysis_side_effect
tir_analysis_side_effect_EXTERNAL_OBJECTS =

tir_analysis_side_effect: CMakeFiles/tir_analysis_side_effect.dir/tests/cpp/tir_analysis_side_effect.cc.o
tir_analysis_side_effect: CMakeFiles/tir_analysis_side_effect.dir/build.make
tir_analysis_side_effect: libtvm.so
tir_analysis_side_effect: /usr/local/lib/libgtest.so
tir_analysis_side_effect: CMakeFiles/tir_analysis_side_effect.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/media/tliu/ECE699/tvm-repo/tvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable tir_analysis_side_effect"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tir_analysis_side_effect.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/tir_analysis_side_effect.dir/build: tir_analysis_side_effect

.PHONY : CMakeFiles/tir_analysis_side_effect.dir/build

CMakeFiles/tir_analysis_side_effect.dir/requires: CMakeFiles/tir_analysis_side_effect.dir/tests/cpp/tir_analysis_side_effect.cc.o.requires

.PHONY : CMakeFiles/tir_analysis_side_effect.dir/requires

CMakeFiles/tir_analysis_side_effect.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/tir_analysis_side_effect.dir/cmake_clean.cmake
.PHONY : CMakeFiles/tir_analysis_side_effect.dir/clean

CMakeFiles/tir_analysis_side_effect.dir/depend:
	cd /media/tliu/ECE699/tvm-repo/tvm/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /media/tliu/ECE699/tvm-repo/tvm /media/tliu/ECE699/tvm-repo/tvm /media/tliu/ECE699/tvm-repo/tvm/build /media/tliu/ECE699/tvm-repo/tvm/build /media/tliu/ECE699/tvm-repo/tvm/build/CMakeFiles/tir_analysis_side_effect.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/tir_analysis_side_effect.dir/depend
