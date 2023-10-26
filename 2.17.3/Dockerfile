# Dockerfile for TileDB and R                   Emacs make this a -*- mode: makefile; -*-

# Rocker r-base is Debian testing, hence "current" and reasonably complete
FROM rocker/r2u

LABEL org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.source="https://github.com/rocker-tiledb/" \
      org.opencontainers.image.vendor="Local Build, not a Rocker or TileDB product" \
      org.opencontainers.image.authors="Dirk Eddelbuettel <edd@debian.org>"

# Note the explicit 'slower path' for bspm to get Suggests too
RUN apt update && \
    apt upgrade -y && \
    apt install -y --no-install-recommends cmake git valgrind && \
    Rscript -e 'options(bspm.version.check=TRUE); install.packages("tiledb", dependencies=TRUE)' && \
    apt-get clean

ENV _R_CHECK_FORCE_SUGGESTS_ false
#ENV VER release-2.9
ENV VER 2.17.3

#    && git clone --single-branch --branch ${VER} https://github.com/TileDB-Inc/TileDB.git tiledb \

RUN cd /home/docker \
    && wget https://github.com/TileDB-Inc/TileDB/archive/${VER}.tar.gz \
    && tar xaf ${VER}.tar.gz \
    && rm ${VER}.tar.gz \
    && mv TileDB-${VER} tiledb \
    && cd tiledb \
    && mkdir build \
    && cd build \
    && ../bootstrap --prefix=/usr/local --enable-s3 --enable-serialization --disable-werror \
    && make -j 8 \
    && make -C tiledb install \
    && ldconfig \
    && cd /home/docker \
    && rm -rf tiledb

CMD ["bash"]
