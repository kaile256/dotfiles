#!/bin/bash

echo 'setup for linuxbrew...'
sudo apt-get install build-essential curl file git
echo 'installing linuxbrew...'
which brew > /dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

ln -s /home/linuxbrew/.linuxbrew .linuxbrew
eval $(~/.linuxbrew/bin/brew shellenv)

echo 'run brew doctor...'
which brew > /dev/null 2>&1 && brew doctor

echo 'run brew update...'
which brew > /dev/null 2>&1 && brew update

echo 'run brew upgrade...'
brew upgrade --all

formulas=(
	git
	wget
	curl
	tree
	openssl
	node
	python3
	lua
	mysql
	sqlite
	ricty
)

echo 'start brew install apps...'
for formula in '${formulas[@]'; do
	brew install $formulas || brew upgrade $forula
done

brew cleanup

cat << END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
HOMEBREW INSTALLED
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

END

