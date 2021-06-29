.DEFAULT_GOAL := help


DOTFILES_HOME := $(abspath .)
OTHER_MAKEFILES := $(DOTFILES_HOME)/Makefile.d
SCRIPT_DIR := $(OTHER_MAKEFILES)/scripts

include $(DOTFILES_HOME)/package/Makefile

DOT_HOME_DIR   := $(DOTFILES_HOME)/home
DOT_CONFIG_DIR := $(DOTFILES_HOME)/config

DOT_HOME_TARGETS   := $(notdir $(wildcard $(DOT_HOME_DIR)/*))
DOT_CONFIG_TARGETS := $(notdir $(wildcard ${DOT_CONFIG_DIR}/*))

DOTFILES := $(DOT_HOME_TARGETS) $(DOT_CONFIG_TARGETS)

define link
	ln -sfnv $1 $2;
endef


.PHONY: home
home: ## Make symbolic links to $HOME.
	$(foreach fname,$(DOT_HOME_TARGETS),\
		$(call link,$(DOT_HOME_DIR)/$(fname),$(HOME)/.$(fname)))

.PHONY: config
config: ## Make symbolic links to $XDG_CONFIG_HOME.
	$(foreach fname,$(DOT_CONFIG_TARGETS),\
		$(call link,$(DOT_CONFIG_DIR)/$(fname),$(XDG_CONFIG_HOME)/$(fname)))

.PHONY: deploy
deploy: home config ## Make all the symbolic links from home/ and config/.
	#

.PHONY: distclean
distclean: # Unlink all the symbolic links from dotfiles.
	@echo "Unlinking all the dotfiles deployed in symbolic link..."
	$(foreach target,$(DOTFILES),unlink $(target))

.PHONY: download
download: ## Download dotfiles repository from github.
	sh `curl -L \
		https://raw.githubusercontent.com/kaile256/dotfiles/master/install.sh`


.PHONY: bluetooth
bluetooth: ## [WIP] Start bluetooth service
	sudo systemctl enable --now bluetooth.service
	@echo enable a pulseaudio module, module-bluetooth-discover
	pactl load-module module-bluetooth-discover


.PHONY: help
help: ## Show this help
	@echo
	@echo 'Usage:'
	@echo '  make <target> [flags...]'
	@echo
	@echo 'Targets:'
	@egrep -h '^\S+: .*## \S+' $(MAKEFILE_LIST) | sed 's/: .*##/:/' | column -t -c 2 -s ':' | sed 's/^/  /'
