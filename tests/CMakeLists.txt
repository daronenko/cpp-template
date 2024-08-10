project_log("CMake: Tests")

include(CTest)

file(GLOB_RECURSE TEST_SOURCES "./*.cpp")
add_executable(${PROJECT_NAME}_unittest ${TEST_SOURCES})

target_link_libraries(${PROJECT_NAME}_unittest PRIVATE ${PROJECT_NAME}_objs)
target_link_libraries(${PROJECT_NAME}_unittest PRIVATE GTest::gtest_main)

include(GoogleTest)
gtest_discover_tests(${PROJECT_NAME}_unittest)
