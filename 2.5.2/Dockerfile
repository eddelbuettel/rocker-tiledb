# Dockerfile for TileDB and R                   Emacs make this a -*- mode: makefile; -*-

# Rocker r-base is Debian testing, hence "current" and reasonably complete
FROM r-base

LABEL org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.source="https://github.com/rocker-tiledb/" \
      org.opencontainers.image.vendor="Local Build, not a Rocker or TileDB product" \
      org.opencontainers.image.authors="Dirk Eddelbuettel <edd@debian.org>"


COPY eddelbuettel-ppa.list /etc/apt/sources.list.d

RUN apt-get update && apt-get install -y -t unstable --no-install-recommends \
    catch \
    git \
    cmake \
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
    r-cran-bookdown \
    r-cran-curl \
    r-cran-data.table \
    r-cran-knitr \
    r-cran-matrix \
    r-cran-nanotime \
    r-cran-rcpp \
    r-cran-rmarkdown \
    r-cran-testthat \
    r-cran-tinytest \
    r-cran-zoo \
    valgrind \
    && apt install -y --allow-downgrades cmake=3.21.4-1 cmake-data=3.21.4-1 \
    && apt-get clean \
    && install.r minidown palmerpenguins nycflights13

CMD ["bash"]
