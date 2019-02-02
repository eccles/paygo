#!/bin/sh -e
# 
# returns repo to pristine state
#
. ./buildscripts/name

rm -rf bin/ \
       htmlcov/ \
       pkg/ \
       pkg-build/
