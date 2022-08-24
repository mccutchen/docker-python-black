# ⚠️ Deprecation Notice ⚠️

This repo has been retired, because the upstream [psf/black project](https://github.com/psf/black)
now publishes an official docker image on Docker Hub at [pyfound/black](https://hub.docker.com/r/pyfound/black):

```bash
# pull a specific version
docker pull pyfound/black:22.6.0

# pull latest released version
docker pull pyfound/black:latest_release
```

Please use that official image instead of `mccutchen/python-black`.  **No new
images will be pushed from this repository.**

## Quick migration guide

If migrating from mccutchen/python-black to pyfound/black, note that you'll
need to add `black` to the command line itself:

```diff
- docker run --rm -v $(pwd):/src mccutchen/python-black --check --diff /src
+ docker run --rm -v $(pwd):/src pyfound/black black --check --diff /src
```

<br>

_Original README preseved for posterity below._

---

<br>

# docker-python-black

> Source for the [mccutchen/python-black][] docker image

A minimal docker image for running Python's [black] code formatter, useful in
CI pipelines or other situations where avoiding local Python/virtualenv/etc
installation is ideal.


## Automated builds

A new image is published automatically for every new release of black. See the
[bin/update][] script and the [Track upstream releases][workflow] workflow for
implementation details.

## Usage

An example CI step that will exit non-zero if any source code under the current
directory needs to be formatted:

```bash
docker run --rm -v $(pwd):/src mccutchen/python-black --check --diff /src
```

## Prior Art

There are at least a handful of existing, public docker images that serve the
same purpose as this one, but I wanted an image that a) explicitly tracked
black releases and b) published its Dockerfile.

Here are some other public images to consider:

- [kiwicom/black][] (lots of downloads, tracks black releases, but no public dockerfile)
- [cytopia/black][] (many downloads, public dockerfile, but does not track black releases)
- [houzefaabba/python3-black][] (fewer downloads, public dockerfile, tracks black releases, but outdated)

[black]: https://github.com/psf/black
[mccutchen/python-black]: https://hub.docker.com/r/mccutchen/python-black
[kiwicom/black]: https://hub.docker.com/r/kiwicom/black
[cytopia/black]: https://hub.docker.com/r/cytopia/black
[houzefaabba/python3-black]: https://hub.docker.com/r/houzefaabba/python3-black
[bin/update]: ./bin/update
[workflow]: ./.github/workflows/track_upstream_releases.yaml
