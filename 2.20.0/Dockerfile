# Dockerfile for TileDB and R                   Emacs make this a -*- mode: makefile; -*-

FROM rocker/r2u

LABEL org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.source="https://github.com/rocker-tiledb/" \
      org.opencontainers.image.vendor="Local Build, not a Rocker or TileDB product" \
      org.opencontainers.image.authors="Dirk Eddelbuettel <edd@debian.org>"

# Note the explicit 'slower path' for bspm to get Suggests too
#options(bspm.version.check=TRUE);
RUN apt update && \
    apt upgrade -y && \
    apt install -y --no-install-recommends cmake curl git valgrind && \
    Rscript -e 'install.packages("tiledb", dependencies=TRUE)' && \
    apt-get clean

ENV _R_CHECK_FORCE_SUGGESTS_ false
#ENV VER release-2.19
ENV VER 2.20.0

RUN cd /home/docker \
    && git clone --single-branch --branch ${VER} https://github.com/TileDB-Inc/TileDB.git tiledb \
    && cd tiledb \
    && mkdir build \
    && cd build \
    && cmake -S .. \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr/local \
      -DTILEDB_S3=ON \
      -DTILEDB_SERIALIZATION=ON \
      -DVCPKG_TARGET_TRIPLET=x64-linux-release \
    && make -j 8 \
    && make -C tiledb install \
    && ldconfig \
    && cd /home/docker \
    && rm -rf tiledb

CMD ["bash"]
