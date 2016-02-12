/* Copyright 2014 libtemplate team */

#include "helloworld/helloworld.h"

HelloWorld::HelloWorld() {
  this->hello_ = "Hello world!";
}

const char *
HelloWorld::get_hello_msg() {
  return this->hello_;
}
