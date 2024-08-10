CMAKE_COMMON_FLAGS ?= -DCMAKE_EXPORT_COMPILE_COMMANDS=1
CMAKE_DEBUG_FLAGS ?=
CMAKE_RELEASE_FLAGS ?=
NPROCS ?= $(shell nproc)

CLANG_FORMAT ?= clang-format
CLANG_TIDY ?= clang-tidy

DOCKER ?= docker
DOCKER_COMPOSE ?= docker compose

# use Makefile.local for customization
-include Makefile.local

CMAKE_DEBUG_FLAGS += -DCMAKE_BUILD_TYPE=Debug $(CMAKE_COMMON_FLAGS)
CMAKE_RELEASE_FLAGS += -DCMAKE_BUILD_TYPE=Release $(CMAKE_COMMON_FLAGS)

.PHONY: all
all: build-release test-release start-release

.PHONY: cmake-debug
cmake-debug:
	cmake -B build_debug $(CMAKE_DEBUG_FLAGS)

.PHONY: cmake-release
cmake-release:
	cmake -B build_release $(CMAKE_RELEASE_FLAGS)

build_debug/CMakeCache.txt: cmake-debug
build_release/CMakeCache.txt: cmake-release

.PHONY: build-debug build-release
build-debug build-release: build-%: build_%/CMakeCache.txt
	cmake --build build_$* -j $(NPROCS) --target cpp-template

.PHONY: test-debug test-release
test-debug test-release: test-%:
	cmake --build build_$* -j $(NPROCS) --target cpp-template_unittest
	build_$*/tests/cpp-template_unittest

.PHONY: start-debug start-release
start-debug start-release: start-%:
	build_$*/src/cpp-template

.PHONY: clean-debug clean-release
clean-debug clean-release: clean-%:
	rm -rf build_$*

.PHONY: install-debug
install-debug:
	cmake --install build_debug -v --component delivery_service

.PHONY: install-release
install-release: build-release
	cmake --install build_release -v --component delivery_service

.PHONY: install
install: install-release

.PHONY: format
format:
	find src tests -name '*pp' -type f | xargs $(CLANG_FORMAT) -i

.PHONY: lint
lint:
	find src tests -name '*pp' -type f | xargs $(CLANG_TIDY) -p build_$*

.PHONY: --in-docker-start-debug --in-docker-start-release
--in-docker-start-debug --in-docker-start-release: --in-docker-start-%: install-%
	/home/user/.local/bin/cpp-template

.PHONY: docker-start-debug docker-start-release
docker-start-debug docker-start-release: docker-start-%:
	$(DOCKER_COMPOSE) -f docker/docker-compose.yml run --rm cpp-template-container make -- --in-docker-start-$*

.PHONY: docker-cmake-debug docker-build-debug docker-test-debug docker-clean-debug docker-install-debug docker-cmake-release docker-build-release docker-test-release docker-clean-release docker-install-release
docker-cmake-debug docker-build-debug docker-test-debug docker-clean-debug docker-install-debug docker-cmake-release docker-build-release docker-test-release docker-clean-release docker-install-release: docker-%:
	$(DOCKER_COMPOSE) -f docker/docker-compose.yml run --rm cpp-template-container make $*

.PHONY: clean-docker
clean-docker:
	$(DOCKER_COMPOSE) -f docker/docker-compose.yml down -v
