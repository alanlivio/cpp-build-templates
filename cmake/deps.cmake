find_package(PkgConfig)

# libplatinumkit
pkg_check_modules(LIBPLATINUMKIT REQUIRED libplatinumkit)
# libxml-2.0
pkg_check_modules(LIBXML2 REQUIRED libxml-2.0)
# libzip
pkg_check_modules(LIBZIP REQUIRED libzip)
# gflags
find_package(gflags QUIET)
# glog
find_package(glog QUIET)
# gtest
find_package(gTest QUIET)
# resolve not founded gflags, glog and gtest
add_subdirectory(${PROJECT_SOURCE_DIR}/external_deps/ EXCLUDE_FROM_ALL)
