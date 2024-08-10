#include "math/operations.hpp"

#include <wheels/logging/logging.hpp>

#include <iostream>

int main() {
  LOG_DEBUG("function call: main");
  std::cout << math::Sum(4, 3) << std::endl;
  return 0;
}
