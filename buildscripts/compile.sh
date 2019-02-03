#!/bin/sh -e
# 
# Compile all the code
#
. ./buildscripts/src

for m in `find ${SRC} -path ${SRC}/vendor -prune -o -name main.go -print`
do
	d=$( dirname $m )
	b=$( basename $d )
	p=$( echo $d | cut -d'/' -f2- )
	CGO_ENABLED=0 go build -o bin/${NAME}${b} ${p}
done
