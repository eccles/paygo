#!/bin/sh
#
. ./buildscripts/dc

log "Create_container: $1"

# build container
${DOCKER} build ${1}
touch .${1}_container
