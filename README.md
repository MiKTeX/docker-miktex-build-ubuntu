# Ubuntu docker image with MiKTeX build environment

## Obtaining the image

Get the latest image from the registry:

    docker pull miktex/miktex-build-ubuntu:latest

or build it yourself:

    docker build --tag miktex/miktex-build-ubuntu:latest .

## Using the image

### Prerequisites

MiKTeX source code must be mounted to the container path
`/miktex/source` and the build directory must be mounted to the
container path `/miktex/build`.

You should specify a user by setting the container environment
variables `USER_ID` and `GROUP_ID`.

### Example

Build the MiKTeX deb package:

    mkdir -p ~/work/miktex/source
    mkdir -p ~/work/miktex/builds/ubuntu-latest
    curl -fsSL https://miktex.org/download/ctan/systems/win32/miktex/source/miktex-2.9.tar.xz | \
      tar -xJ --strip-components=1 -C ~/work/miktex/source
    docker run -t \
      -v ~/work/miktex/source:/miktex/source:ro \
      -v ~/work/miktex/builds/ubuntu-latest:/miktex/build:rw \
      -e USER_ID=`id -u` \
      -e GROUP_ID=`id -g` \
      miktex/miktex-build-ubuntu:latest

The build artifact `miktex-*.deb` will be written to
`~/work/miktex/builds/ubuntu-latest`.
