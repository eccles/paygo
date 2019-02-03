#!/bin/sh -e
# 
# get dependencies
#
. ./buildscripts/src

if [ ! -d ${SRC}/vendor \
  -o ! -s ${SRC}/Gopkg.toml ]
then
        rm -rf ${SRC}/Gopkg.*
	(cd ${SRC} && dep init && dep ensure && dep status)
else
	(cd ${SRC} && dep ensure && dep status)
fi
