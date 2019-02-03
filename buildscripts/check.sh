#!/bin/sh -e
# 
# Statically check the code
#
. ./buildscripts/src

for f in `find ${SRC} -path ${SRC}/vendor -prune -o -name '*.go' -print`
do
	go fmt $f
	golint $f
	go tool vet $f
done
