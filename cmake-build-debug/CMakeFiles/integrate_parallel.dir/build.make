# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_SOURCE_DIR = /mnt/c/Study/AKS/lab3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/c/Study/AKS/lab3/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/integrate_parallel.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/integrate_parallel.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/integrate_parallel.dir/flags.make

CMakeFiles/integrate_parallel.dir/main.cpp.o: CMakeFiles/integrate_parallel.dir/flags.make
CMakeFiles/integrate_parallel.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Study/AKS/lab3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/integrate_parallel.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/integrate_parallel.dir/main.cpp.o -c /mnt/c/Study/AKS/lab3/main.cpp

CMakeFiles/integrate_parallel.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/integrate_parallel.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Study/AKS/lab3/main.cpp > CMakeFiles/integrate_parallel.dir/main.cpp.i

CMakeFiles/integrate_parallel.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/integrate_parallel.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Study/AKS/lab3/main.cpp -o CMakeFiles/integrate_parallel.dir/main.cpp.s

CMakeFiles/integrate_parallel.dir/integrals.cpp.o: CMakeFiles/integrate_parallel.dir/flags.make
CMakeFiles/integrate_parallel.dir/integrals.cpp.o: ../integrals.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Study/AKS/lab3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/integrate_parallel.dir/integrals.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/integrate_parallel.dir/integrals.cpp.o -c /mnt/c/Study/AKS/lab3/integrals.cpp

CMakeFiles/integrate_parallel.dir/integrals.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/integrate_parallel.dir/integrals.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Study/AKS/lab3/integrals.cpp > CMakeFiles/integrate_parallel.dir/integrals.cpp.i

CMakeFiles/integrate_parallel.dir/integrals.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/integrate_parallel.dir/integrals.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Study/AKS/lab3/integrals.cpp -o CMakeFiles/integrate_parallel.dir/integrals.cpp.s

# Object files for target integrate_parallel
integrate_parallel_OBJECTS = \
"CMakeFiles/integrate_parallel.dir/main.cpp.o" \
"CMakeFiles/integrate_parallel.dir/integrals.cpp.o"

# External object files for target integrate_parallel
integrate_parallel_EXTERNAL_OBJECTS =

integrate_parallel: CMakeFiles/integrate_parallel.dir/main.cpp.o
integrate_parallel: CMakeFiles/integrate_parallel.dir/integrals.cpp.o
integrate_parallel: CMakeFiles/integrate_parallel.dir/build.make
integrate_parallel: CMakeFiles/integrate_parallel.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/c/Study/AKS/lab3/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable integrate_parallel"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/integrate_parallel.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/integrate_parallel.dir/build: integrate_parallel

.PHONY : CMakeFiles/integrate_parallel.dir/build

CMakeFiles/integrate_parallel.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/integrate_parallel.dir/cmake_clean.cmake
.PHONY : CMakeFiles/integrate_parallel.dir/clean

CMakeFiles/integrate_parallel.dir/depend:
	cd /mnt/c/Study/AKS/lab3/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Study/AKS/lab3 /mnt/c/Study/AKS/lab3 /mnt/c/Study/AKS/lab3/cmake-build-debug /mnt/c/Study/AKS/lab3/cmake-build-debug /mnt/c/Study/AKS/lab3/cmake-build-debug/CMakeFiles/integrate_parallel.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/integrate_parallel.dir/depend

