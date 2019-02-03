#!/bin/sh -e
# 
# get dependencies
#
if [ ! -s go.mod ]
then
	go mod init
fi
