# Dockerfile for TileDB and R                   Emacs make this a -*- mode: makefile; -*-

FROM rocker/r2u

LABEL org.label-schema.license="MIT" \
      org.label-schema.vcs-url="https://github.com/rocker-tiledb/" \
      org.label-schema.vendor="Local Build, not a Rocker or TileDB product" \
      maintainer="Dirk Eddelbuettel <edd@debian.org>"

RUN apt update \
    && apt upgrade -y \
    && apt install -y --no-install-recommends cmake curl git valgrind \
    && Rscript -e 'install.packages("tiledb", dependencies=TRUE)' \
    && apt-get clean

ENV _R_CHECK_FORCE_SUGGESTS_ false

CMD ["bash"]
