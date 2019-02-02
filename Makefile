#------------------------------------------------------------------------------
#
# Requires docker-ce and docker-compose
#
# To start type:
#
#     make
#
#------------------------------------------------------------------------------

.PHONY: all
all: remove_containers clean artifacts

#------------------------------------------------------------------------------
#
# `make clean` cleans all build artifacts from container
#
.PHONY: clean
clean:
	./buildscripts/clean.sh

#------------------------------------------------------------------------------
#
# `$ make dependencies`
#
.PHONY: dependencies
dependencies: clean start_builder
	./buildscripts/dependencies.sh

#------------------------------------------------------------------------------
#
# `$ make check` statically check the code
#
.PHONY: check
check: dependencies
	./buildscripts/check.sh

#------------------------------------------------------------------------------
#
# `$ make compile` compile Golang code
#
.PHONY: compile
compile: check
	./buildscripts/compile.sh

#------------------------------------------------------------------------------
#
# `$ make unittest` execute any unittests
#
.PHONY: unittest
unittest: compile
	./buildscripts/unittest.sh

#------------------------------------------------------------------------------
#
# `$ make functest` functional test using binaries
#
.PHONY: functest
functest: unittest
	./buildscripts/functest.sh

#------------------------------------------------------------------------------
#
.PHONY: artifacts
artifacts: functest

#------------------------------------------------------------------------------
#
# docker dependencies
#
.PHONY: remove_containers
remove_containers:
	./buildscripts/remove_containers.sh

.PHONY: remove_builder
remove_builder:
	./buildscripts/remove_container.sh builder

.PHONY: start_builder
start_builder: builder
	./buildscripts/start_container.sh builder

.PHONY: builder
builder: .builder_container

.builder_container: Dockerfile-builder docker-compose.yaml
	./buildscripts/create_container.sh builder

