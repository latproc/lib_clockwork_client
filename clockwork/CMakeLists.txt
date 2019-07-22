cmake_minimum_required(VERSION 2.80)

set(exe_name "clockwork_client")
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake_modules/")

if (EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/LocalCMakeLists.txt")
    include("${CMAKE_CURRENT_SOURCE_DIR}/LocalCMakeLists.txt")
endif()

#################################
##        find library         ##
#################################

set(INCLUDE
    ${ZMQ-Dep_INCLUDE_DIRS}
    ${Boost-Dep_INCLUDE_DIRS}
    ${Curl-Dep_INCLUDE_DIRS}
    ${INCLUDE}
)
set(LIBRARY
    ZMQ-Dep
    Boost-Dep
    Curl-Dep
)


if (MINGW_BUILD)
    list(APPEND LIBRARY
        ws2_32
    )
endif()


##################################
#          Build Binary          #
##################################

FILE(GLOB_RECURSE source_files RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/src/*.c*
)
FILE(GLOB_RECURSE header_files RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/src/*.h*
)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

add_library(${exe_name}
    STATIC
    ${source_files}
    ${header_files}
)
# add_executable(${exe_name} ${source_files} ${header_files})
# add_test(${exe_name} ${exe_name})
target_link_libraries(${exe_name}
    ${LIBRARY}
)
target_include_directories(${exe_name}
    PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/src
    ${INCLUDE}
)

if (MINGW_BUILD)
else()
    install(
        TARGETS
        ${exe_name}
        LIBRARY DESTINATION
        ${PROJECT_SOURCE_DIR}
        ARCHIVE DESTINATION
        ${PROJECT_SOURCE_DIR}
    )
endif()
