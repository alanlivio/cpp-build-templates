set(GTEST_URL https://github.com/google/googletest/archive/release-1.7.0.zip)
set(GTEST_MD5 ef5e700c8a0f3ee123e2e0209b8b4961 )

find_package(gtest QUIET)
if (GTEST_FOUND)
  set(GTEST_EXTERNAL FALSE)
else()
  message(STATUS "gtest was not found. It will be download and build in ${CMAKE_CURRENT_LIST_DIR}.")
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
