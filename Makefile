SHELL := /bin/bash

VERSION := 3.6.5~rc1-3
WORKDIR := python3.6-$(shell cut -d- -f1 <<< '$(VERSION)')
# Sed command to remove "python3-distutils" dependency
SED_TRIM := 'N; s/\s*python3-distutils,//; P; D'
# Cancel job of deleting distutils modules
LINE_TO_DEL := rm -rf .+python.+/distutils

.PHONY: builddeb
builddeb:
	dget -x https://mirrors.ocf.berkeley.edu/debian/pool/main/p/python3.6/python3.6_$(VERSION).dsc
	cd $(WORKDIR) \
		&& sed -i $(SED_TRIM) debian/control && sed -i $(SED_TRIM) debian/control.in \
		&& sed -i "s:\s*$(LINE_TO_DEL)::g" debian/rules \
		&& DEBFULLNAME='Chris Kuehl' DEBEMAIL=ckuehl@ocf.berkeley.edu \
			dch --local ~deb9u --distribution stretch-backports 'Backported for stretch.' \
		&& DEB_BUILD_OPTIONS=nocheck dpkg-buildpackage -us -uc -sa
