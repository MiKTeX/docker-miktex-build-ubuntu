#!/bin/sh -e
if [ ! -f /miktex/build/Makefile ] || [ ! -z ${1+x} ]; then
    /miktex/configure.sh $1
fi
cd /miktex/build
make
make test
make package
