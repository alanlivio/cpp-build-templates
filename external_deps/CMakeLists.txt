cmake_minimum_required(VERSION 2.8)
include(ExternalProject)

# This subdirectory resolve gflags, glog and gtest as external deps
# Do as follows to add all targets your project and resolve variables.
# add_subdirectory(${PROJECT_SOURCE_DIR}/external_deps/ EXCLUDE_FROM_ALL)
# Or, do as follows to only resolve variables
# add_subdirectory(${PROJECT_SOURCE_DIR}/external_deps/)

# gflags
# ------------------------------------
set(GFLAGS_URL https://github.com/gflags/gflags/archive/v2.1.2.zip)
set(GFLAGS_MD5 5cb0a1b38740ed596edb7f86cd5b3bd8 )

find_package(gflags QUIET)
if (GFLAGS_FOUND)
  set(GFLAGS_EXTERNAL FALSE)
else()
  find_package(Threads)
  message(STATUS "gflags was not found. You can use CMake files in external_deps folder.")
  set(gflags_PREFIX ${CMAKE_CURRENT_LIST_DIR})
  set(gflags_INSTALL ${CMAKE_CURRENT_LIST_DIR})
  if (UNIX)
      set(GFLAGS_EXTRA_COMPILER_FLAGS "-fPIC")
  endif()
  set(GFLAGS_CXX_FLAGS ${CMAKE_CXX_FLAGS} ${GFLAGS_EXTRA_COMPILER_FLAGS})
  set(GFLAGS_C_FLAGS ${CMAKE_C_FLAGS} ${GFLAGS_EXTRA_COMPILER_FLAGS})

  ExternalProject_Add(gflags
    PREFIX ${gflags_PREFIX}
    URL ${GFLAGS_URL}
    URL_MD5 ${GFLAGS_MD5}
    UPDATE_COMMAND ""
    INSTALL_DIR ${gflags_INSTALL}
    CMAKE_ARGS -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
               -DCMAKE_INSTALL_PREFIX=${gflags_INSTALL}
               -DBUILD_SHARED_LIBS=OFF
               -DBUILD_STATIC_LIBS=ON
               -DBUILD_PACKAGING=OFF
               -DBUILD_TESTING=OFF
               -DBUILD_NC_TESTS=OFF
               -BUILD_CONFIG_TESTS=OFF
               -DINSTALL_HEADERS=ON
               -DCMAKE_C_FLAGS=${GFLAGS_C_FLAGS}
               -DCMAKE_CXX_FLAGS=${GFLAGS_CXX_FLAGS}
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1)

  set(GFLAGS_FOUND TRUE)
  set(GFLAGS_INCLUDE_DIRS ${gflags_INSTALL}/include PARENT_SCOPE)
  set(GFLAGS_LIBRARIES ${gflags_INSTALL}/lib/libgflags.a ${CMAKE_THREAD_LIBS_INIT} PARENT_SCOPE)
  set(GFLAGS_LIBRARY_DIRS ${gflags_INSTALL}/lib PARENT_SCOPE)
  set(GFLAGS_EXTERNAL TRUE)
endif()

# glog
# ------------------------------------
set(GLOG_URL https://github.com/google/glog/archive/v0.3.4.zip)
set(GLOG_MD5 364e6b7958c49cf22fcc5d6735bc3961 )

find_package(glog QUIET)
if (GLOG_FOUND)
  set(GLOG_EXTERNAL FALSE)
else()
  message(STATUS "gflags was not found. You can use CMake files in external_deps folder.")
  set(glog_PREFIX ${CMAKE_CURRENT_LIST_DIR})
  set(glog_INSTALL ${CMAKE_CURRENT_LIST_DIR})
  if (UNIX)
    set(GLOG_EXTRA_COMPILER_FLAGS "-fPIC")
  endif()
  set(GLOG_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${GLOG_EXTRA_COMPILER_FLAGS}")
  set(GLOG_C_FLAGS "${CMAKE_C_FLAGS} ${GLOG_EXTRA_COMPILER_FLAGS}")
  if (GFLAGS_EXTERNAL)
    set(GLOG_DEPENDS gflags)
  endif()

  ExternalProject_Add(glog
    DEPENDS ${GLOG_DEPENDS}
    PREFIX ${glog_PREFIX}
    URL ${GLOG_URL}
    URL_MD5 ${GLOG_MD5}
    UPDATE_COMMAND ""
    INSTALL_DIR ${gflags_INSTALL}
    CONFIGURE_COMMAND env "CFLAGS=${GLOG_C_FLAGS}" "CXXFLAGS=${GLOG_CXX_FLAGS}" ${glog_PREFIX}/src/glog/configure --prefix=${glog_INSTALL} --enable-shared=no --enable-static=yes --with-gflags=${GFLAGS_LIBRARY_DIRS}/..
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1)

  set(GLOG_FOUND TRUE)
  set(GLOG_INCLUDE_DIRS ${glog_INSTALL}/include)
  set(GLOG_LIBRARIES ${GFLAGS_LIBRARIES} ${glog_INSTALL}/lib/libglog.a)
  set(GLOG_LIBRARY_DIRS ${glog_INSTALL}/lib)
  set(GLOG_EXTERNAL TRUE)
endif()

# gtests
# ------------------------------------
set(GTEST_URL https://github.com/google/googletest/archive/release-1.7.0.zip)
set(GTEST_MD5 ef5e700c8a0f3ee123e2e0209b8b4961 )

find_package(gtest QUIET)
if (GTEST_FOUND)
  set(GTEST_EXTERNAL FALSE)
else()
  message(STATUS "gtest was not found. You can use CMake files in external_deps folder.")
  find_package(Threads)
  set(gtest_PREFIX ${CMAKE_CURRENT_LIST_DIR})
  set(gtest_INSTALL ${CMAKE_CURRENT_LIST_DIR})
  if (UNIX)
      set(GTEST_EXTRA_COMPILER_FLAGS "-fPIC")
  endif()
  set(GTEST_CXX_FLAGS ${CMAKE_CXX_FLAGS} ${GTEST_EXTRA_COMPILER_FLAGS})
  set(GTEST_C_FLAGS ${CMAKE_C_FLAGS} ${GTEST_EXTRA_COMPILER_FLAGS})

 ExternalProject_Add(gtest
    PREFIX ${gtest_PREFIX}
    URL ${GTEST_URL}
    URL_MD5 ${GTEST_MD5}
    UPDATE_COMMAND ""
    INSTALL_COMMAND ""
    INSTALL_DIR ${gtest_INSTALL}
    CMAKE_ARGS -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
               -DCMAKE_INSTALL_PREFIX=${gtest_INSTALL}
               -DBUILD_SHARED_LIBS=OFF
               -BUILD_CONFIG_TESTS=OFF
               -DCMAKE_C_FLAGS=${GTEST_C_FLAGS}
               -DCMAKE_CXX_FLAGS=${GTEST_CXX_FLAGS}
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1)

  set(GTEST_FOUND TRUE)
  set(GTEST_INCLUDE_DIRS ${gtest_PREFIX}/src/gtest/include/ PARENT_SCOPE)
  set(GTEST_LIBRARIES ${gtest_PREFIX}/src/gtest-build/libgtest.a ${CMAKE_THREAD_LIBS_INIT} PARENT_SCOPE)
  set(GTEST_LIBRARY_DIRS ${gtest_PREFIX}/src/gtest-build/ PARENT_SCOPE)
  set(GTEST_EXTERNAL TRUE)
endif()


IF (UNIX)
  ADD_CUSTOM_TARGET (distclean_external_deps)
  file(GLOB_RECURSE DISTCLEAN_FILES
      RELATIVE ${CMAKE_CURRENT_BINARY_DIR}
      CMakeFiles Makefile)
  ADD_CUSTOM_COMMAND(
    DEPENDS clean
    COMMENT "distclean"
    COMMAND rm
    ARGS    -Rf ${DISTCLEAN_FILES} CMakeCache.txt CMakeFiles Makefile cmake_install.cmake include/ lib/ share/ src/ tmp/ bin
    TARGET  distclean_external_deps)
ENDIF(UNIX)

