#!/bin/sh
#
. ./buildscripts/dc

log "Start container $1"

${DOCKER} up -d ${1}
