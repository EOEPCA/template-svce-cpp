#include "gtest/gtest.h"



TEST(Expected,theEq){

  int A=2;

  EXPECT_EQ(1,--A);
}

TEST(Expected,theTrue){


EXPECT_TRUE(true);
}


int main(int argc, char** argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
