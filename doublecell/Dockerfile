              
## Start from an Ubuntu base with CRAN binaries, can be substituted with any other R-on-Linux setup
FROM eddelbuettel/r2u:jammy

## Install all Imports, Suggests, LinkingTo of tiledb-soma (from main and main-old)
RUN install.r R6 Matrix bit64 tiledb arrow fs glue urltools Rcpp dplyr data.table spdl \
    rmarkdown knitr withr testthat SeuratObject jsonlite vctrs SummarizedExperiment SingleCellExperiment && \
    Rscript -e 'bspm::disable(); install.packages("pbmc3k.tiledb", repos="https://ghrr.github.io/drat")' && \
    apt install --yes --no-install-recommends cmake git

## The main-old branch installs from github
RUN mkdir /usr/local/lib/R/singlecell-prev && \
    Rscript -e 'bspm::disable(); .libPaths("/usr/local/lib/R/singlecell-prev"); remotes::install_github("single-cell-data/TileDB-SOMA", subdir="apis/r", ref="main-old")'

## The main branch needs a build of libtiledbsoma first
RUN git clone --branch main --single-branch https://github.com/single-cell-data/TileDB-SOMA.git tiledbsoma && \
    cd tiledbsoma/apis/r && \
    ./copy_source.sh && \
    R CMD build . && \
    mkdir /usr/local/lib/R/singlecell-current && \
    R CMD INSTALL -l /usr/local/lib/R/singlecell-current tiledbsoma_*tar.gz 
    
