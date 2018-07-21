FROM ubuntu:latest

LABEL Description="MiKTeX build environment, Ubuntu latest" Vendor="Christian Schenk" Version="2.9.6776"

RUN    apt-get update \
    && apt-get install -y --no-install-recommends \
           bison \
           ca-certificates \
           cmake \
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

RUN mkdir /miktex
WORKDIR /miktex

COPY scripts/*.sh /miktex/
COPY entrypoint.sh /miktex/

ENTRYPOINT ["/miktex/entrypoint.sh"]
CMD ["/miktex/make-package.sh"]
