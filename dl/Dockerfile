# Dockerfile for TileDB and R                   Emacs make this a -*- mode: makefile; -*-

# Rocker r-base is Debian testing, hence "current" and reasonably complete
FROM r-base

LABEL org.label-schema.license="MIT" \
      org.label-schema.vcs-url="https://github.com/rocker-tiledb/" \
      org.label-schema.vendor="Local Build, not a Rocker or TileDB product" \
      maintainer="Dirk Eddelbuettel <edd@debian.org>"

COPY eddelbuettel-ppa.list /etc/apt/sources.list.d

RUN apt-get update && apt-get install -y -t unstable --no-install-recommends \
    catch2 \
    cmake \
    git \
    libaws-c-common-dev \
    libaws-c-event-stream-dev \
    libaws-checksums-dev \
    libaws-sdk-cpp-only-s3-dev \
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
    r-cran-rcpp \
    r-cran-rmarkdown \
    r-cran-tinytest \
    r-cran-zoo \
    && apt-get clean \
    && install.r minidown palmerpenguins nycflights13 simplermarkdown

ENV _R_CHECK_FORCE_SUGGESTS_ false

CMD ["bash"]
