#!/bin/sh -e
# 
# Unit tests the code and record the coverage
#
. ./buildscripts/name
go test -v -bench . -coverprofile=/tmp/c.out ./...
if [ -s /tmp/c.out ]
then
	go tool cover -html=/tmp/c.out -o htmlcov/${NAME}.html
	rm -f /tmp/c.out
fi
