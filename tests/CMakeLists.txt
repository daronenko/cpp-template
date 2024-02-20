add_executable(${PROJECT_NAME}_unittest
    math/operations_test.cpp
)

target_link_libraries(${PROJECT_NAME}_unittest PRIVATE ${PROJECT_NAME}_objs)
target_link_libraries(${PROJECT_NAME}_unittest PRIVATE GTest::gtest_main)

include(GoogleTest)
gtest_discover_tests(${PROJECT_NAME}_unittest)
