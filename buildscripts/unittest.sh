#!/bin/sh -e
# 
# Unit tests the code and record the coverage
#
. ./buildscripts/src

for d in `find ${SRC} -path ${SRC}/vendor -prune -o -type d -print`
do
	TESTS=$( ls ${d}/*_test.go 2>/dev/null || true )
	if [ -n "${TESTS}" ]
	then
		sub=$( basename ${d} )
		pkg=$( echo ${d} | cut -d'/' -f2- )
		mkdir -p htmlcov
		log "Test ${pkg} ..."
		go test -v -bench . -coverprofile=/tmp/c.out ${pkg}
		if [ -s /tmp/c.out ]
		then
			go tool cover -html=/tmp/c.out -o htmlcov/${sub}.html
			rm -f /tmp/c.out
		fi
	fi
done
