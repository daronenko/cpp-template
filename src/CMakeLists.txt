add_library(${PROJECT_NAME}_objs OBJECT
    math/operations.cpp
    math/operations.hpp
)
target_include_directories(${PROJECT_NAME}_objs PUBLIC ${PROJECT_SOURCE_DIR}/src)
target_link_libraries(${PROJECT_NAME}_objs PUBLIC wheels)

add_executable(${PROJECT_NAME} main.cpp)
target_link_libraries(${PROJECT_NAME} PRIVATE ${PROJECT_NAME}_objs)
