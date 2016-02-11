# includes
include_directories(${PROJECT_SOURCE_DIR}/src)

# helloworld lib
file(GLOB SRC_LIST "helloworld/*.cpp")
add_library(helloworld SHARED ${SRC_LIST})
