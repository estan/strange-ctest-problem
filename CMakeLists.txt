cmake_minimum_required(VERSION 3.5)

project(problem)

enable_testing()

find_package(Qt5Core REQUIRED)

add_executable(mytest mytest.cpp)
target_link_libraries(mytest PUBLIC Qt5::Core)
set_target_properties(mytest PROPERTIES AUTOMOC ON)
add_test(mytest mytest)
