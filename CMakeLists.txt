# cmake configurations
#------------------------------------------------------------------
cmake_minimum_required(VERSION 2.8)
#set(CMAKE_VERBOSE_MAKEFILE on)
set(CMAKE_CXX_FLAGS "-Wno-cpp")

# project configuration
#------------------------------------------------------------------
project(cpp_template_cmake CXX C)
SET(PACKAGE "helloworld")
SET(PACKAGE_NAME ${PACKAGE})
SET(PACKAGE_VERSION_MAJOR "1")
SET(PACKAGE_VERSION_MINOR "0")
SET(VERSION "${PACKAGE_VERSION_MAJOR}.${PACKAGE_VERSION_MINOR}")
SET(PACKAGE_VERSION ${VERSION})
SET(PACKAGE_STRING "${PACKAGE_NAME} ${PACKAGE_VERSION}")

# dependecies
#------------------------------------------------------------------
find_package(Threads)

if (UNIX)
  # pkgconfig
  find_package(PkgConfig REQUIRED)
  # libplatinum
  pkg_check_modules(LIBPLATINUM REQUIRED libplatinum)
  # libxml-2.0
  pkg_check_modules(LIBXML2 REQUIRED libxml-2.0)
  # libzip
  pkg_check_modules(LIBZIP REQUIRED libzip)
  # gflags
  find_library(GFLAGS_LIBRARY NAMES gflags libgflags)
  set(GFLAGS_INCLUDE_DIRS ${GFLAGS_INCLUDE_DIR})
  set(GFLAGS_LIBRARIES ${GFLAGS_LIBRARY})
  # glog
  pkg_check_modules(GLOG REQUIRED libglog)
elseif(WIN32)
  # gflags
  find_package(gflags QUIET)
  if(NOT GFLAGS_FOUND)
    message(STATUS "Not found gflags. Will use external_deps/")
    set(GFLAGS_INCLUDE_DIRS ${CMAKE_CURRENT_LIST_DIR}/external_deps/include)
    set(GFLAGS_LIBRARIES ${CMAKE_CURRENT_LIST_DIR}/external_deps/lib/libgflags.a ${CMAKE_THREAD_LIBS_INIT})
    set(GFLAGS_LIBRARY_DIRS ${CMAKE_CURRENT_LIST_DIR}/external_deps/lib)
  endif()
  # glog
  find_package(glog QUIET)
  if(NOT GLOG_FOUND)
    message(STATUS "Not found glog. Will use external_deps/")
    set(GLOG_INCLUDE_DIRS ${CMAKE_CURRENT_LIST_DIR}/external_deps/include)
    set(GLOG_LIBRARIES ${GFLAGS_LIBRARIES} ${CMAKE_CURRENT_LIST_DIR}/external_deps/lib/libglog.a)
    set(GLOG_LIBRARY_DIRS ${CMAKE_CURRENT_LIST_DIR}/external_deps/lib)
  endif()
endif (UNIX)

# library and programs
#------------------------------------------------------------------
add_subdirectory(src)
add_subdirectory(programs)

# tests
#------------------------------------------------------------------
enable_testing()
add_subdirectory(tests)

# helpers targets
#------------------------------------------------------------------
include("cmake/distclean.cmake")
include("cmake/cpplint.cmake")
add_cpplint_target(src programs tests)

message(STATUS "")
message(STATUS "  Version:              ${VERSION}")
message(STATUS "  Host type:            ${CMAKE_SYSTEM}")
message(STATUS "  CMAKE_INSTALL_PREFIX: ${CMAKE_INSTALL_PREFIX}")
message(STATUS "  CMAKE_CXX_FLAGS:      ${CMAKE_CXX_FLAGS}")
message(STATUS "  CMAKE_BINARY_DIR:     ${CMAKE_BINARY_DIR}")
message(STATUS "")
