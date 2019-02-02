#!/bin/sh -e
# 
# Unittest the code
#
. ./buildscripts/dc

${BUILDER} buildscripts/unittest.sh
