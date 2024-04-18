#FROM rocker/r2u:20.04
FROM rocker/r2u:22.04

RUN Rscript -e 'install.packages(c(\
    "R6",                       \
    "RcppCCTZ",                 \
    "RcppDate",                 \
    "RcppSpdlog",               \
    "Seurat",                   \
    "SeuratObject",             \
    "Signac",                   \
    "SingleCellExperiment",     \
    "arrow",                    \
    "assertthat",               \
    "base64enc",                \
    "bit64",                    \
    "cpp11",                    \
    "glue",                     \
    "httr",                     \
    "jsonlite",                 \
    "mmap",                     \                           
    "nanoarrow",                \
    "nanotime",                 \
    "remotes",                  \
    "rlang",                    \
    "tidyselect",               \
    "tiledb",                   \
    "vctrs",                    \
    "zoo"                       ))'

RUN apt update -qqq && apt install -y cmake git curl

# -- tiledb from r2u/CRAN instead above (also on chanzuckerberg and tiledb-inc r-universe repos)
## RUN Rscript -e 'remotes::install_github("TileDB-Inc/TileDB-R", "0.26.0")'

COPY tiledbudf_0.0.3.tar.gz tiledbinotify_0.0.4.tar.gz /tmp/
RUN cd /tmp && \
    R CMD INSTALL tiledbinotify_0.0.4.tar.gz && \
    R CMD INSTALL tiledbudf_0.0.3.tar.gz

RUN Rscript -e 'remotes::install_github("satijalab/seurat", "v4.4.0", upgrade="never"); \
                remotes::install_github("mojaveazure/seurat-object", "v4.1.4", upgrade="never")'

RUN mkdir /opt/tiledbsoma-0.1-R && \
    Rscript -e "remotes::install_github('single-cell-data/TileDB-SOMA', '0.1.22', subdir='apis/r', lib='/opt/tiledbsoma-0.1-R', upgrade='never')"
    
RUN Rscript -e 'install.packages(c("tiledbsoma", "cellxgene.census"), repos=c(universe="https://chanzuckerberg.r-universe.dev/bin/linux/jammy/4.3", CRAN="https://cloud.r-project.org"))'

RUN Rscript -e "remotes::install_github('TileDB-Inc/TileDB-Cloud-R', 'v0.0.11', upgrade='never')"
