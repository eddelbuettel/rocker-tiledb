# Dockerfile for TileDB and R                   Emacs make this a -*- mode: makefile; -*-

# Rocker r-base is Debian testing, hence "current" and reasonably complete
FROM r-base

LABEL org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.source="https://github.com/rocker-tiledb/" \
      org.opencontainers.image.vendor="Local Build, not a Rocker or TileDB product" \
      org.opencontainers.image.authors="Dirk Eddelbuettel <edd@debian.org>"


COPY eddelbuettel-ppa.list /etc/apt/sources.list.d

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y -t unstable --no-install-recommends \
    catch2 \
    git \
    cmake \
    libaws-c-common-dev=0.4.59-1.debian.2 \
    libaws-c-event-stream-dev=0.1.6-1.debian.2 \
    libaws-checksums-dev=0.1.9-1.debian.3 \
    libaws-sdk-cpp-only-s3-dev=1.8.117-3.debian.2 \
    libcapnp-dev \
    libcurl4-openssl-dev \
    liblz4-dev \
    libspdlog-dev \
    libssl-dev \
    libzstd-dev \
    r-cran-bit64 \
    r-cran-bookdown \
    r-cran-curl \
    r-cran-data.table \
    r-cran-knitr \
    r-cran-matrix \
    r-cran-nanotime \
    r-cran-palmerpenguins \
    r-cran-rcpp \
    r-cran-rmarkdown \
    r-cran-rcppspdlog \
    r-cran-simplermarkdown \
    r-cran-spdl \
    r-cran-tibble \
    r-cran-tinytest \
    r-cran-zoo \
    valgrind \
    libv8-dev \
    && apt-get clean \
    && install.r nycflights13 RcppInt64
# libv8-dev can go out with minidown

ENV _R_CHECK_FORCE_SUGGESTS_ false
#ENV VER release-2.9
ENV VER 2.17.1

#    && git clone --single-branch --branch ${VER} https://github.com/TileDB-Inc/TileDB.git tiledb \

RUN cd /home/docker \
    && wget https://github.com/TileDB-Inc/TileDB/archive/${VER}.tar.gz \
    && tar xaf ${VER}.tar.gz \
    && rm ${VER}.tar.gz \
    && mv TileDB-${VER} tiledb \
    && cd tiledb \
    && mkdir build \
    && cd build \
    && export AWSSDK_ROOT_DIR=/usr \
    && ../bootstrap --prefix=/usr/local --enable-s3 --enable-serialization --disable-werror \
    && make -j 8 \
    && make -C tiledb install \
    && ldconfig \
    && cd /home/docker \
    && rm -rf tiledb

CMD ["bash"]
