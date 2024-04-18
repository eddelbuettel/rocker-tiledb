#!/bin/bash

## to build and run
# docker build -t soma -f ./soma-full-stack.dockerfile --progress=plain .
# docker run -v ./test:/test -it --rm --entrypoint /bin/bash soma

## then
. ~/.profile # add LD_LIBRARY_PATH
cd TileDB-SOMA/apis/r # chdir to tiledbsoma-r
Rscript -e 'install.packages("devtools"); devtools::load_all()' # install devtools, build compiled artifacts
valgrind --trace-children=yes -s --leak-check=full --max-threads=1024 Rscript -e 'testthat::test_local("tests/testthat")' 2>&1 | tee /test/valgrind-output.txt # run tests w/ valgrind; log to file
