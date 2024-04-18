FROM ubuntu:jammy

RUN apt-get update && \
    apt-get install -y cmake git zip valgrind && \
    git clone -b ph/feat/blockwise-reader https://github.com/single-cell-data/TileDB-SOMA.git

RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y tzdata

WORKDIR /TileDB-SOMA/apis/r

RUN tools/r-ci.sh bootstrap && \
    tools/r-ci.sh install_bioc SingleCellExperiment && \
    tools/r-ci.sh install_all

WORKDIR /

RUN R CMD build --no-build-vignettes --no-manual TileDB-SOMA/apis/r

RUN mkdir -vp /TileDB-SOMA/libtiledbsoma/build

WORKDIR /TileDB-SOMA/libtiledbsoma/build

RUN cmake \
    -DTILEDBSOMA_BUILD_CLI=OFF \
    -DTILEDBSOMA_ENABLE_TESTING=OFF \
    -DOVERRIDE_INSTALL_PREFIX=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr/local \
    ..
RUN make
# RUN make install-libtiledbsoma

WORKDIR /

RUN echo "export CI=docker" | tee -a ~/.profile && \
    echo "export LD_LIBRARY_PATH=$(dirname $(find / -name 'libtiledbsoma.so'))" | tee -a ~/.profile && \
    echo "export _R_CHECK_TESTS_NLINES_=0" | tee -a ~/.profile

# date +%Y-%m-%d-%R:%S
