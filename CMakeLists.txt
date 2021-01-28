# project name and language    https://blog.csdn.net/rangfei/article/details/108781815
project(demo LANGUAGES CXX)
# set minimum cmake version
cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}")   # 设置可执行文件的输出目录

message(STATUS "cmake demo project")    # 显示信息

add_subdirectory(math)       # 包含下级子目录math
add_subdirectory(utility)
add_subdirectory(main)


