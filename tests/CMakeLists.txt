include_directories(${GFLAGS_INCLUDE_DIRS})
include_directories(${GTEST_INCLUDE_DIRS})
include_directories(${PROJECT_SOURCE_DIR}/src)

# fake_child_helper
add_executable(helloworld_test helloworld_test.cpp)
target_link_libraries(helloworld_test helloworld)
target_link_libraries(helloworld_test ${GTEST_LIBRARIES})
target_link_libraries(helloworld_test ${GFLAGS_LIBRARIES})

# testsuit
FILE(GLOB TESTSUIT_SRC_LIST testsuit_gtest.cpp)
FILE(GLOB_RECURSE TESTSUIT_RSC_LIST files/*)
add_executable(testsuit_gtest ${TESTSUIT_SRC_LIST} ${TESTSUIT_RSC_LIST})
target_link_libraries(testsuit_gtest helloworld)
target_link_libraries(testsuit_gtest ${GTEST_LIBRARIES})
target_link_libraries(testsuit_gtest ${GFLAGS_LIBRARIES})

# tests
add_test(unittests testsuit)
