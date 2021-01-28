message(STATUS "Enter utility folder")
set(MODULE_UTILITY    utility)

#aux_source_directory(. UTILITY_SOURCE)
set (UTILITY_SOURCE utils.cpp)    # 与上一行功能一样，这里手动指定源文件

add_library(${MODULE_UTILITY} SHARED ${UTILITY_SOURCE})    # 编译动态库
