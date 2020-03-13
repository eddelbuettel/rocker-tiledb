# Dockerfile for TileDB and R

# Rocker r-base is Debian testing, hence "current" and reasonably complete
FROM eddelbuettel/rocker-tiledb:dev

LABEL org.label-schema.license="GPL-2.0" \
      org.label-schema.vcs-url="https://github.com/rocker-tiledb/" \
      org.label-schema.vendor="Local Build, not a Rocker or TileDB product" \
      maintainer="Dirk Eddelbuettel <edd@debian.org>"

RUN install.r remotes && installGithub.r TileDB-Inc/TileDB-R

CMD ["bash"]
