#!/bin/sh
#
. ./buildscripts/dc

log "Remove container $1 ..."

docker rmi ${NAME}_$1
rm -f .$1_container
