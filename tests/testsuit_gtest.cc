/* Copyright 2014 libtemplate team */

#include "gtest/gtest.h"
#include "helloworld/helloworld.h"
#include <iostream>

using ::std::cout;

TEST(HelloWorld, testGetHello) {
  HelloWorld test;
  EXPECT_STREQ("Hello world!", test.GetHello());
}

int main(int argc, char **argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
