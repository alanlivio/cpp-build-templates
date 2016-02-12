# includes
include_directories(${PROJECT_SOURCE_DIR}/src)

# helloworld lib
file(GLOB SRC_LIST "helloworld/*.cc" "helloworld/*.h")
add_library(helloworld SHARED ${SRC_LIST})
