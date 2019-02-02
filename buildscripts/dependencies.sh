#!/bin/sh -e
# 
# get dependencies
#
. ./buildscripts/dc

${BUILDER} go version
