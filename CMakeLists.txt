cmake_minimum_required(VERSION 3.20)
project(cpp-template)

# CMake options

include(cmake/Logging.cmake)
include(cmake/Ccache.cmake)
include(cmake/CompileOptions.cmake)

# Third party CMakeLists
add_subdirectory(third_party)

# This must be included after library so that
# third party code is not affected
include(cmake/Werror.cmake)

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
  include(cmake/Sanitize.cmake)
endif()

# CMakeLists
add_subdirectory(src)
add_subdirectory(tests)

# Installation setup
if(DEFINED ENV{PREFIX})
  message(STATUS "Set install prefix: $ENV{PREFIX}")
  file(TO_CMAKE_PATH "$ENV{PREFIX}" PREFIX_PATH)
  set(CMAKE_INSTALL_PREFIX "${PREFIX_PATH}")
endif()

install(TARGETS ${PROJECT_NAME} DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT ${PROJECT_NAME})
