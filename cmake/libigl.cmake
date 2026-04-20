if(TARGET igl::core)
    return()
endif()

include(FetchContent)

# Predeclare this dependency so libigl's later declaration reuses these details.
# The patch prevents duplicate `imgui` target creation under CMake 4.
FetchContent_Declare(
    libigl_imgui_fonts
    URL https://github.com/libigl/libigl-imgui/archive/7e1053e750b0f4c129b046f4e455243cb7f804f3.tar.gz
    PATCH_COMMAND ${CMAKE_COMMAND}
        -DPATCH_FILE=<SOURCE_DIR>/CMakeLists.txt
        -P ${CMAKE_CURRENT_LIST_DIR}/patches/patch_libigl_imgui_fonts.cmake
)

FetchContent_Declare(
    libigl
    GIT_REPOSITORY https://github.com/libigl/libigl.git
    GIT_TAG v2.4.0
)
FetchContent_MakeAvailable(libigl)
