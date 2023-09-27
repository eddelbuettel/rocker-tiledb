# Dockerfile for TileDB and R                   Emacs make this a -*- mode: makefile; -*-

# Rocker r-base is Debian testing, hence "current" and reasonably complete
FROM r-base

LABEL org.label-schema.license="MIT" \
      org.label-schema.vcs-url="https://github.com/rocker-tiledb/" \
      org.label-schema.vendor="Local Build, not a Rocker or TileDB product" \
      maintainer="Dirk Eddelbuettel <edd@debian.org>"

COPY eddelbuettel-ppa.list /etc/apt/sources.list.d
#COPY 0001-Add-option-to-use-AWS-SDK-for-S3-from-usr.patch /tmp
#COPY 0002-s3-string-fix.patch /tmp
#COPY Renviron.site /etc/R/

RUN apt-get update && apt-get install -y -t unstable --no-install-recommends \
    catch2 \
    cmake \
    git \
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
    && apt-get clean \
    && install.r nycflights13 RcppInt64

ENV _R_CHECK_FORCE_SUGGESTS_ false

RUN cd /home/docker \
    && git clone --single-branch --branch dev https://github.com/TileDB-Inc/TileDB.git tiledb \
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
