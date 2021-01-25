#https://ain-crad.github.io/2019/04/03/Learn-CMake-3-%E5%88%9B%E5%BB%BA%E5%BA%93%E6%96%87%E4%BB%B6/
cmake_minimum_required(VERSION 3.5.1)
# project name and language
project(HttpServer_Project LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_BUILD_TYPE Release)

###ADD_SUBDIRECTORY( src )

#仅仅mac os 生效。运行xcrun -find c++； xcrun -find c;
set(CMAKE_CXX_COMPILER "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++")


# 输出打印构建目录
MESSAGE(STATUS "This is HTTPSERVER_BINARY_DIR " ${HTTPSERVER_BINARY_DIR})
# 输出打印资源目录
MESSAGE(STATUS "This is HTTPSERVER_SOURCE_DIR " ${HTTPSERVER_SOURCE_DIR})
# 输出打印资源目录，与HELLO_SOURCE_DIR 一样 
MESSAGE(STATUS "This is PROJECT_SOURCE_DIR " ${PROJECT_SOURCE_DIR})
# 输出打印 CMake 资源目录，与 PROJECT_SOURCE_DIR 一样 
MESSAGE(STATUS "This is CMAKE_SOURCE_DIR " ${CMAKE_SOURCE_DIR})
# 生成可执行文件 hello ，${SRC_LIST}是引用变量，也就是源文件 hello.cpp



#Bring the headers, such as HelloWorld.h into the project
include_directories(include)

#However, the file(GLOB ...) allows for wildcard additions:
file(GLOB SOURCES "src/*.cpp" "src/*.h" "src/*.hpp")

#Generate the shared library from the sources
add_library(LIBHTTPSERVER SHARED ${SOURCES})

#Set the location for library installation -- i.e., /usr/lib in this case
# not really necessary in this example. Use "sudo make install " to apply
#install(TARGETS HelloWorld DESTINATION /usr/lib)