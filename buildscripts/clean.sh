#!/bin/sh -e
# 
# returns repo to pristine state
#
. ./buildscripts/name

rm -rf .cache/ \
	bin/ \
	.env \
	pkg/ \
	src/${NAME}/Gopkg.lock \
	src/${NAME}/Gopkg.toml \
	src/${NAME}/vendor
