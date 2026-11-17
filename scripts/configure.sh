#!/bin/sh
package_revision=${1-1}
cd /miktex/build
cmake \
    -DMIKTEX_PACKAGE_REVISION=${package_revision} \
    -DMIKTEX_LINUX_DIST=ubuntu \
    -DMIKTEX_LINUX_DIST_VERSION=26.04 \
    -DMIKTEX_LINUX_DIST_CODE_NAME=resolute \
    -DWITH_UI_QT=TRUE \
    /miktex/source
