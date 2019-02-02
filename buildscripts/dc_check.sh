#!/bin/sh -e
# 
# Statically check the code
#
. ./buildscripts/dc

${BUILDER} buildscripts/check.sh
