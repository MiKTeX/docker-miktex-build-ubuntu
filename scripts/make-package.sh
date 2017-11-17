#!/bin/sh
if [ ! -f /miktex/build/Makefile ]; then
    /miktex/configure.sh
fi
cd /miktex/build
make
make test
make package
