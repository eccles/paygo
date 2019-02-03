#!/bin/sh -e
# 
# returns repo to pristine state
#
. ./buildscripts/src

rm -rf .cache/ \
	bin/ \
	.env \
	pkg/ \
	${SRC}/Gopkg.lock \
	${SRC}/Gopkg.toml \
	${SRC}/vendor
