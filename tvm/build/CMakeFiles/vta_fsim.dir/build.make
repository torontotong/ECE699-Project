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
include CMakeFiles/vta_fsim.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/vta_fsim.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/vta_fsim.dir/flags.make

CMakeFiles/vta_fsim.dir/vta/runtime/device_api.cc.o: CMakeFiles/vta_fsim.dir/flags.make
CMakeFiles/vta_fsim.dir/vta/runtime/device_api.cc.o: ../vta/runtime/device_api.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/tliu/ECE699/tvm-repo/tvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/vta_fsim.dir/vta/runtime/device_api.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/vta_fsim.dir/vta/runtime/device_api.cc.o -c /media/tliu/ECE699/tvm-repo/tvm/vta/runtime/device_api.cc

CMakeFiles/vta_fsim.dir/vta/runtime/device_api.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/vta_fsim.dir/vta/runtime/device_api.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /media/tliu/ECE699/tvm-repo/tvm/vta/runtime/device_api.cc > CMakeFiles/vta_fsim.dir/vta/runtime/device_api.cc.i

CMakeFiles/vta_fsim.dir/vta/runtime/device_api.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/vta_fsim.dir/vta/runtime/device_api.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /media/tliu/ECE699/tvm-repo/tvm/vta/runtime/device_api.cc -o CMakeFiles/vta_fsim.dir/vta/runtime/device_api.cc.s

CMakeFiles/vta_fsim.dir/vta/runtime/device_api.cc.o.requires:

.PHONY : CMakeFiles/vta_fsim.dir/vta/runtime/device_api.cc.o.requires

CMakeFiles/vta_fsim.dir/vta/runtime/device_api.cc.o.provides: CMakeFiles/vta_fsim.dir/vta/runtime/device_api.cc.o.requires
	$(MAKE) -f CMakeFiles/vta_fsim.dir/build.make CMakeFiles/vta_fsim.dir/vta/runtime/device_api.cc.o.provides.build
.PHONY : CMakeFiles/vta_fsim.dir/vta/runtime/device_api.cc.o.provides

CMakeFiles/vta_fsim.dir/vta/runtime/device_api.cc.o.provides.build: CMakeFiles/vta_fsim.dir/vta/runtime/device_api.cc.o


CMakeFiles/vta_fsim.dir/vta/runtime/runtime.cc.o: CMakeFiles/vta_fsim.dir/flags.make
CMakeFiles/vta_fsim.dir/vta/runtime/runtime.cc.o: ../vta/runtime/runtime.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/tliu/ECE699/tvm-repo/tvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/vta_fsim.dir/vta/runtime/runtime.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/vta_fsim.dir/vta/runtime/runtime.cc.o -c /media/tliu/ECE699/tvm-repo/tvm/vta/runtime/runtime.cc

CMakeFiles/vta_fsim.dir/vta/runtime/runtime.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/vta_fsim.dir/vta/runtime/runtime.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /media/tliu/ECE699/tvm-repo/tvm/vta/runtime/runtime.cc > CMakeFiles/vta_fsim.dir/vta/runtime/runtime.cc.i

CMakeFiles/vta_fsim.dir/vta/runtime/runtime.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/vta_fsim.dir/vta/runtime/runtime.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /media/tliu/ECE699/tvm-repo/tvm/vta/runtime/runtime.cc -o CMakeFiles/vta_fsim.dir/vta/runtime/runtime.cc.s

CMakeFiles/vta_fsim.dir/vta/runtime/runtime.cc.o.requires:

.PHONY : CMakeFiles/vta_fsim.dir/vta/runtime/runtime.cc.o.requires

CMakeFiles/vta_fsim.dir/vta/runtime/runtime.cc.o.provides: CMakeFiles/vta_fsim.dir/vta/runtime/runtime.cc.o.requires
	$(MAKE) -f CMakeFiles/vta_fsim.dir/build.make CMakeFiles/vta_fsim.dir/vta/runtime/runtime.cc.o.provides.build
.PHONY : CMakeFiles/vta_fsim.dir/vta/runtime/runtime.cc.o.provides

CMakeFiles/vta_fsim.dir/vta/runtime/runtime.cc.o.provides.build: CMakeFiles/vta_fsim.dir/vta/runtime/runtime.cc.o


CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_driver.cc.o: CMakeFiles/vta_fsim.dir/flags.make
CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_driver.cc.o: ../3rdparty/vta-hw/src/sim/sim_driver.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/tliu/ECE699/tvm-repo/tvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_driver.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_driver.cc.o -c /media/tliu/ECE699/tvm-repo/tvm/3rdparty/vta-hw/src/sim/sim_driver.cc

CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_driver.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_driver.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /media/tliu/ECE699/tvm-repo/tvm/3rdparty/vta-hw/src/sim/sim_driver.cc > CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_driver.cc.i

CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_driver.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_driver.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /media/tliu/ECE699/tvm-repo/tvm/3rdparty/vta-hw/src/sim/sim_driver.cc -o CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_driver.cc.s

CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_driver.cc.o.requires:

.PHONY : CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_driver.cc.o.requires

CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_driver.cc.o.provides: CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_driver.cc.o.requires
	$(MAKE) -f CMakeFiles/vta_fsim.dir/build.make CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_driver.cc.o.provides.build
.PHONY : CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_driver.cc.o.provides

CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_driver.cc.o.provides.build: CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_driver.cc.o


CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_tlpp.cc.o: CMakeFiles/vta_fsim.dir/flags.make
CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_tlpp.cc.o: ../3rdparty/vta-hw/src/sim/sim_tlpp.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/tliu/ECE699/tvm-repo/tvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_tlpp.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_tlpp.cc.o -c /media/tliu/ECE699/tvm-repo/tvm/3rdparty/vta-hw/src/sim/sim_tlpp.cc

CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_tlpp.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_tlpp.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /media/tliu/ECE699/tvm-repo/tvm/3rdparty/vta-hw/src/sim/sim_tlpp.cc > CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_tlpp.cc.i

CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_tlpp.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_tlpp.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /media/tliu/ECE699/tvm-repo/tvm/3rdparty/vta-hw/src/sim/sim_tlpp.cc -o CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_tlpp.cc.s

CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_tlpp.cc.o.requires:

.PHONY : CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_tlpp.cc.o.requires

CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_tlpp.cc.o.provides: CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_tlpp.cc.o.requires
	$(MAKE) -f CMakeFiles/vta_fsim.dir/build.make CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_tlpp.cc.o.provides.build
.PHONY : CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_tlpp.cc.o.provides

CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_tlpp.cc.o.provides.build: CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_tlpp.cc.o


CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/vmem/virtual_memory.cc.o: CMakeFiles/vta_fsim.dir/flags.make
CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/vmem/virtual_memory.cc.o: ../3rdparty/vta-hw/src/vmem/virtual_memory.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/tliu/ECE699/tvm-repo/tvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/vmem/virtual_memory.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/vmem/virtual_memory.cc.o -c /media/tliu/ECE699/tvm-repo/tvm/3rdparty/vta-hw/src/vmem/virtual_memory.cc

CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/vmem/virtual_memory.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/vmem/virtual_memory.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /media/tliu/ECE699/tvm-repo/tvm/3rdparty/vta-hw/src/vmem/virtual_memory.cc > CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/vmem/virtual_memory.cc.i

CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/vmem/virtual_memory.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/vmem/virtual_memory.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /media/tliu/ECE699/tvm-repo/tvm/3rdparty/vta-hw/src/vmem/virtual_memory.cc -o CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/vmem/virtual_memory.cc.s

CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/vmem/virtual_memory.cc.o.requires:

.PHONY : CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/vmem/virtual_memory.cc.o.requires

CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/vmem/virtual_memory.cc.o.provides: CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/vmem/virtual_memory.cc.o.requires
	$(MAKE) -f CMakeFiles/vta_fsim.dir/build.make CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/vmem/virtual_memory.cc.o.provides.build
.PHONY : CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/vmem/virtual_memory.cc.o.provides

CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/vmem/virtual_memory.cc.o.provides.build: CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/vmem/virtual_memory.cc.o


# Object files for target vta_fsim
vta_fsim_OBJECTS = \
"CMakeFiles/vta_fsim.dir/vta/runtime/device_api.cc.o" \
"CMakeFiles/vta_fsim.dir/vta/runtime/runtime.cc.o" \
"CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_driver.cc.o" \
"CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_tlpp.cc.o" \
"CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/vmem/virtual_memory.cc.o"

# External object files for target vta_fsim
vta_fsim_EXTERNAL_OBJECTS =

libvta_fsim.so: CMakeFiles/vta_fsim.dir/vta/runtime/device_api.cc.o
libvta_fsim.so: CMakeFiles/vta_fsim.dir/vta/runtime/runtime.cc.o
libvta_fsim.so: CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_driver.cc.o
libvta_fsim.so: CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_tlpp.cc.o
libvta_fsim.so: CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/vmem/virtual_memory.cc.o
libvta_fsim.so: CMakeFiles/vta_fsim.dir/build.make
libvta_fsim.so: CMakeFiles/vta_fsim.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/media/tliu/ECE699/tvm-repo/tvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX shared library libvta_fsim.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/vta_fsim.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/vta_fsim.dir/build: libvta_fsim.so

.PHONY : CMakeFiles/vta_fsim.dir/build

CMakeFiles/vta_fsim.dir/requires: CMakeFiles/vta_fsim.dir/vta/runtime/device_api.cc.o.requires
CMakeFiles/vta_fsim.dir/requires: CMakeFiles/vta_fsim.dir/vta/runtime/runtime.cc.o.requires
CMakeFiles/vta_fsim.dir/requires: CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_driver.cc.o.requires
CMakeFiles/vta_fsim.dir/requires: CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/sim/sim_tlpp.cc.o.requires
CMakeFiles/vta_fsim.dir/requires: CMakeFiles/vta_fsim.dir/3rdparty/vta-hw/src/vmem/virtual_memory.cc.o.requires

.PHONY : CMakeFiles/vta_fsim.dir/requires

CMakeFiles/vta_fsim.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/vta_fsim.dir/cmake_clean.cmake
.PHONY : CMakeFiles/vta_fsim.dir/clean

CMakeFiles/vta_fsim.dir/depend:
	cd /media/tliu/ECE699/tvm-repo/tvm/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /media/tliu/ECE699/tvm-repo/tvm /media/tliu/ECE699/tvm-repo/tvm /media/tliu/ECE699/tvm-repo/tvm/build /media/tliu/ECE699/tvm-repo/tvm/build /media/tliu/ECE699/tvm-repo/tvm/build/CMakeFiles/vta_fsim.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/vta_fsim.dir/depend
