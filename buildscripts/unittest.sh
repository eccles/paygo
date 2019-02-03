#!/bin/sh -e
# 
# Unit tests the code and record the coverage
#
. ./buildscripts/goenv
. ./buildscripts/name
. ./buildscripts/source

go test -v -bench . -coverprofile=/tmp/c.out ${SOURCE}
if [ -s /tmp/c.out ]
then
	mkdir -p htmlcov
	go tool cover -html=/tmp/c.out -o htmlcov/${NAME}.html
	rm -f /tmp/c.out
fi
#
# commented oy=ut as takes a long time and some test fail as not
# being implemented on linux/amd64 (??).
# go test all
