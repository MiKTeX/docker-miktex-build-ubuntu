FROM ubuntu:xenial

LABEL Description="MiKTeX build environment, Ubuntu 16.04" Vendor="Christian Schenk" Version="2.9.6369"

RUN apt-get update

RUN apt-get install -y bison
RUN apt-get install -y dpkg-dev
RUN apt-get install -y flex
RUN apt-get install -y g++
RUN apt-get install -y gcc
RUN apt-get install -y make
RUN apt-get install -y xsltproc
RUN apt-get install -y xz-utils

RUN apt-get install -y libbz2-dev
RUN apt-get install -y libcairo2-dev
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y libfribidi-dev
RUN apt-get install -y libgd-dev
RUN apt-get install -y libgmp-dev
RUN apt-get install -y libgraphite2-dev
RUN apt-get install -y libhunspell-dev
RUN apt-get install -y libicu-dev
RUN apt-get install -y liblog4cxx10-dev
RUN apt-get install -y libmpfr-dev
RUN apt-get install -y libmspack-dev
RUN apt-get install -y libpoppler-dev
RUN apt-get install -y libpoppler-private-dev
RUN apt-get install -y libpopt-dev
RUN apt-get install -y libpotrace-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y liburiparser-dev
RUN apt-get install -y libzzip-dev

ADD https://cmake.org/files/v3.8/cmake-3.8.2-Linux-x86_64.tar.gz /tmp/cmake-3.8.2-Linux-x86_64.tar.gz
RUN tar -xz --strip=1 -C /usr/local -f /tmp/cmake-3.8.2-Linux-x86_64.tar.gz
RUN rm /tmp/cmake-3.8.2-Linux-x86_64.tar.gz

RUN mkdir /miktex
ADD scripts/*.sh /miktex/

WORKDIR /miktex
