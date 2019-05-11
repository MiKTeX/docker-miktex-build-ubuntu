FROM ubuntu:bionic

LABEL Description="MiKTeX build environment, Ubuntu 18.04" Vendor="Christian Schenk" Version="2.9.7070"

RUN    apt-get update \
    && apt-get install -y --no-install-recommends \
           bison \
           ca-certificates \
           curl \
           dpkg-dev \
           file \
           flex \
           g++ \
           gcc \
           gosu \
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
           libmpfr-dev \
           libmspack-dev \
           libpopt-dev \
           libpotrace-dev \
           libssl-dev \
           liburiparser-dev \
           libzzip-dev \
           make \
           qtbase5-dev \
           qtscript5-dev \
           qttools5-dev \
           xsltproc \
           xz-utils

RUN    curl --fail --location --show-error --silent https://cmake.org/files/v3.14/cmake-3.14.3-Linux-x86_64.tar.gz \
     | tar -xz --strip=1 -C /usr/local

RUN mkdir /miktex
WORKDIR /miktex

COPY scripts/*.sh /miktex/
COPY entrypoint.sh /miktex/

ENTRYPOINT ["/miktex/entrypoint.sh"]
CMD ["/miktex/make-package.sh"]
