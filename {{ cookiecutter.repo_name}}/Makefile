# Makefile for {{ cookiecutter.repo_name }}

# You can set these variables from the command line.
MOLECULE  ?= molecule

## which python to use, can be within venv
PYTHON ?= python

.PHONY: help
help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  test_setup to check and install python requirements"
	@echo "  test       to run all molecule test"
	@echo "  clean      to clean any remaining molecule docker container"

.PHONY: clean
clean: test_setup
	$(PYTHON) -m $(MOLECULE) destroy --all
	@echo
	@echo "clean finished; all molecule docker container has been removed."

.PHONY: test_setup
test_setup:
ifneq ($(shell $(PYTHON) -m pip show molecule >/dev/null 2>&1; echo $$?), 0)
	$(PYTHON) -m pip install --upgrade pip
	$(PYTHON) -m pip install -r requirements.txt
	@echo
	@echo "test_setup finished; python testing requirements has been installed."
else
	@echo
	@echo "molecule detected, skipping test_setup."
endif

.PHONY: test
test: test_setup
# $(PYTHON) -m $(MOLECULE) test --all --parallel
# the --parallel add and uuid at the container name which can generate error
	$(PYTHON) -m $(MOLECULE) test --all
	@echo
	@echo "test finished; all molecule schenario test has been ran."
