add_executable(StructureTest
    StructureTest.cpp
)

target_link_libraries(StructureTest PRIVATE
    insightmodel
)

set_target_properties(StructureTest PROPERTIES
    AUTOMOC ON
)

add_test(StructureTest StructureTest)
