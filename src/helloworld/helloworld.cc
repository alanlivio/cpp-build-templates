/* Copyright 2014 libtemplate team */

#include "helloworld/helloworld.h"

HelloWorld::HelloWorld() {
  this->hello_ = "Hello world!";
}

const char *
HelloWorld::GetHello() {
  return this->hello_;
}
