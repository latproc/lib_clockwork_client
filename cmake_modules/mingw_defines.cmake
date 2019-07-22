
set(CW_MINGW_DEFINITIONS "")
list(APPEND CW_MINGW_DEFINITIONS
    "-include winsock2.h"
    "-include windows.h"
    "-include stdint.h"
    "-D_USE_MATH_DEFINES"
    # defs for gecode
    "-D__x86_64__"
    "-D__USE_ISOC99"
    # -DWIN32_LEAN_AND_MEAN)
)
set_property(GLOBAL PROPERTY CW_MINGW_DEFINITIONS ${CW_MINGW_DEFINITIONS})


# if (MINGW_BUILD)
#     link_directories(
#         /usr/x86_64-w64-mingw32/lib
#         /usr/x86_64-w64-mingw32/lib64
#     )
#     include_directories(
#         /usr/x86_64-w64-mingw32/include
#     )
#     add_definitions(-DMINGW_BUILD=1)
#     add_definitions(-include winsock2.h)
#     add_definitions(-include windows.h)
#     add_definitions(-include stdint.h)
#     add_definitions(-D_USE_MATH_DEFINES)
#
#     set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
#     set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
#     set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
#
# endif()
