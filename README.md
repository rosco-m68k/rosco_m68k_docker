## rosco_m68k Docker image

This is a Debian-based docker image with the rosco_m68k toolchain
preinstalled, for easy spin-up of the build tooling on any
Docker-supported platform.

### Getting started

You can just run the image - this will pull it automatically if
you don't have it locally:

```shell
docker run -it roscopeco/rosco_m68k

```

Or to just pull it:

```shell
docker pull roscopeco/rosco_m68k
```

### Based on

* `minideb` image from Bitnami

### What's included

* `m68k-elf-gcc` and related `binutils`
* `vasm` (all targets)
* srecord

### Copyright

Dockerfile and build Copyright (c)2023 Ross Bamford & Contributors.
Licensed under the MIT license.

This image consists of open-source software packages each of which
are covered by their own license. These licenses are unchanged by this
packaging-only project - See their respective LICENSE files.

