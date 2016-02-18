set(GTEST_INCLUDE_DIRS ${CMAKE_CURRENT_LIST_DIR}/gtest/include/)
include_directories(${GTEST_INCLUDE_DIRS})
include_directories(${PROJECT_SOURCE_DIR}/src)

# gtest
add_library(gtest STATIC gtest/src/gtest-all.cc)
target_include_directories(gtest PRIVATE ${CMAKE_CURRENT_LIST_DIR}/gtest/)
target_link_libraries(gtest ${CMAKE_THREAD_LIBS_INIT})

# helloworld_test
add_executable(helloworld_test helloworld_test.cc)
target_link_libraries(helloworld_test helloworld)
target_link_libraries(helloworld_test ${GTEST_LIBRARIES})

# testsuit
FILE(GLOB TESTSUIT_SRC_LIST testsuit_gtest.cc)
FILE(GLOB_RECURSE TESTSUIT_RSC_LIST files/*)
add_executable(testsuit_gtest ${TESTSUIT_SRC_LIST} ${TESTSUIT_RSC_LIST})
target_link_libraries(testsuit_gtest helloworld gtest)

# tests
add_test(unittests testsuit_gtest)
