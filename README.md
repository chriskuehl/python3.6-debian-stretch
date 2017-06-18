Python 3.6 Debian stretch backport
========

Unofficial Python 3.6 backports for Debian stretch.


## Usage

If you just want to grab pre-built Debian packages, you can find them in the
[Releases][releases] tab on GitHub. Download the ones you want, then run `sudo
dpkg -i *.deb` to install them.


## Building from source

To build from source, clone this repo and run `make builddeb` on a machine
running Debian stretch. It follows [roughly these backporting
instructions][how-to-backport] in order to build a proper backport of Python
3.6 on stretch.

Building from source is relatively fast and is recommended for anyone who has a
healthy distrust of pre-built binaries from a random internet stranger.


[how-to-backport]: https://www.ocf.berkeley.edu/docs/staff/procedures/backporting-packages/
[releases]: https://github.com/chriskuehl/python3.6-debian-stretch/releases
