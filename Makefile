SHELL := /bin/bash

VERSION := 3.6.5-1
WORKDIR := python3.6-$(shell cut -d- -f1 <<< '$(VERSION)')
# Sed command to remove "python3-distutils" dependency
SED_TRIM := 'N; s/\s*python3-distutils,//; P; D'
# Don't remove distutils modules
LINE_DEL_DISTUTILS := rm -rf .+python.+/distutils
# Dont't remove lib2to3. Note: We only keep 2to3 module. We still delete the bin
# to avoid overwriting ones of Python3.5
LINE_DEL_2TO3 := .+lib/python.+/lib2to3

.PHONY: builddeb
builddeb:
	dget -x https://mirrors.ocf.berkeley.edu/debian/pool/main/p/python3.6/python3.6_$(VERSION).dsc
	cd $(WORKDIR) \
		&& sed -i $(SED_TRIM) debian/control && sed -i $(SED_TRIM) debian/control.in \
		&& sed -i "s:\s*$(LINE_DEL_DISTUTILS)::g" debian/rules \
		&& sed -i "s:\s*$(LINE_DEL_2TO3)::g" debian/rules \
		&& DEBFULLNAME='Chris Kuehl' DEBEMAIL=ckuehl@ocf.berkeley.edu \
			dch --local ~deb9u --distribution stretch-backports 'Backported for stretch.' \
		&& DEB_BUILD_OPTIONS=nocheck dpkg-buildpackage -us -uc -sa
