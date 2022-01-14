ifneq (,)
.error This Makefile requires GNU Make.
endif


# -------------------------------------------------------------------------------------------------
# Make configuration
# -------------------------------------------------------------------------------------------------
SHELL     := /bin/bash
SHELLOPTS := $(if $(SHELLOPTS),$(SHELLOPTS):)pipefail:errexit

.ONESHELL:
# .ONESHELL: tells GNU make to run all the commands in a single shell.
# That means, your recipe really is one shellscript now. (Requires GNU make 3.82 or later.)

CURRENT_DIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

CURRENT_UID := $(shell id -u)
CURRENT_GID := $(shell id -g)


# -------------------------------------------------------------------------------------------------
# Terraform configuration
# -------------------------------------------------------------------------------------------------
TF_VERSION   = 1.0.11
LOCK_TIMEOUT = 60s
LOCK_FILE    = .terraform.lock.hcl
PLAN_FILE    = .terraform.plan
PARALLELISM  = 10   # Terraform uses 10 Threads by default (increase for huge number of teams)


# -------------------------------------------------------------------------------------------------
# Default target
# -------------------------------------------------------------------------------------------------
.PHONY: help
help:
	@echo "test       Run all integration tests"
	@echo "test-XX    Run a specific integration test (where XX are two numeric digits)"


# -------------------------------------------------------------------------------------------------
# Default Test Target
# -------------------------------------------------------------------------------------------------

###
### Run all tests
###
.PHONY: test
test: _check_gh_organization
test: _check_gh_token
test: test-01


# -------------------------------------------------------------------------------------------------
# Test defines
# -------------------------------------------------------------------------------------------------

###
### Create plan file and apply, then destroy
###
.PHONY: test-01
test-01: _check_gh_organization
test-01: _check_gh_token
test-01:
	@echo "####################################################################################################"
	@echo "####################################################################################################"
	@echo "###"
	@echo "### TEST 01"
	@echo "###"
	@echo "####################################################################################################"
	@echo "####################################################################################################"
	@if ! $(MAKE) --no-print-directory _init; then \
		exit 1; \
	fi;
	@if ! $(MAKE) --no-print-directory _plan \
		VAR_FILE=tests/test-02.tfvars \
		GITHUB_ORG=$(GITHUB_ORG) \
		GITHUB_TOKEN=$(GITHUB_TOKEN); then
		exit 1; \
	fi;
	@if ! $(MAKE) --no-print-directory _apply_plan; then \
		exit 1; \
	fi;
	@if ! $(MAKE) --no-print-directory _destroy \
		VAR_FILE=tests/test-01.tfvars \
		GITHUB_ORG=$(GITHUB_ORG) \
		GITHUB_TOKEN=$(GITHUB_TOKEN); then \
		exit 1; \
	fi;
	@if ! $(MAKE) --no-print-directory _clean_all; then \
		exit 1; \
	fi;


###
### Create plan file and apply, then destroy
###
.PHONY: test-02
test-02: _check_gh_organization
test-02: _check_gh_token
test-02:
	@echo "####################################################################################################"
	@echo "####################################################################################################"
	@echo "###"
	@echo "### TEST 02 (>100 Teams PARALLELISM=100)"
	@echo "###"
	@echo "####################################################################################################"
	@echo "####################################################################################################"
	@if ! $(MAKE) --no-print-directory _init; then \
		exit 1; \
	fi;
	@if ! $(MAKE) --no-print-directory _plan \
		VAR_FILE=tests/test-02.tfvars \
		GITHUB_ORG=$(GITHUB_ORG) \
		GITHUB_TOKEN=$(GITHUB_TOKEN); then
		exit 1; \
	fi;
	@if ! $(MAKE) --no-print-directory _apply_plan PARALLELISM=100; then \
		exit 1; \
	fi;
	@if ! $(MAKE) --no-print-directory _destroy \
		VAR_FILE=tests/test-01.tfvars \
		GITHUB_ORG=$(GITHUB_ORG) \
		GITHUB_TOKEN=$(GITHUB_TOKEN); then \
		exit 1; \
	fi;
	@if ! $(MAKE) --no-print-directory _clean_all; then \
		exit 1; \
	fi;


# -------------------------------------------------------------------------------------------------
# Terraform Targets
# -------------------------------------------------------------------------------------------------

###
### Terraform destroy
###
.PHONY: _destroy
_destroy: _check_gh_organization
_destroy: _check_gh_token
_destroy:
	@echo
	@echo "# --------------------------------------------------------------------------------"
	@echo "# terraform destroy"
	@echo "# --------------------------------------------------------------------------------"
	function cleanUp() {
		$(MAKE) --no-print-directory _clean_init
		$(MAKE) --no-print-directory _clean_plan
		$(MAKE) --no-print-directory _clean_apply
	}
	mkdir -p $(CURRENT_DIR)../.terraform.d
	trap cleanUp ERR
	docker run \
		$$(tty -s && echo "-it" || echo) \
		--rm \
		-v "$(CURRENT_DIR)../:/data" \
		-w /data \
		-e HOME=/data \
		-e HOSTNAME=terraform \
		-e TF_LOG=WARN \
		--entrypoint=/bin/sh \
		hashicorp/terraform:$(TF_VERSION) -c "\
		apk add libc6-compat \
		&& addgroup -g $(CURRENT_GID) user \
		&& adduser -h /data -G user -u $(CURRENT_UID) -D -H user \
		&& su -p -m user -c 'yes yes | terraform destroy \
			-var-file=$(VAR_FILE) \
			-var \"owner=$(GITHUB_ORG)\" \
			-var \"token=$(GITHUB_TOKEN)\" \
			-lock-timeout=$(LOCK_TIMEOUT)'"


###
### Terraform apply planfile
###
.PHONY: _apply_plan
_apply_plan:
	@echo
	@echo "# --------------------------------------------------------------------------------"
	@echo "# terraform apply $(PLAN_FILE)"
	@echo "# --------------------------------------------------------------------------------"
	function cleanUp() {
		$(MAKE) --no-print-directory _clean_init
		$(MAKE) --no-print-directory _clean_plan
		$(MAKE) --no-print-directory _clean_apply
	}
	mkdir -p $(CURRENT_DIR)../.terraform.d
	trap cleanUp ERR
	docker run \
		$$(tty -s && echo "-it" || echo) \
		--rm \
		-v "$(CURRENT_DIR)../:/data" \
		-w /data \
		-e HOME=/data \
		-e HOSTNAME=terraform \
		-e TF_LOG=WARN \
		--entrypoint=/bin/sh \
		hashicorp/terraform:$(TF_VERSION) -c "\
		apk add libc6-compat \
		&& addgroup -g $(CURRENT_GID) user \
		&& adduser -h /data -G user -u $(CURRENT_UID) -D -H user \
		&& su -p -m user -c 'terraform apply -lock-timeout=$(LOCK_TIMEOUT) -parallelism=$(PARALLELISM) $(PLAN_FILE)'"


###
### Terraform plan
###
.PHONY: _plan
_plan: _check_gh_organization
_plan: _check_gh_token
_plan:
	@echo
	@echo "# --------------------------------------------------------------------------------"
	@echo "# terraform plan"
	@echo "# --------------------------------------------------------------------------------"
	function cleanUp() {
		$(MAKE) --no-print-directory _clean_init
		$(MAKE) --no-print-directory _clean_plan
	}
	mkdir -p $(CURRENT_DIR)../.terraform.d
	trap cleanUp ERR
	docker run \
		$$(tty -s && echo "-it" || echo) \
		--rm \
		-v "$(CURRENT_DIR)../:/data" \
		-w /data \
		-e HOME=/data \
		-e HOSTNAME=terraform \
		-e TF_LOG=WARN \
		--entrypoint=/bin/sh \
		hashicorp/terraform:$(TF_VERSION) -c "\
		apk add libc6-compat \
		&& addgroup -g $(CURRENT_GID) user \
		&& adduser -h /data -G user -u $(CURRENT_UID) -D -H user \
		&& su -p -m user -c 'terraform plan \
			-var-file=$(VAR_FILE) \
			-var \"owner=$(GITHUB_ORG)\" \
			-var \"token=$(GITHUB_TOKEN)\" \
			-lock-timeout=$(LOCK_TIMEOUT) \
			-out=$(PLAN_FILE)'"


###
### Terraform init
###
.PHONY: _init
_init:
	@echo
	@echo "# --------------------------------------------------------------------------------"
	@echo "# terraform init"
	@echo "# --------------------------------------------------------------------------------"
	function cleanUp() {
		$(MAKE) --no-print-directory _clean_init
	}
	mkdir -p $(CURRENT_DIR)../.terraform.d
	trap cleanUp ERR
	docker run \
		$$(tty -s && echo "-it" || echo) \
		--rm \
		-u $$(id -u):$$(id -g) \
		-v "$(CURRENT_DIR)../:/data" \
		-w /data \
		-e HOME=/data \
		-e HOSTNAME=terraform \
		-e TF_LOG=WARN \
		hashicorp/terraform:$(TF_VERSION) init \
			-lock-timeout=$(LOCK_TIMEOUT)


# -------------------------------------------------------------------------------------------------
# Cleanup Targets
# -------------------------------------------------------------------------------------------------

###
### Clean all
###
.PHONY: _clean_all
_clean_all:
	@echo
	@echo "# --------------------------------------------------------------------------------"
	@echo "# Clean-up"
	@echo "# --------------------------------------------------------------------------------"
		$(MAKE) --no-print-directory _clean_init
		$(MAKE) --no-print-directory _clean_plan
		$(MAKE) --no-print-directory _clean_apply


###
### Cleans any files created during terraform init
###
.PHONY: _clean_init
_clean_init:
	if test -f ../$(LOCK_FILE); then rm ../$(LOCK_FILE); fi
	if test -d ../.terraform; then rm -rf ../.terraform; fi
	if test -d ../.terraform.d; then rm -rf ../.terraform.d; fi


###
### Cleans any files created during plan
###
.PHONY: _clean_plan
_clean_plan:
	if test -f ../$(PLAN_FILE); then rm ../$(PLAN_FILE); fi
	if test -d ../.terraform.d; then rm -rf ../.terraform.d; fi


###
### Cleans any files created during apply or destroy
###
.PHONY: _clean_apply
_clean_apply:
	if test -f ../terraform.tfstate; then rm ../terraform.tfstate; fi
	if test -f ../terraform.tfstate.backup; then rm ../terraform.tfstate.backup; fi


# -------------------------------------------------------------------------------------------------
# Requirements Check
# -------------------------------------------------------------------------------------------------

###
### Check that GITHUB_ORG is set
###
_check_gh_organization:
ifeq ($(strip $(GITHUB_ORG)),)
	@$(error You must specify the GitHub organization via "GITHUB_ORG=<name-of-org>" for the make command)
endif


###
### Check that GITHUB_TOKEN is set
###
_check_gh_token:
ifeq ($(strip $(GITHUB_TOKEN)),)
	@$(error You must specify the GitHub organization token via "GITHUB_TOKEN=<token-value>" for the make command)
endif
