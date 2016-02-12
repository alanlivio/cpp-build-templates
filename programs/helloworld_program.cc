/* Copyright 2014 libtemplate team */

#include "helloworld/helloworld.h"
#include <iostream>

using ::std::cout;
using ::std::endl;

int main(int argc, char **argv) {
  HelloWorld test;
  cout << test.get_hello_msg() << endl;
  return 0;
}
