# Dockerfile for TileDB and R                   Emacs make this a -*- mode: makefile; -*-

# Rocker r-base is Debian testing, hence "current" and reasonably complete
FROM r-base

LABEL org.label-schema.license="MIT" \
      org.label-schema.vcs-url="https://github.com/rocker-tiledb/" \
      org.label-schema.vendor="Local Build, not a Rocker or TileDB product" \
      maintainer="Dirk Eddelbuettel <edd@debian.org>"

COPY eddelbuettel-ppa.list /etc/apt/sources.list.d

RUN apt-get update && apt-get install -y -t unstable --no-install-recommends \
    cmake \
    git \
    libaws-c-common-dev \
    libaws-c-event-stream-dev \
    libaws-checksums-dev \
    libaws-sdk-cpp-only-s3-dev \
    libcurl4-openssl-dev \
    liblz4-dev \
    libssl-dev \
    libtbb-dev \
    libzstd-dev \
    r-cran-bit64 \
    r-cran-data.table \
    r-cran-rcpp \
    r-cran-testthat \
    r-cran-tinytest \
    r-cran-zoo \
    && apt-get clean \
    && install.r nanotime

ENV _R_CHECK_FORCE_SUGGESTS_ false

RUN cd /home/docker \
    && git clone --single-branch --branch release-2.0.2 https://github.com/TileDB-Inc/TileDB.git tiledb \
    && cd tiledb \
    && mkdir build \
    && cd build \
    && export AWSSDK_ROOT_DIR=/usr \
    && ../bootstrap --prefix=/usr/local --enable-s3 --enable-serialization \
    && make -j 8 \
    && make -C tiledb install \
    && ldconfig \
    && cd /home/docker \
    && rm -rf tiledb

CMD ["bash"]
