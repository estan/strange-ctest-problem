set(CTEST_SOURCE_DIRECTORY ${CTEST_SCRIPT_DIRECTORY})
set(CTEST_BINARY_DIRECTORY ${CTEST_SCRIPT_DIRECTORY}/../problem-build)

set(CTEST_CMAKE_GENERATOR "Unix Makefiles")
set(CTEST_COVERAGE_COMMAND "gcov")

list(APPEND CTEST_CUSTOM_COVERAGE_EXCLUDE ".*/moc_.*")

set(CONFIGURE_OPTIONS
    "-DCMAKE_BUILD_TYPE=Debug"
    "-DCMAKE_CXX_FLAGS=-g -O0 --coverage"
    "-DCMAKE_C_FLAGS=-g -O0 --coverage"
    "-DCMAKE_EXE_LINKER_FLAGS=--coverage"
    "-DCMAKE_SHARED_LINKER_FLAGS=--coverage"
)

ctest_empty_binary_directory("${CTEST_BINARY_DIRECTORY}")
ctest_start(Experimental)
ctest_configure(OPTIONS "${CONFIGURE_OPTIONS}")
ctest_build()
ctest_test()
ctest_coverage()
