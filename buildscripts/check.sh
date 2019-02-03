#!/bin/sh -e
# 
# Statically check the code
#
for f in `find -name '*.go' -print`
do
	go fmt $f
	golint $f
	go tool vet $f
done
