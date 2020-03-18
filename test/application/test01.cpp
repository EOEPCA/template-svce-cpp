
#include <eoepca/application.h>

#include <memory>

#include "gtest/gtest.h"

TEST(Expected, theEq) {
  std::string theValue("echo");
  auto app = std::make_unique<EOEPCA::Application>();

  EXPECT_EQ(theValue, app->echo(theValue));
}
