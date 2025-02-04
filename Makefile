# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0
MAKEFLAGS+=--warn-undefined-variables
export MGMT_ROOT?=$(PWD)/dependencies/caravel_mgmt_soc
export MGMT_REPO_URL?=https://github.com/efabless/caravel_mgmt_soc_litex.git
export MGMT_BRANCH?=Add_newfill
export PDK_ROOT?=$(PWD)/dependencies/pdks

export PROJECT_ROOT=$(shell pwd)

SIM?=RTL

# PDK switch varient
export PDK?=sky130A
#export PDK?=gf180mcuC
export PDKPATH?=$(PDK_ROOT)/$(PDK)

# Include mgmt
.PHONY: install-mcw
install-mcw:
	if [ -d "$(MGMT_ROOT)" ]; then\
		MAKE_DIR="$(PWD)"; \
		echo "Updating $(MGMT_ROOT)"; \
		cd $(MGMT_ROOT) && \
		git checkout $(MGMT_BRANCH) && git pull; \
		cd "$$MAKE_DIR"; \
	else \
		echo "Cloning $(MGMT_REPO_URL) -b $(MGMT_BRANCH)"; \
		git clone -b $(MGMT_BRANCH) $(MGMT_REPO_URL) $(MGMT_ROOT) --depth=1 --single-branch; \
	fi

PYTHON_BIN=python3

check-pdk:
	@if [ ! -d "$(PDK_ROOT)" ]; then \
		echo "PDK Root: "$(PDK_ROOT)" doesn't exists, please export the correct path before running make. "; \
		exit 1; \
	fi

.PHONY: echo-var
echo-var:
	@echo $($(VAR))


# Harden with Openlane2
OPENLANE2_TAG ?= 2.3.3
OPENLANE2_IMAGE_NAME ?= efabless/openlane:$(OPENLANE2_TAG)
OPENLANE2_RUN_TAG = $(shell date '+%y_%m_%d_%H_%M')
OPENLANE2_USE_NIX ?= 0
ROOTLESS ?= 0
USER_ARGS = -u $$(id -u $$USER):$$(id -g $$USER)
designs = $(shell cd $(PROJECT_ROOT)/openlane && find * -maxdepth 0 -type d)
current_design = null

ifeq ($(ROOTLESS), 1)
	USER_ARGS =
endif

openlane_args = \
	--run-tag $(OPENLANE2_RUN_TAG) \
	--manual-pdk \
	--pdk-root $(PDK_ROOT) \
	--pdk $(PDK) \
	--log-level WARNING \
	$(PROJECT_ROOT)/openlane/$*/config.yaml

docker_mounts = \
	-m $(PROJECT_ROOT)\
	-m $(PDK_ROOT) \

docker_env = \
	-e PDK_ROOT=$(PDK_ROOT) \
	-e PDK=$(PDK) \
	-e OPENLANE2_RUN_TAG=$(OPENLANE2_RUN_TAG)

ifneq ($(MCW_ROOT),)
docker_env += -e MCW_ROOT=$(MCW_ROOT)
export MCW_ROOT:=$(MCW_ROOT)
docker_mounts += -m $(MCW_ROOT)
endif

docker_startup_mode = $(shell test -t 0 && echo "-it" || echo "--rm" )
openlane_extra_args = $(shell test -t 0 || echo "--docker-no-tty")
docker_run = \
	docker run $(docker_startup_mode) \
	$(USER_ARGS) \
	$(docker_mounts) \
	$(docker_env) \

list:
	@echo $(designs)

# export PYTHONPATH=$(PROJECT_ROOT)/openlane_plugin_Frigate:\$$PYTHONPATH
.PHONY: $(designs)
$(designs) : export current_design=$@
$(designs) : % : $(PROJECT_ROOT)/openlane/%/config.yaml
	# $(current_design)
	@rm -rf $(PROJECT_ROOT)/openlane/$*/runs/$(OPENLANE2_RUN_TAG)
ifeq ($(OPENLANE2_USE_NIX),1)
	nix run github:efabless/openlane2/$(OPENLANE2_TAG) --  $(openlane_args) $(openlane_extra_args)
else
	$(PROJECT_ROOT)/openlane2-venv/bin/python3 -m openlane $(docker_mounts) $(openlane_extra_args) --dockerized $(openlane_args) $(openlane_extra_args)
endif
	@sh $(PROJECT_ROOT)/openlane/copy_views.sh $(PROJECT_ROOT) $* $(OPENLANE2_RUN_TAG)

