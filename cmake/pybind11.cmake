# TODO: check for pybind11

set(PYBIND11_FINDPYTHON ON CACHE BOOL "Use modern CMake FindPython with pybind11" FORCE)
find_package(Python COMPONENTS Interpreter Development.Module QUIET)

if(NOT Python_FOUND)
    message(WARNING "Python development files were not found. Python bindings will be disabled.")
    set(SMOOTHDISTS_PYTHON_BINDINGS_AVAILABLE OFF)
    return()
endif()

FetchContent_Declare(
    pybind11
    GIT_REPOSITORY https://github.com/pybind/pybind11.git
    GIT_TAG v2.11.1
)
FetchContent_MakeAvailable(pybind11)

set(SMOOTHDISTS_PYTHON_BINDINGS_AVAILABLE ON)
