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
all: artifacts

#------------------------------------------------------------------------------
#
# `make clean` cleans all build artifacts from container
#
.PHONY: clean
clean: remove_containers
	./buildscripts/clean.sh

#------------------------------------------------------------------------------
#
# `$ make dependencies`
#
.PHONY: dependencies
dependencies: start_builder
	./buildscripts/dc_dependencies.sh

#------------------------------------------------------------------------------
#
# `$ make check` statically check the code
#
.PHONY: check
check: dependencies
	./buildscripts/dc_check.sh

#------------------------------------------------------------------------------
#
# `$ make compile` compile Golang code
#
.PHONY: compile
compile: check
	./buildscripts/dc_compile.sh

#------------------------------------------------------------------------------
#
# `$ make unittest` execute any unittests
#
.PHONY: unittest
unittest: compile
	./buildscripts/dc_unittest.sh

#------------------------------------------------------------------------------
#
# `$ make functest` functional test using binaries
#
.PHONY: functest
functest: unittest api
	./buildscripts/dc_functest.sh

#------------------------------------------------------------------------------
#
.PHONY: artifacts
artifacts: functest

#------------------------------------------------------------------------------
#
# `$ make shell`
#
.PHONY: shell
shell: start_builder
	./buildscripts/dc_shell.sh

#------------------------------------------------------------------------------
#
# docker dependencies
#
.env: buildscripts/env.sh
	./buildscripts/env.sh

.PHONY: remove_containers
remove_containers: .env
	./buildscripts/remove_containers.sh

.PHONY: remove_api
remove_api:
	./buildscripts/remove_container.sh api

.PHONY: api
api: .api

.api: Dockerfile-api docker-compose.yaml
	./buildscripts/create_container.sh api

.PHONY: remove_builder
remove_builder:
	./buildscripts/remove_container.sh builder

.PHONY: start_builder
start_builder: builder
	./buildscripts/start_container.sh builder

.PHONY: builder
builder: .builder_container

.builder_container: .env Dockerfile-builder docker-compose.yaml
	./buildscripts/create_container.sh builder

