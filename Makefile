# Makefile for cookiecutter-ansible-role
#

# You can set these variables from the command line.
PYTHON ?= python

CHILD_NAME = ansible-role-template
CHILD_VENV_PATH = $(CHILD_NAME)/venv


.PHONY: help
help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  test_setup to check and install python requirements"
	@echo "  test       to run all molecule test"
	@echo "  clean      to clean any remaining molecule docker container"

.PHONY: clean
clean:
	rm -rf $(CHILD_NAME)
	@echo
	@echo "clean finished; default generated cookiecutter has been removed."

.PHONY: test_setup
test_setup:
ifneq ($(shell $(PYTHON) -m pip show cookiecutter >/dev/null 2>&1; echo $$?), 0)
	$(PYTHON) -m pip install --upgrade pip
	$(PYTHON) -m pip install -r requirements.txt
	@echo
	@echo "test_setup finished; python testing requirements has been installed."
else
	@echo
	@echo "cookiecutter detected, skipping test_setup."
endif

.PHONY: test
test: clean test_setup
	$(PYTHON) -m cookiecutter --no-input . 
	python3 -m venv $(CHILD_VENV_PATH)
	PATH=$(shell pwd)/$(CHILD_VENV_PATH)/bin:$(PATH) && $(MAKE) -C $(CHILD_NAME) test
	@echo
	@echo "test finished; cookiecutter template has been generated and tested."
