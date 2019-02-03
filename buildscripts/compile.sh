#!/bin/sh -e
# 
# Compile all the code
#
. ./buildscripts/goenv
. ./buildscripts/source
. ./buildscripts/target

go build -i -v -ldflags="-X main.version=${DESCRIBE}" -o ${TARGET} ${SOURCE}
go mod tidy && go mod verify
