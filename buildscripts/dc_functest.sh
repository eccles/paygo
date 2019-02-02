#!/bin/sh -e
# 
# Statically check the code
#
. ./buildscripts/dc

${BUILDER} buildscripts/functest.sh
