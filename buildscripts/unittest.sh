#!/bin/sh -e
# 
# Unit tests the code and record the coverage
#
. ./buildscripts/dc

${BUILDER} go version
