find_package(PkgConfig)

# gflags
find_package(gflags QUIET)
# glog
find_package(glog QUIET)
# gtest
find_package(gTest QUIET)
# resolve not founded gflags, glog and gtest
add_subdirectory(${PROJECT_SOURCE_DIR}/external_deps/ EXCLUDE_FROM_ALL)
