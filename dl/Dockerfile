# Dockerfile for TileDB and R                   Emacs make this a -*- mode: makefile; -*-

# Rocker r-base is Debian testing, hence "current" and reasonably complete
FROM r-base

LABEL org.label-schema.license="MIT" \
      org.label-schema.vcs-url="https://github.com/rocker-tiledb/" \
      org.label-schema.vendor="Local Build, not a Rocker or TileDB product" \
      maintainer="Dirk Eddelbuettel <edd@debian.org>"

COPY eddelbuettel-ppa.list /etc/apt/sources.list.d
#COPY Renviron.site /etc/R/
#-t unstable
RUN apt-get update && apt-get install -y --no-install-recommends \
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
    r-cran-rcppspdlog \
    r-cran-rmarkdown \
    r-cran-simplermarkdown \
    r-cran-tibble \
    r-cran-tinytest \
    r-cran-zoo \
    && apt-get clean \
    && install.r nycflights13

ENV _R_CHECK_FORCE_SUGGESTS_ false

CMD ["bash"]
