/* Copyright 2014 libtemplate team */

#ifndef HELLOWORLD_HELLOWORLD_H_
#define HELLOWORLD_HELLOWORLD_H_

class HelloWorld {
 public:
  HelloWorld();
  const char *
  get_hello_msg();

 private:
  const char * hello_;
};

#endif  // HELLOWORLD_HELLOWORLD_H_
