#!/usr/bin/env bash

#### Ref.: .bashrc
#### Ref.: curl.sh

set -Cu

#### INSTALLER IDENTIFICATION
Installer=(
apt
pacman
)
for i in ${Installer[@]}; do
  type $i >> /dev/null 2>&1 && export INSTALLER="$i"
done

[[ ! -z $INSTALLER ]] && echo "Installer is identified, $INSTALLER!"

declare -A Install
Install=(
['pacman']='pacman -S'
['apt']='apt install'
)

export install="${Install[$INSTALLER]}"
echo "$INSTALLER will install package via '$install'!!"

#### WANTED-PACKAGES INSTALLATION
Package=(
anyenv
bash-completion
cargo  # select rustup
git
go
ghq-bin
pyenv
python-pipenv
ripgrep
ruby
yarn
)

for package in ${Package[@]}; do
  if type apt && apt list "$package" | grep $package; then
  elif type pacman && pacman -Q "$package"; then
  else
    echo "Installing $package..." && sudo $install $package || {

      if $INSTALLER == 'apt';then
        echo "Try to curl to install $package..."
        if $package == 'pyenv'; then
          curl https://pyenv.run | bash
        fi
        if $package == 'cargo'; then
          curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
          source ~/.local/share/cargo/env
        fi

      elif $INSTALLER == 'pacman'; then
        echo "Try to yay to install $package..." && yay -S $package
      fi
    }
fi
done

#        [[ $package == 'pyenv' ]] && {
#        curl https://pyenv.run | bash
#      }
#  } || {
#    [[ $package == 'cargo' ]] && {
#    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#      source ~/.local/share/cargo/env
#    }
#}
#elif [ $INSTALLER == 'pacman' ]; then
#  echo "Try to yay to install $package..." && yay -S $package
#fi
#}

### Yarn
YarnPack=(
bash-language-server  # LSP
neovim
)

for y in ${yarnPack[@]}; do
  yarn global add $y
done

### Go
## pocke/get
#type get go || {
#  echo "Installing github.com/pocke/get..."
#  go get github.com/pocke/get
#}

# ghq
GitRepos=(
Shougo/dein.vim
)

for g in ${gitRepos[@]}; do
  # if you want to use pocke/get, replace ghq get w/ get ghq
  ghq get  $g
done

GemRepos=(
neovim
)

PipRepos=(
pynvim
)

### Neovim
## Dein
PLUGIN_DIR=$HOME/.cache/dein
INSTALL_DIR="${PLUGIN_DIR}/repos/github.com/Shougo/dein.vim"

if ! [ -e "$INSTALL_DIR" ]; then
  # check git command
  type git > /dev/null || {
    echo ""
      echo 'Please install git or update your path to include the git executable!'
      exit 1
    }
  echo ""
  echo "Begin fetching dein..."
  mkdir -p "$PLUGIN_DIR"
  git clone https://github.com/Shougo/dein.vim "$INSTALL_DIR"
  echo "Done. Dein is Ready!!"
  echo ""
fi

### Rustup -- cargo
## Init
rustup install stable
rustup default stable
## Rustup Completions
mkdir -p ~/.local/share/bash-completion/rustup
rustup completions bash > ~/.local/share/bash-completion/rustup
mkdir -p ~/.config/fish/completions/rustup.fish
rustup completions fish > ~/.config/fish/completions/rustup.fish
