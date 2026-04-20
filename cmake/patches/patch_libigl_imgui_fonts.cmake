if(NOT DEFINED PATCH_FILE)
    message(FATAL_ERROR "PATCH_FILE is required")
endif()

if(NOT EXISTS "${PATCH_FILE}")
    message(FATAL_ERROR "Patch target does not exist: ${PATCH_FILE}")
endif()

# Force a CMake-4-safe file and guard duplicate imgui target creation.
set(_patched "cmake_minimum_required(VERSION 4.0)\n\nif(NOT TARGET imgui AND NOT TARGET imgui::imgui)\n\tadd_library(imgui\n\t\t\t../imgui/imgui.cpp\n\t\t\t../imgui/imgui.h\n\t\t\t../imgui/imgui_demo.cpp\n\t\t\t../imgui/imgui_draw.cpp\n\t\t\t../imgui/imgui_tables.cpp\n\t\t\t../imgui/imgui_internal.h\n\t\t\t../imgui/imgui_widgets.cpp\n\t\t\t../imgui/imstb_rectpack.h\n\t\t\t../imgui/imstb_textedit.h\n\t\t\t../imgui/imstb_truetype.h\n\t\t\t../imgui/backends/imgui_impl_glfw.cpp\n\t\t\t../imgui/backends/imgui_impl_opengl3.cpp\n\t)\n\n\ttarget_include_directories(imgui PUBLIC ../imgui)\n\ttarget_include_directories(imgui PUBLIC . .. ../imgui/backends)\n\ttarget_compile_definitions(imgui PUBLIC -DIMGUI_IMPL_OPENGL_LOADER_GLAD)\n\n\ttarget_link_libraries(imgui PRIVATE glad glfw)\nendif()\n")

file(WRITE "${PATCH_FILE}" "${_patched}")
message(STATUS "Patched libigl_imgui_fonts for CMake 4 and duplicate imgui target protection")
