set(GTEST_INCLUDE_DIRS ${CMAKE_CURRENT_LIST_DIR}/gtest/include/)
include_directories(${GTEST_INCLUDE_DIRS})
include_directories(${PROJECT_SOURCE_DIR}/src)

# helloworld_test
add_executable(helloworld_test helloworld_test.cc)
target_link_libraries(helloworld_test helloworld)
target_link_libraries(helloworld_test ${GTEST_LIBRARIES})

# gtest_suit
FILE(GLOB TESTSUIT_SRC_LIST gtest_suit.cc gtest/src/gtest-all.cc)
FILE(GLOB_RECURSE TESTSUIT_RSC_LIST files/*)
add_executable(gtest_suit ${TESTSUIT_SRC_LIST} ${TESTSUIT_RSC_LIST})
target_include_directories(gtest_suit PRIVATE ${CMAKE_CURRENT_LIST_DIR}/gtest/)
target_link_libraries(gtest_suit ${CMAKE_THREAD_LIBS_INIT})
target_link_libraries(gtest_suit helloworld)

# tests
add_test(unittests gtest_suit)
