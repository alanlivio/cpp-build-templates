include_directories(${GFLAGS_INCLUDE_DIRS})
include_directories(${GTEST_INCLUDE_DIRS})
include_directories(${PROJECT_SOURCE_DIR}/src)

add_executable(e0_program helloworld_program.cc)
link_directories(${FSMDA_LIBRARY_DIRS})
target_link_libraries(e0_program helloworld)
