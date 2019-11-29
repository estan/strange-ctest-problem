cmake_minimum_required(VERSION 3.5)

project(problem)

enable_testing()

find_package(Qt5Core REQUIRED)

add_library(mylib SHARED mylib.cpp)
target_link_libraries(mylib PUBLIC Qt5::Core)
set_target_properties(mylib PROPERTIES AUTOMOC ON)

add_executable(mytest mytest.cpp)
target_link_libraries(mytest PRIVATE mylib)
add_test(mytest mytest)
