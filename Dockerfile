FROM ubuntu:xenial

LABEL Description="MiKTeX build environment, Ubuntu 16.04" Vendor="Christian Schenk" Version="2.9.7385"

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
           git \
           libbz2-dev \
           libcairo2-dev \
           libcurl4-openssl-dev \
           libfribidi-dev \
           libgd-dev \
           libgmp-dev \
           libgraphite2-dev \
           libhunspell-dev \
           libicu-dev \
           liblog4cxx10-dev \
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
           qttools5-dev-tools \
           xsltproc \
           xz-utils

RUN    curl --fail --location --show-error --silent https://cmake.org/files/v3.14/cmake-3.14.3-Linux-x86_64.tar.gz \
     | tar -xz --strip=1 -C /usr/local

RUN    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.4/gosu-$(dpkg --print-architecture)" \
    && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.4/gosu-$(dpkg --print-architecture).asc" \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu

RUN mkdir /miktex
WORKDIR /miktex

COPY scripts/*.sh /miktex/
COPY entrypoint.sh /miktex/

ENTRYPOINT ["/miktex/entrypoint.sh"]
CMD ["/miktex/make-package.sh"]
