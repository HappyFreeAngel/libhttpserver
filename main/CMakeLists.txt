message(STATUS "Build in main folder")    # 显示信息
set(MODULE_MAIN demo)                     # 设置模块名称变量

#设置项目的根目录
set(PROJECT_ROOT_DIR /Users/linyingjie/work/c-projects/demo)


include_directories("${CMAKE_SOURCE_DIR}/math" "${CMAKE_SOURCE_DIR}/utility")  # 包含另外两个目录，可以不用

# 链接库文件，这里需要指定路径和库全称。如果使用这个命令，需在add_executable()之前
#link_libraries("${CMAKE_BINARY_DIR}/math/libmath.so" "${CMAKE_BINARY_DIR}/utility/libutility.so")

# 生成可执行文件demo
add_executable(${MODULE_MAIN} main.cpp)


MESSAGE(STATUS "PROJECT_SOURCE_DIR=" "${PROJECT_SOURCE_DIR}")
MESSAGE(STATUS "PROJECT_ROOT_DIR=" "${PROJECT_ROOT_DIR}")

# 输出打印构建目录
MESSAGE(STATUS "CMAKE_BINARY_DIR=" "${CMAKE_BINARY_DIR}")

MESSAGE(STATUS  "链接库文件，与link_libraries类似，但这里需要指定目标文件")
# 链接库文件，与link_libraries类似，但这里需要指定目标文件





set(MY_UTILITY_LIB_FILE  ${PROJECT_ROOT_DIR}/utility/libutility.so) 
set(MY_MATH_LIB_FILE     ${PROJECT_ROOT_DIR}/math/libmath.so) 


MESSAGE(STATUS MY_UTILITY_LIB_FILE= ${MY_UTILITY_LIB_FILE})
MESSAGE(STATUS MY_MATH_LIB_FILE= ${MY_MATH_LIB_FILE})

target_link_libraries(${MODULE_MAIN} 
                      ${MY_UTILITY_LIB_FILE}
                      ${MY_MATH_LIB_FILE}
                      )

# target_link_libraries(${MODULE_MAIN} 
#                       /Users/linyingjie/work/c-projects/demo/utility/libutility.so
#                       /Users/linyingjie/work/c-projects/demo/math/libmath.so
#                       )
# ${CMAKE_BINARY_DIR}/math/libmath.so