#include "operations.hpp"

#include <wheels/logging/logging.hpp>


namespace math {

std::int64_t Sum(std::int64_t a, std::int64_t b) {
    LOG_DEBUG("function call: sum");
    return a + b;
}

}  // namespace math
