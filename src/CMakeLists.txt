project_log("CMake: Src")

get_filename_component(SOURCE_PATH "." ABSOLUTE)

file(GLOB_RECURSE CPP_SOURCES ${SOURCE_PATH}/*.cpp)
list(REMOVE_ITEM CPP_SOURCES ${SOURCE_PATH}/main.cpp)

file(GLOB_RECURSE ASM_SOURCES ${SOURCE_PATH}/*.S)
file(GLOB_RECURSE HEADERS ${SOURCE_PATH}/*.hpp)

enable_language(ASM)

add_library(${PROJECT_NAME}_objs OBJECT
    ${CPP_SOURCES}
    ${ASM_SOURCES}
    ${HEADERS}
)
target_include_directories(${PROJECT_NAME}_objs PUBLIC ${SOURCE_PATH})
target_link_libraries(${PROJECT_NAME}_objs PUBLIC wheels)

add_executable(${PROJECT_NAME} ${SOURCE_PATH}/main.cpp)
target_link_libraries(${PROJECT_NAME} PRIVATE ${PROJECT_NAME}_objs)
