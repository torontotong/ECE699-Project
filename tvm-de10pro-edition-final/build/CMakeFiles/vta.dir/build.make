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
CMAKE_SOURCE_DIR = /home/terasic/workspace/tvm

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/terasic/workspace/tvm/build

# Include any dependencies generated for this target.
include CMakeFiles/vta.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/vta.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/vta.dir/flags.make

CMakeFiles/vta.dir/vta/runtime/device_api.cc.o: CMakeFiles/vta.dir/flags.make
CMakeFiles/vta.dir/vta/runtime/device_api.cc.o: ../vta/runtime/device_api.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/terasic/workspace/tvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/vta.dir/vta/runtime/device_api.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/vta.dir/vta/runtime/device_api.cc.o -c /home/terasic/workspace/tvm/vta/runtime/device_api.cc

CMakeFiles/vta.dir/vta/runtime/device_api.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/vta.dir/vta/runtime/device_api.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/terasic/workspace/tvm/vta/runtime/device_api.cc > CMakeFiles/vta.dir/vta/runtime/device_api.cc.i

CMakeFiles/vta.dir/vta/runtime/device_api.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/vta.dir/vta/runtime/device_api.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/terasic/workspace/tvm/vta/runtime/device_api.cc -o CMakeFiles/vta.dir/vta/runtime/device_api.cc.s

CMakeFiles/vta.dir/vta/runtime/device_api.cc.o.requires:

.PHONY : CMakeFiles/vta.dir/vta/runtime/device_api.cc.o.requires

CMakeFiles/vta.dir/vta/runtime/device_api.cc.o.provides: CMakeFiles/vta.dir/vta/runtime/device_api.cc.o.requires
	$(MAKE) -f CMakeFiles/vta.dir/build.make CMakeFiles/vta.dir/vta/runtime/device_api.cc.o.provides.build
.PHONY : CMakeFiles/vta.dir/vta/runtime/device_api.cc.o.provides

CMakeFiles/vta.dir/vta/runtime/device_api.cc.o.provides.build: CMakeFiles/vta.dir/vta/runtime/device_api.cc.o


CMakeFiles/vta.dir/vta/runtime/runtime.cc.o: CMakeFiles/vta.dir/flags.make
CMakeFiles/vta.dir/vta/runtime/runtime.cc.o: ../vta/runtime/runtime.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/terasic/workspace/tvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/vta.dir/vta/runtime/runtime.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/vta.dir/vta/runtime/runtime.cc.o -c /home/terasic/workspace/tvm/vta/runtime/runtime.cc

CMakeFiles/vta.dir/vta/runtime/runtime.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/vta.dir/vta/runtime/runtime.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/terasic/workspace/tvm/vta/runtime/runtime.cc > CMakeFiles/vta.dir/vta/runtime/runtime.cc.i

CMakeFiles/vta.dir/vta/runtime/runtime.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/vta.dir/vta/runtime/runtime.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/terasic/workspace/tvm/vta/runtime/runtime.cc -o CMakeFiles/vta.dir/vta/runtime/runtime.cc.s

CMakeFiles/vta.dir/vta/runtime/runtime.cc.o.requires:

.PHONY : CMakeFiles/vta.dir/vta/runtime/runtime.cc.o.requires

CMakeFiles/vta.dir/vta/runtime/runtime.cc.o.provides: CMakeFiles/vta.dir/vta/runtime/runtime.cc.o.requires
	$(MAKE) -f CMakeFiles/vta.dir/build.make CMakeFiles/vta.dir/vta/runtime/runtime.cc.o.provides.build
.PHONY : CMakeFiles/vta.dir/vta/runtime/runtime.cc.o.provides

CMakeFiles/vta.dir/vta/runtime/runtime.cc.o.provides.build: CMakeFiles/vta.dir/vta/runtime/runtime.cc.o


CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/cma_api.cc.o: CMakeFiles/vta.dir/flags.make
CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/cma_api.cc.o: ../3rdparty/vta-hw/src/de10pro/cma_api.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/terasic/workspace/tvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/cma_api.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/cma_api.cc.o -c /home/terasic/workspace/tvm/3rdparty/vta-hw/src/de10pro/cma_api.cc

CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/cma_api.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/cma_api.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/terasic/workspace/tvm/3rdparty/vta-hw/src/de10pro/cma_api.cc > CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/cma_api.cc.i

CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/cma_api.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/cma_api.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/terasic/workspace/tvm/3rdparty/vta-hw/src/de10pro/cma_api.cc -o CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/cma_api.cc.s

CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/cma_api.cc.o.requires:

.PHONY : CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/cma_api.cc.o.requires

CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/cma_api.cc.o.provides: CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/cma_api.cc.o.requires
	$(MAKE) -f CMakeFiles/vta.dir/build.make CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/cma_api.cc.o.provides.build
.PHONY : CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/cma_api.cc.o.provides

CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/cma_api.cc.o.provides.build: CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/cma_api.cc.o


CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/de10pro_driver.cc.o: CMakeFiles/vta.dir/flags.make
CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/de10pro_driver.cc.o: ../3rdparty/vta-hw/src/de10pro/de10pro_driver.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/terasic/workspace/tvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/de10pro_driver.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/de10pro_driver.cc.o -c /home/terasic/workspace/tvm/3rdparty/vta-hw/src/de10pro/de10pro_driver.cc

CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/de10pro_driver.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/de10pro_driver.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/terasic/workspace/tvm/3rdparty/vta-hw/src/de10pro/de10pro_driver.cc > CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/de10pro_driver.cc.i

CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/de10pro_driver.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/de10pro_driver.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/terasic/workspace/tvm/3rdparty/vta-hw/src/de10pro/de10pro_driver.cc -o CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/de10pro_driver.cc.s

CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/de10pro_driver.cc.o.requires:

.PHONY : CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/de10pro_driver.cc.o.requires

CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/de10pro_driver.cc.o.provides: CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/de10pro_driver.cc.o.requires
	$(MAKE) -f CMakeFiles/vta.dir/build.make CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/de10pro_driver.cc.o.provides.build
.PHONY : CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/de10pro_driver.cc.o.provides

CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/de10pro_driver.cc.o.provides.build: CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/de10pro_driver.cc.o


# Object files for target vta
vta_OBJECTS = \
"CMakeFiles/vta.dir/vta/runtime/device_api.cc.o" \
"CMakeFiles/vta.dir/vta/runtime/runtime.cc.o" \
"CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/cma_api.cc.o" \
"CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/de10pro_driver.cc.o"

# External object files for target vta
vta_EXTERNAL_OBJECTS =

libvta.so: CMakeFiles/vta.dir/vta/runtime/device_api.cc.o
libvta.so: CMakeFiles/vta.dir/vta/runtime/runtime.cc.o
libvta.so: CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/cma_api.cc.o
libvta.so: CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/de10pro_driver.cc.o
libvta.so: CMakeFiles/vta.dir/build.make
libvta.so: CMakeFiles/vta.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/terasic/workspace/tvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX shared library libvta.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/vta.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/vta.dir/build: libvta.so

.PHONY : CMakeFiles/vta.dir/build

CMakeFiles/vta.dir/requires: CMakeFiles/vta.dir/vta/runtime/device_api.cc.o.requires
CMakeFiles/vta.dir/requires: CMakeFiles/vta.dir/vta/runtime/runtime.cc.o.requires
CMakeFiles/vta.dir/requires: CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/cma_api.cc.o.requires
CMakeFiles/vta.dir/requires: CMakeFiles/vta.dir/3rdparty/vta-hw/src/de10pro/de10pro_driver.cc.o.requires

.PHONY : CMakeFiles/vta.dir/requires

CMakeFiles/vta.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/vta.dir/cmake_clean.cmake
.PHONY : CMakeFiles/vta.dir/clean

CMakeFiles/vta.dir/depend:
	cd /home/terasic/workspace/tvm/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/terasic/workspace/tvm /home/terasic/workspace/tvm /home/terasic/workspace/tvm/build /home/terasic/workspace/tvm/build /home/terasic/workspace/tvm/build/CMakeFiles/vta.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/vta.dir/depend

