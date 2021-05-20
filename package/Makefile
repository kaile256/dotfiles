LIST_EXT := mk

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


.PHONY: all
all: yay yarn pip luarocks gem rustup pecl
	#

.PHONY: yay
yay:
	@type pacman >/dev/null 2>&1 && \
		type yay >/dev/null 2>&1 || \
			(echo "You don't have yay. Install its dependencies..." \
			&& pacman -S --needed git base-devel \
			&& git clone --depth=1 https://aur.archlinux.org/yay.git \
			&& cd yay && makepkg -si)
	@echo "Synchronizing package databases..."
	# $(call update_package_manager,yay -Syu)
	$(call install_packages,yay -S)

.PHONY: yarn
yarn:
	$(call validate_executable,yarn)
	$(call update_package_manager,yarn global upgrade)
	$(call install_packages,yarn global add)

.PHONY: pip
pip:
	$(call validate_executable,pip)
	$(call update_package_manager,pip install --upgrade pip)
	$(call install_packages,pip install --user)

.PHONY: luarocks
luarocks:
	$(call validate_executable,luarocks)
	$(call update_package_manager,luarocks install --local luarocks)
	$(call install_packages,luarocks install --local)

.PHONY: gem
gem:
	$(call validate_executable,gem)
	$(call update_package_manager,gem update)
	$(call install_packages,gem install package)

.PHONY: rustup
rustup:
	$(call validate_executable,rustup)
	$(call update_package_manager,rustup install nightly)
	$(call update_package_manager,rustup default nightly)
	$(call install_packages,rustup component add)

.PHONY: pecl
pecl:
	$(call validate_executable,pecl)
	$(call update_package_manager,pecl upgrade)
	$(call install_packages,pecl install)

test:
	echo $(PECL)