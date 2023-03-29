# Dockerfile for tiledb-soma 	                   Emacs make this a -*- mode: makefile; -*-

# Rocker r-base is Debian testing, hence "current" and reasonably complete
#FROM r-base
FROM eddelbuettel/r2u:jammy

#RUN apt-get update && apt-get install -y -t unstable --no-install-recommends \

## Unstable currently has python 3.11 which (due to numba) does not work with soma
RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y --no-install-recommends \
    python3-anndata \
    python3-pandas \
    python3-pybind11 \
    python3-pytest \
    python3-scipy \
    python-is-python3 \
    python3-pip \
    cmake \
    git

#    python3-tiledb \
#    python3-typeguard \

RUN git clone https://github.com/single-cell-data/TileDB-SOMA.git && \
    cd TileDB-SOMA/apis/python/ && \
    python -m pip install .

## then in container
##   mkdir -p testdata
##   apis/python/tools/ingestor --soco -o testdata/soco -n \
##        data/pbmc3k_processed.h5ad \
##        data/10x-pbmc-multiome-v1.0/subset_100_100.h5ad
