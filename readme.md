<div align="center">

# cpp-template

simple and powerful template for your projects in c++

</div>

## Contents

- [Features](#features)
- [Dependencies](#dependencies)
- [Getting Started](#getting-started)
- [Commands](#commands)
  - [Debug](#debug-commands)
  - [Release](#release-commands)
  - [Other](#other-commands)
- [Inspired by](#inspired-by)
- [License](#license)

## Features <a name="features"></a>

- unit testing with [googletest](https://github.com/google/googletest)
- common components with [wheels](https://gitlab.com/Lipovsky/wheels)
- simple commands for all needs with [make](https://www.gnu.org/software/make/manual/make.html)
- containerization with [docker](https://www.docker.com) & [docker compose](https://docs.docker.com/compose/)
- code linting with [clang-tidy](https://clang.llvm.org/extra/clang-tidy)
- code formatting with [clang-format](https://clang.llvm.org/docs/ClangFormat.html)
- configured [ub](https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html), [address](https://clang.llvm.org/docs/AddressSanitizer.html) & [thread](https://clang.llvm.org/docs/ThreadSanitizer.html) sanitizers

## Dependencies <a name="dependencies"></a>

To run the project locally, you need to install the following dependencies:

- [cmake](https://cmake.org)
- [make](https://www.gnu.org/software/make/manual/make.html)

Optionally:

- [clang-format](https://clang.llvm.org/docs/ClangFormat.html) (for autoformatting)
- [clang-tidy](https://clang.llvm.org/extra/clang-tidy) (for linting)
- [docker](https://www.docker.com) & [docker compose](https://docs.docker.com/compose/) (for containerization)

## Getting Started <a name="getting-started"></a>

1. Click on the "Use this template" button and clone your repo:

```sh
git clone https://github.com/daronenko/cpp-template.git
```

2. Rename the project (only works on linux):

```sh
find . -not -path "./third_party/*" -not -path ".git/*" -not -path './build_*' -type f | xargs sed -i 's/cpp-template/<YOUR-PROJECT-NAME>/g'
```

You can check if everything has been replaced with:

```sh
grep -r "cpp-template" .
```

## Commands <a name="commands"></a>

### Debug <a name="debug-commands"></a>

- `make build-debug` - build debug version
- `make start-debug` - run debug version
- `make test-debug` - build debug, unit tests and run tests
- `make clean-debug` - remove `build_debug` directory (also works for docker)
- `make install-debug` - install debug version of project in `/usr/local/bin/`
- `make docker-build-debug` - build debug in docker
- `make docker-start-debug` - run the container with debug version
- `make docker-test-debug` - build debug and run tests

### Release <a name="release-commands"></a>

- `make` - test and run release version of project
- `make build-release` - build release version
- `make start-release` - run release version
- `make test-release` - build release, unit tests and run tests
- `make clean-release` - remove `build_release` directory (also works for docker)
- `make install` or `make install-release` - install release version of project in `/usr/local/bin/`
- `make docker-build-release` - build release in docker
- `make docker-start-release` - run the container with release version
- `make docker-test-release` - build release and run tests

### Other <a name="other-commands"></a>

- `make format` - autoformat `.cpp` and `.hpp` files
- `make lint` - check `.cpp` and `.hpp` files with linter
- `make clean-docker` - stop and remove container

## Inspired by <a name="inspired-by"></a>

- [userver-framework/service_template](https://github.com/userver-framework/service_template)
- [Lipovsky/wheels](https://gitlab.com/Lipovsky/wheels)

## License <a name="license"></a>

Distributed under the MIT License. See [LICENSE](https://github.com/daronenko/cpp-template/blob/main/LICENSE) for more information.
