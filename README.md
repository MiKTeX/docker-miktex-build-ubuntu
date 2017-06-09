# Ubuntu "Xenial" docker image with MiKTeX build environment

## Obtaining the image

Get the latest image from the registry:

    docker pull miktex/docker-miktex-build-xenial

or build it yourself:

    docker build --tag miktex/docker-miktex-build-xenial .

## Using the image

### Prerequisites

MiKTeX source code must be mounted to the container path
`/miktex/source` and the build directory must be mounted to the
container path `/miktex/build`.

### Example

You can create the MiKTEX deb as follows:

    mkdir ~/work/miktex
    mkdir ~/work/miktex/source
    mkdir ~/work/miktex/build-xenial
    curl -fsSL https://miktex.org/download/ctan/systems/win32/miktex/source/miktex-2.9.tar.xz | tar -xJ --strip-components=1 -C ~/work/miktex/source
    docker run -t -v ~/work/miktex/source:/miktex/source:ro -v ~/work/miktex/build-xenial:/miktex/build:rw miktex/docker-miktex-build-xenial /miktex/make-package.sh
