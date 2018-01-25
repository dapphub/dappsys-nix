all:; dapp build
test:; dapp test
clean:; dapp clean

SHELL = bash
dirs = {bin,libexec}
prefix ?= /usr/local

dirs:; mkdir -p $(prefix)/$(dirs)
files = $(shell ls -d $(dirs)/*)
install:; cp -r -n $(dirs) $(prefix)
link: uninstall dirs; for x in $(files); do \
ln -s `pwd`/$$x $(prefix)/$$x; done
uninstall:; rm -rf $(addprefix $(prefix)/,$(files))

check:; ! grep '^#!/bin/sh' libexec/*/* && \
grep '^#!/usr/bin/env bash' libexec/*/* | \
cut -d: -f1 | xargs shellcheck -e SC1090 -e SC2018 -e SC2019
