/* Copyright 2014 libtemplate team */

#include "gtest/gtest.h"
#include "helloworld/helloworld.h"
#include <cassert>
#include <cstring>
#include <iostream>

using ::std::cout;

int main(int argc, char **argv) {
  HelloWorld test;
  assert(strcmp("Hello world!", test.get_hello_msg()) == 0);
  return EXIT_SUCCESS;
}
