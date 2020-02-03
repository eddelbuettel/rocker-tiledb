# Dockerfile for TileDB and R

# Rocker r-base is Debian testing, hence "current" and reasonably complete
FROM r-base

LABEL org.label-schema.license="GPL-2.0" \
      org.label-schema.vcs-url="https://github.com/rocker-tiledb/" \
      org.label-schema.vendor="Local Build, not a Rocker or TileDB product" \
      maintainer="Dirk Eddelbuettel <edd@debian.org>"

RUN apt-get update && apt-get install -y -t unstable --no-install-recommends \
    cmake \
    git \
    r-cran-data.table \
    r-cran-rcpp \
    r-cran-testthat \
    && apt-get clean \
    install.r tinytest
    
ENV _R_CHECK_FORCE_SUGGESTS_ false

RUN cd /home/docker \
    && git clone --single-branch --branch release-1.7.4 https://github.com/TileDB-Inc/TileDB.git tiledb \
    && cd tiledb \
    && mkdir build \
    && cd build \
    && ../bootstrap --prefix=/usr/local --enable-serialization \
    && make -j 8 \
    && make -C tiledb install \
    && ldconfig \
    && cd /home/docker \
    && rm -rf tiledb

## "parked" config: --enable-s3

CMD ["bash"]
