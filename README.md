Python 3.6 Debian stretch backport
========

Unofficial Python 3.6.3 backports for Debian stretch.


## Usage

If you just want to grab pre-built Debian packages, you can find them in the
[Releases][releases] tab on GitHub. Download the ones you want, then run `sudo
dpkg -i *.deb` to install them.

For example, a typical installation could look like this:

```bash
$ wget https://github.com/chriskuehl/python3.6-debian-stretch/releases/download/v3.6.3-1-deb9u1/{python3.6_3.6.3-1.deb9u1_amd64,python3.6-minimal_3.6.3-1.deb9u1_amd64,python3.6-dev_3.6.3-1.deb9u1_amd64,libpython3.6_3.6.3-1.deb9u1_amd64,libpython3.6-minimal_3.6.3-1.deb9u1_amd64,libpython3.6-stdlib_3.6.3-1.deb9u1_amd64,libpython3.6-dev_3.6.3-1.deb9u1_amd64}.deb
$ sudo dpkg -i *.deb
```


## Building from source

To build from source, clone this repo and run `make builddeb` on a machine
running Debian stretch. It follows [roughly these backporting
instructions][how-to-backport] in order to build a proper backport of Python
3.6 on stretch.

Building from source is relatively fast (~15 minutes) and is recommended for
anyone who has a healthy distrust of pre-built binaries from a random internet
stranger.


[how-to-backport]: https://www.ocf.berkeley.edu/docs/staff/procedures/backporting-packages/
[releases]: https://github.com/chriskuehl/python3.6-debian-stretch/releases


## FAQ
### Can this be installed alongside the default Python 3 on stretch (3.5.3)?

Yes. These packages provide a binary `/usr/bin/python3.6`. They do not replace
the default python3 binary on stretch.

For example, to create a virtualenv, you would use `virtualenv -ppython3.6 venv`.


### What happens when I upgrade from stretch to buster (the next Debian stable, currently unreleased)?

Your packages will be replaced with the python3.6 packages in buster. These
packages have the same names but "inferior" version numbers, so they'll get
upgraded to the official packages.


### What about backports for Ubuntu?

Try the very well-maintained [deadsnakes PPA](https://launchpad.net/~deadsnakes/+archive/ubuntu/ppa).
