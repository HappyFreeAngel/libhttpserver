#https://blog.csdn.net/rangfei/article/details/108781815
#这个是个CMake操作经典案例。
#cmake(4)：在多层目录结构下编译

1. 说明
本文以一个简单的示例说明如何在多层目录结构下如何构建目标文件。

1.1 项目结构
在工程目录下包含三个目录和一个根CMakeLists.txt

main：main.cpp, CMakeLists.txt
math：add.h/cpp, CMakeLists.txt
utility：utils.h/cpp, CMakeLists.txt
CMakeLists.txt
如下图所示：


1.2 示例说明
定义各个功能函数及子目录下的CMakeLists.txt
main：编译成一个可执行文件demo，链接其他两个目录下的动态库
math：编译成一个动态库libmath.so
utility：编译成一个动态库libutility.so

在build目录下编译

mkdir build && cd build
cmake ..
make


此时会在build目录下生成对应的几个目录及各自的可执行文件和动态库

将可执行文件输出到编译目录下
原有的操作会将demo程序生成在build/main/目录下，对于调试可能产生不便，尤其是在会生成多个可执行文件的情况下，一个目录一个目录地运行很麻烦，所以可以使用如下命令将可执行文件生成build目录下：
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}")
1
设置运行时输出文件夹为CMAKE_BINARY_DIR，其中CMAKE_BINARY_DIR对应的是cmake编译树的最顶层。注意库文件路径不会修改。

1.3 运行结果
如下图所示：
在这里插入图片描述

2. 示例
2.1 main目录
main.cpp

#include <iostream>
#include <string>

#include "../math/add.h"
#include "../utility/utils.h"

int main()
{
    int ret_add;

    std::cout << "Hello, this is my first cmake sample" << std::endl;
    printmsg("Hello world!");

    ret_add = Add(1, 2);

    return 0;
}

CMakeLists.txt

message(STATUS "Build in main folder")    # 显示信息
set(MODULE_MAIN demo)                     # 设置模块名称变量

include_directories("${CMAKE_SOURCE_DIR}/math" "${CMAKE_SOURCE_DIR}/utility")  # 包含另外两个目录，可以不用

# 链接库文件，这里需要指定路径和库全称。如果使用这个命令，需在add_executable()之前
#link_libraries("${CMAKE_BINARY_DIR}/math/libmath.so" "${CMAKE_BINARY_DIR}/utility/libutility.so")

# 生成可执行文件demo
add_executable(${MODULE_MAIN} main.cpp)

# 链接库文件，与link_libraries类似，但这里需要指定目标文件
target_link_libraries(${MODULE_MAIN} 
                      ${CMAKE_BINARY_DIR}/utility/libutility.so
                      ${CMAKE_BINARY_DIR}/math/libmath.so
                      )

2.2 math目录
add.h

// add.h
#ifndef __CMAKE_ADD__
#define __CMAKE_ADD__

int Add(int t1, int t2);

#endif


add.cpp

//add.cpp
#include <iostream>

#include "add.h"

int Add(int t1, int t2)
{
    int result = t1 + t2;

    std::cout << t1 << " + " << t2 << " is: " << result << std::endl;

    return result;
}


CMakeLists.txt

message(STATUS "Enter math folder")
set(MODULE_MATH    math)

aux_source_directory(. MATH_SOURCE)   #将当前目录下所有源文件赋给MATH_SOURCE变量，当源文件数量比较多时会比较方便

add_library(${MODULE_MATH} SHARED ${MATH_SOURCE})

2.3 utility目录
utils.h

//utils.h
#ifndef __CMAKE_UTILS__
#define __CMAKE_UTILS__
#include <iostream>
#include <string>

void printmsg(std::string msg);

#endif


utils.cpp

#include "utils.h"

void printmsg(std::string msg)
{
    std::cout << msg << std::endl;
}


CMakeLists.txt

message(STATUS "Enter utility folder")
set(MODULE_UTILITY    utility)

#aux_source_directory(. UTILITY_SOURCE)
set (UTILITY_SOURCE utils.cpp)    # 与上一行功能一样，这里手动指定源文件

add_library(${MODULE_UTILITY} SHARED ${UTILITY_SOURCE})    # 编译动态库

2.4 根目录下的CMakeLists.txt
通常情况下根目录的CMakeLists.txt用于设置一些通用的配置选项，比如项目名称，编译器选择和参数配置等。

cmake_minimum_required (VERSION 3.0.0)
project (cmake_test VERSION 0.0.2)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}")   # 设置可执行文件的输出目录

add_subdirectory(math)       # 包含下级子目录math
add_subdirectory(utility)
add_subdirectory(main)

编译顺序和add_subdirectory()的顺序一致，所有对于其他文件有依赖的目录通常放在后面。比如这里main的编译就依赖于math和utility的编译输出。
cmake_minimum_required和project是必须的，但是只要在顶层CMakeLists.txt中定义一次就好，下级文件不再需要指定。

3. 命令解析
3.1 set
此命令用于设置变量的值，变量包括普通变量，缓存变量和环境变量。可以用unset()来取消变量设置。

用法1（Normal Variable）
普通变量或者说局部变量是用户自己设置的在当前函数或目录下有效的变量。

set(<variable> <value>... [PARENT_SCOPE])
1
variable：变量名称，用户自己设置
value：变量对应的值，如果有多个，那么这些值会以列表的形式添加到变量中。
PARENT_SCOPE：用于声明该变量的作用域是否扩展至上一级目录中。如果声明，那么在每一个新目录都会创建一个同样的变量。
用法2（Cache Entry）
缓存变量也可以称为全局变量，cmake已经内置了一些缓存变量对应于环境变量值，用户也可以自己设置一些其他变量。如果同一作用域下有同名的局部和全局变量，那么局部变量将会覆盖全局变量。

set(<variable> <value>... CACHE <type> <docstring> [FORCE])
1
variable：变量名称
value：变量值
CACHE：表明variable是缓存变量
type：表明变量的数据类型，包括以下5类：
BOOL：值只有ON/OFF
FILEPATH：指向磁盘上的文件路径
PATH：指向磁盘上目录的路径
STRING：字符串
INTERNAL：字符串，用于运行期间保存变量
docstring：暂时不明白这个参数的作用
FORCE：如果一开始不存在此缓存变量，那么强制将变量设置为缓存变量。
用法3（Environment Variable）
环境变量是指CMake的环境变量，不是系统的。与其他变量相比，它的作用域是全局的，且只能用过$ENV{variable}的方式调用。
一般情况下最好不要修改环境变量。

set(ENV{<variable>} [<value>])
1
ENV{}：环境变量名称
value：值
3.2 add_subdirectory
将子目录添加到编译系统中，调用后cmake会自动进入该目录搜索CMakeLists.txt并进行编译。

用法
add_subdirectory(source_dir [binary_dir] [EXCLUDE_FROM_ALL])
1
source_dir：子目录，可以是相对路径也可以是绝对路径
binary_dir：指定输出文件目录，即子目录下的编译结果存放到该目录中
EXCLUDE_FROM_ALL：如果设置，则默认情况下，子目录中的目标将不包括在父目录的ALL目标中，并且将从IDE项目文件中排除。
3.3 aux_source_directory
查找目录下的所有源文件，并保存到一个变量中。如果所有的源文件都在同一目录下且数量较多，那么使用这一命令会省去一个一个添加源文件的麻烦。

用法
aux_source_directory(<dir> <variable>)
1
dir：要查找的目录
variable：变量
3.4 include_directories
将指定目录包含进编译系统，以便编译时能查找头文件。对应的目录会添加进INCLUDE_DIRECTORIES目录属性中。

用法
include_directories([AFTER|BEFORE] [SYSTEM] dir1 [dir2 ...])
1
AFTER|BEFORE：默认情况下，目录会被追加到目录列表的末尾，通过AFTER|BEFORE可以显式的指定追加到末尾还是开头。类似于PATH的路径，依次查找。
SYSTEM：表明目录是系统目录。
dir1…：指定目录
3.5 link_libraries
将库链接到所有目标文件之后，与target_link_libraries()命令的不同之处在于它可以一次指定多个目标文件和库。

用法
link_libraries([item1 [item2 [...]]]
               [[debug|optimized|general] <item>] ...)
1
2
item1，item2…：目标文件
item：库
3.6 message
产生log信息，包含两种类型的信息。

用法1（General messages）
message([<mode>] "message text" ...)
1
mode：可选，按照优先级从高到低，可分为：FATAL_ERROR，SEND_ERROR，WARNING，AUTHOR_WARNING，DEPRECATION，(none) or NOTICE，STATUS，VERBOSE，DEBUG，TRACE。
如果指定为FATAL_ERROR，那么编译将会终止。默认是NOTICE，它以下的级别默认不会输出。
用法2（Reporting checks）
message(<checkState> "message" ...)
1
checkState：根据流程分成三个：CHECK_START，CHECK_PASS，CHECK_FAIL分别表示开始检查，检查通过，检查失败。
示例
message(STATUS "Looking for someheader.h")
#... do the checks, set checkSuccess with the result
if(checkSuccess)
  message(STATUS "Looking for someheader.h - found")
else()
  message(STATUS "Looking for someheader.h - not found")
endif()

4. 属性或变量
4.1 CMAKE_RUNTIME_OUTPUT_DIRECTORY
构建时所有的可执行文件的输出目录。

4.2 CMAKE_BINARY_DIR
构建时最顶层的编译目录，如示例中使用的build。

4.3 CMAKE_SOURCE_DIR
源文件树的最顶层目录。