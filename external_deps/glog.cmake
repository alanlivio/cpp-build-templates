set(GLOG_URL https://github.com/google/glog/archive/v0.3.4.zip)
set(GLOG_MD5 364e6b7958c49cf22fcc5d6735bc3961 )

find_package(glog QUIET)
if (GLOG_FOUND)
  set(GLOG_EXTERNAL FALSE)
else()
  message(STATUS "gflags was not found. It will be download and build in ${CMAKE_CURRENT_LIST_DIR}.")
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

