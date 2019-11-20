# Static Tesseract

This is a `Dockerfile`, along with a helper `docker-compose.yml` file to help
build a fully-static version of Tesseract 4.1.

The Dockerfile sets up a base Ubuntu 18.04 system into which Tesseract 4.1 is
compiled.

The `build.sh` script is used to setup the container, download the built binary
from within the container and then destroy the container.

After all this, you're left with a `tesseract` binary in the current folder that
is statically linked.

This binary may be used in environments that don't let you install custom
packages from the operating system's repository, like Google Cloud Functions and
Amazon Lambda.

## Dependencies

Make sure you've atleast Docker 19.3.04 and Docker Compose 1.24.0 installed. I
have not tested any of this as working on older versions of Docker, although you
_might_ have some luck there since I don't do anything non-standard.

## Execution

Simply run `./build.sh` and make yourself a nice beverage. You'll have a
statically linked `tesseract` binary built in a few minutes!

## Debugging / Misc

### SSH Into The Container

The container is run with a `sleep infinity` command so that you can open a
terminal within it and poke around inside. This also lets you try alternative
build flags and the like.

```bash
docker-compose exec tesseract /bin/bash
```

### Delete Docker Artefacts

Sometimes you'd want to get rid of the intermediate images built during this
build process.

```bash
docker image prune
```

## Pre-Built Binaries

At some point I might add them to the releases within this repository. For now,
these scripts shouldn't be very hard to run!
