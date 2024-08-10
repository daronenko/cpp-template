#include "math/operations.hpp"

#include <gtest/gtest.h>
#include <wheels/logging/logging.hpp>

TEST(OperationsTest, Basic) {
  LOG_DEBUG("Testing operations...");
  EXPECT_EQ(5, math::Sum(2, 3));
}
