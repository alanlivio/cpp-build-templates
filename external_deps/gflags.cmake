set(GFLAGS_URL https://github.com/gflags/gflags/archive/v2.1.2.zip)
set(GFLAGS_MD5 5cb0a1b38740ed596edb7f86cd5b3bd8 )

find_package(gflags QUIET)
if (GFLAGS_FOUND)
  set(GFLAGS_EXTERNAL FALSE)
else()
  find_package(Threads)
  message(STATUS "gflags was not found. It will be download and build in ${CMAKE_CURRENT_LIST_DIR}.")
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
