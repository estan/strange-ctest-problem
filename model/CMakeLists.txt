add_library(insightmodel SHARED
    Structure.cpp
)

target_link_libraries(insightmodel PUBLIC
    Qt5::Core
)

target_include_directories(insightmodel PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_BINARY_DIR}
    ${CMAKE_BINARY_DIR}/src  # For Config.h
)

set_target_properties(insightmodel PROPERTIES
    AUTOMOC ON
)

add_subdirectory(tests)
