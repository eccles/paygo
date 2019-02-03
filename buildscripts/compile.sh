#!/bin/sh -e
# 
# Compile all the code
#

go build -o bin/paygo cmd/main.go
go mod tidy && go mod verify
