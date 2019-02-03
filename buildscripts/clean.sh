#!/bin/sh -e
# 
# returns repo to pristine state
#

rm -rf .cache/ \
	bin/ \
	.env \
	htmlcov/ \
	pkg/
