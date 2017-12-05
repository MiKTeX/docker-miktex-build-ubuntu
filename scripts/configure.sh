#!/bin/sh
cd /miktex/build
cmake \
    -DUSE_SYSTEM_HARFBUZZ=FALSE \
    -DUSE_SYSTEM_HARFBUZZ_ICU=FALSE \
    -DUSE_SYSTEM_POPPLER=FALSE \
    -DUSE_SYSTEM_POPPLER_QT5=FALSE \
    -DWITH_UI_QT=TRUE \
    /miktex/source
