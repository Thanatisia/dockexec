# Makefile

## Variables/Ingredients
### Environment
SHELL := /bin/bash

### Application
SRC_DIR = ./src
DST_DIR = /usr/local/bin
TEST_DIR = tests
TEST_FILE = unittest.sh
BIN = dockexec

.PHONY := help
.DEFAULT_RULES := help

## Recipe/Targets/Instructions
help:
	## Display help message
	@echo -e "[Display Help]"
	@echo -e "Options:"
	@echo -e "\t" "help      : Display this help message and detailed information"
	@echo -e "\t" "install   : To install the compiled/built binary into the system"
	@echo -e "\t" "uninstall : To uninstall/remove the installed files from the system"
	@echo -e "\t" "test      : Run the unit test"

install:
	## Install the compiled/built binary into the system
	cp "${SRC_DIR}/${BIN}" "${DST_DIR}"

uninstall:
	## Uninstall/remove the binary from the system
	rm "${DST_DIR}/${BIN}"

test:
	## Run unit test file
	@test -f ${TEST_DIR}/${TEST_FILE} && \
		cd ${TEST_DIR} && \
		./${TEST_FILE}

