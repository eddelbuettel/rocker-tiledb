# Dockerfile for TileDB and R

# Based on Rocker r-base is Debian testing, hence "current" and reasonably complete
# Contains all that is needed to test 'tiledb', plus tiledb itself
# Adds a few BioConductor packages in order to test TileDBArray
FROM eddelbuettel/rocker-tiledb:run

LABEL org.label-schema.license="MIT" \
      org.label-schema.vcs-url="https://github.com/rocker-tiledb/" \
      org.label-schema.vendor="Local Build, not a Rocker or TileDB product" \
      maintainer="Dirk Eddelbuettel <edd@debian.org>"

## Add installBioc.r (befire it gets added to rocker/r-base "real soon now")
RUN cd /usr/local/bin/ \
    && ln -sf /usr/lib/R/site-library/littler/examples/installBioc.r . \
    && cd -

## Install what is needed for TileDBArray
## (here base64enc is CRAN, rest BioC; and matrixStats added as a dependency)
RUN installBioc.r \
    base64enc \
    BiocGenerics \
    DelayedArray \
    IRanges \
    S4Vectors

CMD ["bash"]
