# Insight CTest script for Buildbot builds
#
# Builds the program in ../insight-build-ctest/, runs unit tests, collects
# coverage info and submits the result to CDash. The settings for CDash
# submission is in CTestConfig.cmake.
#
include(CTestCoverageCollectGCOV)

set(CTEST_SOURCE_DIRECTORY ${CTEST_SCRIPT_DIRECTORY})
set(CTEST_BINARY_DIRECTORY ${CTEST_SCRIPT_DIRECTORY}/../tmp-build)
set(CTEST_CMAKE_GENERATOR "Ninja")
set(CTEST_COVERAGE_COMMAND "llvm-cov-8")
set(CTEST_COVERAGE_EXTRA_FLAGS "gcov")

list(APPEND CTEST_CUSTOM_COVERAGE_EXCLUDE ".*/moc_.*" ".*/ui_.*" ".*/tests/.*" ".*/thirdparty/.*")
list(APPEND CTEST_EXTRA_COVERAGE_GLOB "*.cpp" "*.h")

set(INSIGHT_CTEST_CONFIGURE_OPTIONS
    "-DCMAKE_BUILD_TYPE=Debug"
    "-DCMAKE_CXX_COMPILER=clang++-8"
    "-DCMAKE_CXX_CLANG_TIDY=clang-tidy-8"
    "-DCMAKE_C_COMPILER=clang-8"
    "-DCMAKE_CXX_FLAGS=-g -O0 --coverage"
    "-DCMAKE_C_FLAGS=-g -O0 --coverage"
    "-DCMAKE_EXE_LINKER_FLAGS=--coverage"
    "-DCMAKE_SHARED_LINKER_FLAGS=--coverage"
    "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON"
    "-DCMAKE_PREFIX_PATH=/opt/VTK8"
    "-DBUILD_DOC=ON"
    "-DBUILD_USER_MANUAL=ON"
)

ctest_empty_binary_directory("${CTEST_BINARY_DIRECTORY}")
ctest_start(Experimental TRACK Tests)
ctest_configure(OPTIONS "${INSIGHT_CTEST_CONFIGURE_OPTIONS}")
ctest_build()
ctest_test(RETURN_VALUE TEST_FAILED)
if(TEST_FAILED)
    message(SEND_ERROR "Some test(s) failed")
endif()
ctest_coverage()
ctest_coverage_collect_gcov(
    TARBALL gcov.tar
    SOURCE ${CTEST_SOURCE_DIRECTORY}
    BUILD ${CTEST_BINARY_DIRECTORY}
    GCOV_OPTIONS gcov -b
)
