SHELL := /bin/bash

VERSION := 3.6.4-4
WORKDIR := python3.6-$(shell cut -d- -f1 <<< '$(VERSION)')

.PHONY: builddeb
builddeb:
	dget -x https://mirrors.ocf.berkeley.edu/debian/pool/main/p/python3.6/python3.6_$(VERSION).dsc
	cd $(WORKDIR) \
		&& grep -rl python3-distutils debian/ | xargs sed -i 's/python3-distutils/python3-distutils-extra/g' \
		&& DEBFULLNAME='Chris Kuehl' DEBEMAIL=ckuehl@ocf.berkeley.edu \
			dch --local ~deb9u --distribution stretch-backports 'Backported for stretch.' \
		&& DEB_BUILD_OPTIONS=nocheck dpkg-buildpackage -us -uc -sa
