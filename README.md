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

### Using for local development

The primary aim of the container right now is to give us a way to do
repeatable builds, and maybe allow us to do things like run tests
and whatnot in Github actions.

_However_, there is scope for making local development easier with 
the container - some notes on that are provided below.

> **Note** there are numerous quality-of-life improvements that could
> be implemented in the container to make local dev easier / more fun.
>
> If there's sufficient desire, we'll do that!

#### Mounting a local directory

> **Note** You could also go with mounting a local directory as the
> `/home/linuxbrew` directory in your container - this will allow 
> you to make persistent changes inside the home directory on the
> container.
>
> Without that, any changes you _do_ make in non-shared directories
> will **not** be persisted.

For ease of copying files between the container and your host, you
can mount a local directory inside the container with the `-v` option:

```shell
docker run -v "$(pwd)/rosco_m68k:/rosco_m68k" -it roscopeco/rosco_m68k
```

> **Note** if you already have the main `rosco_m68k` repository checked
> out locally, it's recommended to start with a fresh clone for this -
> otherwise it's likely you'll run into issues with binary compatibility
> between your host and the Linux inside the container.
>
> Just do `git clone https://github.com/rosco-m68k/rosco_m68k.git` in 
> some directory where you don't already have a clone to grab a fresh,
> and then pass in that path to the `-v` option (before the colon).

#### zsh setup

By default, the container will use the `zsh` shell

> **Note** you can override this if you like - use the `--entrypoint` 
> argument to docker, e.g for `bash`:
>
> `docker run -it --entrypoint /bin/bash roscopeco/rosco_m68k`

When starting the container, you'll be presented with a message from 
`zsh` telling you that you don't have start files:

> This is the Z Shell configuration function for new users, 
> zsh-newuser-install.
> You are seeing this message because you have no zsh startup files
> (the files .zshenv, .zprofile, .zshrc, .zlogin in the directory
> ~).  This function can help you with a few settings that should
> make your use of the shell easier.

The recommended thing to do here if you're going to be using 
your new container in the terminal is to select option `2`, which
will create sensible default files for you.

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

