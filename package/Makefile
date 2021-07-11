LIST_EXT := list

# echo -e '\n' is useless in foreach.
define \n :=

endef

define validate_executable =
	@echo
	@echo "Checking if $1 is executable..."
	@type $1 >/dev/null 2>&1 || \
		(echo "you don't have executable $1!" && exit 1)
	@echo
	@echo "	$1 is executable!"
	@echo
	@echo "============================================================"
endef

define update_package_manager =
@echo
@echo 'Executing "$1" to update the package manager...'
@echo
@cd && $1
@echo
@echo '$(firstword $1) is now up-to-date!'
@echo
@echo "============================================================"
@echo
endef

# Extract contents of $1 (like yarn.mk)
define extract_list =
	$(shell sed 's/\s*#.*//g' $1)
endef

define install_package =
	@echo 'Installing $2...$(\n)'
	$1 $2
	@echo '$(\n)"$2" is installed!$(\n)'
endef
# Fix error 2. Error message:
#	/bin/sh: -c: line 1: syntax error near unexpected token `('
# A. Remove alias for make.
# Fix error 127. Error message:
#	/bin/sh: line 1: Installing: command not found
# A.
define install_packages =
	@echo 'Start installing packages via "$1"'
	@echo
	$(foreach package,\
		$(call extract_list,$(firstword $1).$(LIST_EXT)),\
		$(call install_package,$1,${package}))
	@echo
	@echo "============================================================"
	@echo
	@echo "All the installable packages has been installed!"
	@echo
	@echo "============================================================"
	@echo
endef


update-pacakges: ## Update dotfiles and installed packages
	git pull
	$(call update_package_manager,pip install --upgrade pip)
	$(call update_package_manager,yarn global upgrade)
	$(call update_package_manager,luarocks install --local luarocks)
	$(call update_package_manager,gem update)
	$(call update_package_manager,cargo update)

# Note: `yay` instead cannot update it because `pkgver` is not updated.
# Ref: https://aur.archlinux.org/packages/neovim-nightly-bin/
# Bulk of `$VIMRUNTIME/keymap/*.vim` takes almost 2 econds to be loaded.
neovim-nightly-bin: paru ## Install the latest version of neovim-nightly-bin
	rm ~/.cache/paru/clone/neovim-nightly-bin -rf
	paru -S --rebuild --redownload neovim-nightly-bin
	@echo "Disarming keymap/ with backup for neovim startup performance..."
	sudo rm /usr/share/nvim/runtime/keymap -rf

.PHONY: paru
# Note: To update packages, use yay; paru asks password for each packages.
paru: ## Install packages by paru (a fork of yay).
	@type pacman >/dev/null 2>&1 && \
		type paru >/dev/null 2>&1 || \
			(echo "You don't have paru. Install its dependencies..." \
			&& pacman -S --needed base-devel \
			&& git clone --depth=1 https://aur.archlinux.org/paru.git \
			&& cd paru && makepkg -si)
	@echo "Synchronizing package databases..."
	$(call install_packages,paru -S)

.PHONY: yay
yay: ## Install packages by yay.
	@type pacman >/dev/null 2>&1 && \
		type yay >/dev/null 2>&1 || \
			(echo "You don't have yay. Install its dependencies..." \
			&& pacman -S --needed git base-devel \
			&& git clone --depth=1 https://aur.archlinux.org/yay.git \
			&& cd yay && makepkg -si)
	@echo "Synchronizing package databases..."
	$(call update_package_manager,yay -Syu)
	$(call install_packages,yay -S)

.PHONY: yarn
yarn: ## Install packages by yarn.
	$(call validate_executable,yarn)
	$(call update_package_manager,yarn global upgrade)
	$(call install_packages,yarn global add)

# Go has no update packages command; just overwrite binaries in $GOPATH/bin.
.PHONY: go
go: ## Install packages by go.
	$(call validate_executable,go)
	$(call install_packages,go get)

.PHONY: pip
pip: ## Install packages by pip.
	$(call validate_executable,pip)
	$(call update_package_manager,pip install --upgrade pip)
	$(call install_packages,pip install --user)

.PHONY: luarocks
luarocks: ## Install packages by luarocks.
	$(call validate_executable,luarocks)
	$(call update_package_manager,luarocks install --local luarocks)
	$(call install_packages,luarocks install --local)

.PHONY: gem
gem: ## Install packages by gem
	$(call validate_executable,gem)
	$(call update_package_manager,gem update)
	$(call install_packages,gem install package)

.PHONY: cargo
cargo: ## (FIXME) Install packages by cargo.
	$(call validate_executable,cargo)
	cargo install cargo-update
	cargo install-update --all
	$(call install_packages,cargo install)

.PHONY: pecl
pecl: ## Install packages by pecl.
	$(call validate_executable,pecl)
	$(call update_package_manager,pecl upgrade)
	$(call install_packages,pecl install)

.PHONY: all
all-pacakges: yay yarn pip luarocks gem rustup pecl ## Install all packages.
	#
