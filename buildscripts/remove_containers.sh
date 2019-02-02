#!/bin/sh
#
. ./buildscripts/dc

log "Remove containers..."

${DOCKER} down --rmi local -v --remove-orphans
rm -f .*_container
