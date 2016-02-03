IF (UNIX)
  ADD_CUSTOM_TARGET (distclean)
  file(GLOB_RECURSE DISTCLEAN_FILES1
      RELATIVE ${CMAKE_SOURCE_DIR}
      CMakeFiles Makefile)
  SET(DISTCLEAN_FILES2
    Testing
    CTestTestfile.cmake
    cmake_install.cmake
    cmake.depends
    cmake.check_depends
    cmake.check_cache)

  ADD_CUSTOM_COMMAND(
    DEPENDS clean
    COMMENT "dist clean"
    COMMAND find
    ARGS ${CMAKE_CURRENT_BINARY_DIR} -name "CMakeCache.txt" | xargs rm -rf
    COMMAND find
    ARGS ${CMAKE_CURRENT_BINARY_DIR} -name "CMakeFiles" | xargs rm -rf
    COMMAND find
    ARGS ${CMAKE_CURRENT_BINARY_DIR} -name "Makefile" | xargs rm -rf
    COMMAND find
    ARGS ${CMAKE_CURRENT_BINARY_DIR} -name " *~" | xargs rm -rf
    COMMAND rm
    ARGS    -Rf CMakeTmp ${DISTCLEAN_FILES1} ${DISTCLEAN_FILES2}
    TARGET  distclean)
ENDIF(UNIX)
