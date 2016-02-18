# gtest
This directory contains [Google Test 1.7 release](https://github.com/google/googletest/archive/release-1.7.0.zip), with all elements removed except for
the actual source code.

### Cleanup:
```
rm -rf CHANGES  CMakeLists.txt  CONTRIBUTORS Makefile.am \
  README build-aux/ cmake/ codegear/ configure.ac m4 make/ \
  msvc/ samples/ scripts/ test/ xcode
rm -f `find . -name \*\.pump`
rm -f src/gtest_main.cc
```