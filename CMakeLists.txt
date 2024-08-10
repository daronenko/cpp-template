cmake_minimum_required(VERSION 3.5)
project(cpp-template)

add_subdirectory(third_party)

include(cmake/CompileOptions.cmake)

add_subdirectory(src)

# add_subdirectory(third_party/googletest)
include(CTest)
add_subdirectory(tests)

if(DEFINED ENV{PREFIX})
  message(STATUS "Set install prefix: $ENV{PREFIX}")
  file(TO_CMAKE_PATH "$ENV{PREFIX}" PREFIX_PATH)
  set(CMAKE_INSTALL_PREFIX "${PREFIX_PATH}")
endif()

install(TARGETS ${PROJECT_NAME} DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT ${PROJECT_NAME})
