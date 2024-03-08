FROM ubuntu:jammy

LABEL Description="MiKTeX build environment, Ubuntu 22.04" Vendor="Christian Schenk" Version="24.3.8"

RUN \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        bison \
        ca-certificates \
        cmake \
        curl \
        dpkg-dev \
        file \
        flex \
        g++ \
        gcc \
        gettext \
        git \
        gosu \
        libboost-locale-dev \
        libbz2-dev \
        libcairo2-dev \
        libcurl4-openssl-dev \
        libfribidi-dev \
        libgd-dev \
        libgmp-dev \
        libgraphite2-dev \
        libhunspell-dev \
        libicu-dev \
        liblog4cxx-dev \
        libmpfi-dev \
        libmpfr-dev \
        libmspack-dev \
        libpopt-dev \
        libpotrace-dev \
        libssl-dev \
        liburiparser-dev \
        libzzip-dev \
        make \
        xsltproc \
        xz-utils

RUN \
    apt-get install -y --no-install-recommends \
        libgl1-mesa-dev \
        libglx-dev \
        libqt6core5compat6-dev \
        libqt6opengl6-dev \
        qt6-base-dev \
        qt6-declarative-dev \
        qt6-l10n-tools \
        qt6-tools-dev \
        qt6-tools-dev-tools

RUN mkdir /miktex
WORKDIR /miktex

COPY scripts/*.sh /miktex/
COPY entrypoint.sh /miktex/

ENTRYPOINT ["/miktex/entrypoint.sh"]
CMD ["/miktex/make-package.sh"]
