FROM ubuntu:bionic

LABEL Description="MiKTeX build environment, Ubuntu 18.04" Vendor="Christian Schenk" Version="2.9.6699"

RUN    apt-get update \
    && apt-get install -y --no-install-recommends \
       	   ca-certificates \
	   cmake \
	   curl \
	   bison \
           dpkg-dev \
	   file \
           flex \
           g++ \
           gcc \
           gosu \
           make \
           xsltproc \
           xz-utils \
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
           qtbase5-dev \
           qtscript5-dev \
           qttools5-dev

RUN mkdir /miktex
WORKDIR /miktex

COPY scripts/*.sh /miktex/
COPY entrypoint.sh /miktex/

ENTRYPOINT ["/miktex/entrypoint.sh"]
CMD ["/miktex/make-package.sh"]
