cmake_minimum_required (VERSION 2.8)

if (MINGW_BUILD)
    include("cmake_modules/mingw_defines.cmake")
    get_property(CW_MINGW_DEFINITIONS GLOBAL PROPERTY CW_MINGW_DEFINITIONS)
    add_definitions(${CW_MINGW_DEFINITIONS})
endif()

add_subdirectory(ext)
add_subdirectory(clockwork)
