#!/bin/sh -e
# 
# get dependencies
#
. ./buildscripts/name

if [ ! -d src/${NAME}/vendor \
  -o ! -s src/${NAME}/Gopkg.toml ]
then
        rm -rf src/${NAME}/Gopkg.*
	(cd src/${NAME} && dep init && dep ensure && dep status)
else
	(cd src/${NAME} && dep ensure && dep status)
fi
