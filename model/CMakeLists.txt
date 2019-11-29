add_library(insightmodel SHARED
    Structure.cpp
)

target_link_libraries(insightmodel PUBLIC
    KF5::Archive
    Qt5::Core
    Qt5::Gui
    Qt5::Xml
    Qt5::Concurrent
    vtkCommonCore
    vtkCommonDataModel
    vtkCommonExecutionModel
    vtkInteractionStyle
    vtkRenderingCore
    vtkRenderingFreeType
    vtkRenderingOpenGL2
    ${HDF5_C_LIBRARIES}
)

if(NOT APPLE)
    target_link_libraries(insightmodel PUBLIC vtkRenderingFreeTypeFontConfig)
endif()

target_include_directories(insightmodel PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_BINARY_DIR}
    ${CMAKE_BINARY_DIR}/src  # For Config.h
)

target_include_directories(insightmodel SYSTEM PUBLIC
    ${HDF5_INCLUDE_DIRS}
    ${VTK_INCLUDE_DIRS}
)

target_compile_definitions(insightmodel
    PUBLIC
        ${HDF5_DEFINITIONS}
        ${VTK_DEFINITIONS}
    PRIVATE
        QT_DEPRECATED_WARNINGS
)

set_target_properties(insightmodel PROPERTIES
    AUTOMOC ON
    CXX_VISIBILITY_PRESET hidden
    VISIBILITY_INLINES_HIDDEN ON
)

generate_export_header(insightmodel)

install(TARGETS insightmodel
    RUNTIME DESTINATION "lib"
    LIBRARY DESTINATION "lib"
)

add_subdirectory(tests)
