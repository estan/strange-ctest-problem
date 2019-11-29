cmake_minimum_required(VERSION 3.5)

project(orexplore-insight)

cmake_policy(SET CMP0063 NEW)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

configure_file(Config.h.in Config.h)

enable_testing()

include(GenerateExportHeader)

find_package(HDF5 QUIET REQUIRED COMPONENTS C)
find_package(QApt QUIET)
find_package(Qt5Concurrent REQUIRED)
find_package(Qt5Core REQUIRED)
find_package(Qt5Gui REQUIRED)
find_package(Qt5Svg REQUIRED)
find_package(Qt5Test REQUIRED)
find_package(Qt5Widgets REQUIRED)
find_package(Qt5Xml REQUIRED)
find_package(VTK 8.2.0 REQUIRED COMPONENTS
    vtkCommonCore
    vtkCommonDataModel
    vtkCommonExecutionModel
    vtkInteractionStyle
    vtkRenderingCore
    vtkRenderingFreeType
    vtkRenderingOpenGL2
)
find_package(KF5Archive REQUIRED)

add_executable(orexplore-insight WIN32 MACOSX_BUNDLE main.cpp)

add_compile_options(
    "$<$<CXX_COMPILER_ID:GNU>:-Wall>"
    "$<$<CXX_COMPILER_ID:GNU>:-Wextra>"
    "$<$<CXX_COMPILER_ID:GNU>:-Werror>"

    "$<$<CXX_COMPILER_ID:Clang>:-Wall>"
    "$<$<CXX_COMPILER_ID:Clang>:-Wextra>"
    "$<$<CXX_COMPILER_ID:Clang>:-Werror>"

    "$<$<CXX_COMPILER_ID:AppleClang>:-Wall>"
    "$<$<CXX_COMPILER_ID:AppleClang>:-Wextra>"
    "$<$<CXX_COMPILER_ID:AppleClang>:-Werror>"

    "$<$<CXX_COMPILER_ID:MSVC>:/WX>"
)

add_subdirectory(model)
