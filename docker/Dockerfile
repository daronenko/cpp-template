FROM ubuntu:latest

WORKDIR /cpp-template

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates \
        sudo \
        git \
        make \
        cmake \
        clang \
        gdb \
        ccache && \
    rm -rf /var/lib/apt/lists/*
