# ***C++ project template using cmake.***

![C++](https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/C_plus_plus.svg/100px-C_plus_plus.svg.png) ![Cmake](https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/Cmake.svg/96px-Cmake.svg.png)

## Features

This template provides support to:  

* Shared library
* Programs using the library
* [googletest](https://code.google.com/p/googletest/)
* [cpplint](https://github.com/google/styleguide/tree/gh-pages/cpplint)

## Build on ubuntu-based system

``` bashscript
sudo apt install g++ gdb pkg-config cmake ninja-build
mkdir _build
cd build
cmake .
ninja
```

## References

Other github projects were used as inspiration and reference.

* https://github.com/NewProggie/Cpp-Project-Template
* https://github.com/adairdavid/cpp-project-template
