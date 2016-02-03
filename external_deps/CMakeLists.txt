cmake_minimum_required(VERSION 2.8)
include(ExternalProject)

# This subdirectory resolve gflags, glog and gtest as external deps
# Do as follows to add all targets your project and resolve variables.
# add_subdirectory(${PROJECT_SOURCE_DIR}/external_deps/ EXCLUDE_FROM_ALL)
# Or, do as follows to only resolve variables
# add_subdirectory(${PROJECT_SOURCE_DIR}/external_deps/)

# gflags
include("gflags.cmake")
# glog
include("glog.cmake")
# gtests
include("gtest.cmake")
