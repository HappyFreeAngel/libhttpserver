message(STATUS "Enter math folder")
set(MODULE_MATH    math)

aux_source_directory(. MATH_SOURCE)   #将当前目录下所有源文件赋给MATH_SOURCE变量，当源文件数量比较多时会比较方便

add_library(${MODULE_MATH} SHARED ${MATH_SOURCE})