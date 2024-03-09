#!/bin/sh
package_revision=${1-1}
cd /miktex/build
cmake \
    -DMIKTEX_PACKAGE_REVISION=${package_revision} \
    -DMIKTEX_LINUX_DIST=ubuntu \
    -DMIKTEX_LINUX_DIST_VERSION=22.04 \
    -DMIKTEX_LINUX_DIST_CODE_NAME=jammy \
    -DUSE_SYSTEM_HARFBUZZ=FALSE \
    -DUSE_SYSTEM_HARFBUZZ_ICU=FALSE \
    -DUSE_SYSTEM_MPFI=FALSE \
    -DUSE_SYSTEM_MPFR=FALSE \
    -DWITH_UI_QT=TRUE \
    /miktex/source
