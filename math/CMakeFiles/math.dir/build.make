# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.17.3/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.17.3/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/linyingjie/work/c-projects/demo

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/linyingjie/work/c-projects/demo

# Include any dependencies generated for this target.
include math/CMakeFiles/math.dir/depend.make

# Include the progress variables for this target.
include math/CMakeFiles/math.dir/progress.make

# Include the compile flags for this target's objects.
include math/CMakeFiles/math.dir/flags.make

math/CMakeFiles/math.dir/add.cpp.o: math/CMakeFiles/math.dir/flags.make
math/CMakeFiles/math.dir/add.cpp.o: math/add.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/linyingjie/work/c-projects/demo/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object math/CMakeFiles/math.dir/add.cpp.o"
	cd /Users/linyingjie/work/c-projects/demo/math && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/math.dir/add.cpp.o -c /Users/linyingjie/work/c-projects/demo/math/add.cpp

math/CMakeFiles/math.dir/add.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/math.dir/add.cpp.i"
	cd /Users/linyingjie/work/c-projects/demo/math && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/linyingjie/work/c-projects/demo/math/add.cpp > CMakeFiles/math.dir/add.cpp.i

math/CMakeFiles/math.dir/add.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/math.dir/add.cpp.s"
	cd /Users/linyingjie/work/c-projects/demo/math && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/linyingjie/work/c-projects/demo/math/add.cpp -o CMakeFiles/math.dir/add.cpp.s

# Object files for target math
math_OBJECTS = \
"CMakeFiles/math.dir/add.cpp.o"

# External object files for target math
math_EXTERNAL_OBJECTS =

math/libmath.dylib: math/CMakeFiles/math.dir/add.cpp.o
math/libmath.dylib: math/CMakeFiles/math.dir/build.make
math/libmath.dylib: math/CMakeFiles/math.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/linyingjie/work/c-projects/demo/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library libmath.dylib"
	cd /Users/linyingjie/work/c-projects/demo/math && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/math.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
math/CMakeFiles/math.dir/build: math/libmath.dylib

.PHONY : math/CMakeFiles/math.dir/build

math/CMakeFiles/math.dir/clean:
	cd /Users/linyingjie/work/c-projects/demo/math && $(CMAKE_COMMAND) -P CMakeFiles/math.dir/cmake_clean.cmake
.PHONY : math/CMakeFiles/math.dir/clean

math/CMakeFiles/math.dir/depend:
	cd /Users/linyingjie/work/c-projects/demo && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/linyingjie/work/c-projects/demo /Users/linyingjie/work/c-projects/demo/math /Users/linyingjie/work/c-projects/demo /Users/linyingjie/work/c-projects/demo/math /Users/linyingjie/work/c-projects/demo/math/CMakeFiles/math.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : math/CMakeFiles/math.dir/depend

