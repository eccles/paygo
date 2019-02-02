#!/bin/sh -e
# 
# get dependencies
#
. ./buildscripts/dc

${BUILDER} buildscripts/dependencies.sh
