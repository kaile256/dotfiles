#!/usr/bin/env bash

# Ref.: .bashrc
# Ref.: curl.sh

set -Cu

# INSTALLER IDENTIFICATION
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
#rxvt-unicode-256xresources # Terminal Emulater according to gruvbox.vim
anyenv
arandr  # Gui config for xrandr
bash-completion
cargo  # select rustup
fcitx-qimpanel  # Frontend
fcitx-qt5
fcitx5-qt5-git  # Libraries for fcitx-qt5
fzf
gendesk
ghq-bin
global
go
googlecl  # google api for cli
hub  # an official wrapper of git
luarocks
neovim-nightly
neovim-qt
nerd-fonts-ricty
pdfjs  # PDF viewer in browser
pyenv
python-falcon  # Solve fcitx problem on qute?
python-oauth2client
python-pipenv
qt5-webkit  # Alternative backend for qute.
rclone  # sync lib for cloud-service like dropbox, Gdrive.
ripgrep
ruby
rxvt-unicode-truecolor
shellcheck  # a linter for shell
the_silver_searcher
tlp   # Save Battery of PC
ttf-cica
ttf-font-icons  # Mix Icon with Awesome & Ionicons without Confliction.
ttf-myricam
tty-dejavu
vimiv
vmail
xf86-input-synaptics  # enable config for Touchpad
yarn
zsh
)

Manjaro=(
dmenu-manjaro
i3pystatus
i3-style
bluez   # for Bluetooth
bluez-utils
)

Depend=(
#dropbox-cli
)

for package in ${Package[@]}; do
  if [ -z "$INSTALLER" == 'apt' && apt list "$package" ||  "$INSTALLER" == 'pacman' && pacman -Q "$package" ]; then
    echo "You have installed $package already!"
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
        if $package == 'rxvt-unicode'; then
          sudo apt install rxvt-unicode-256-color
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

#git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
# doom-emacs: an emacsen for alt-vimmer.
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom quickstart

#(keyboard-translate ?\C-h ?\C-?)
#(global-set-key (kbd "C-?") 'help-for-help)
#
#(create-fontset-from-ascii-font "SF Mono-12:weight=normal:slant=normal" nill "Cica-12")

GemRepos=(
neovim
)

PipRepos=(
pynvim
)

# Neovim
# Dein
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

# LSP
# Lua
echo "Installing Lua-LSP..."
sudo luarocks install --server=http://luarocks.org/dev lua-lsp
echo "Installing luacheck..."
sudo luarocks install luacheck
# Formatter for Lua 5.1
#sudo luarocks install Formatter
# Formatter for Lua 5.3
echo "Installing Lua-Formatter..."
sudo luarocks install lcf
### Rustup -- cargo
## Init

if [ -e '~/.local/share/rustup/update-hashes/stable-*' ]; then
  rustup install stable
  rustup default stable
fi

## Rustup Completions
if [ -e '~/.local/share/bash-completion/rustup' ]; then
  mkdir -p ~/.local/share/bash-completion/rustup
  rustup completions bash > ~/.local/share/bash-completion/rustup
fi

if [ -e '~/.config/fish/completions/rustup.fish' ]; then
  mkdir -p ~/.config/fish/completions/rustup.fish
  rustup completions fish > ~/.config/fish/completions/rustup.fish
fi

# Fonts
if [ -z ls /usr/share/fonts/TTF/ | grep Myrica ]; then
  echo 'creating symlinks for Cica Fonts to /etc/fonts/conf.d/'
  sudo ln -s /usr/share/fonts/MyricaM/MyricaM.TTC /etc/fonts/conf.d/
fi
if [ -z ls /usr/share/fonts/TTF/ | grep Cica ]; then
  echo 'creating symlinks for Cica Fonts to /etc/fonts/conf.d/'
  sudo ln -s /usr/share/fonts/TTF/Cica* /etc/fonts/conf.d/
fi
if [ -z ls /usr/share/fonts/TTF/ | grep Ricty ]; then
  echo 'creating symlinks for Ricty Fonts to /etc/fonts/conf.d/'
  sudo ln -s /usr/share/fonts/TTF/Ricty* /etc/fonts/conf.d/
fi

#### Enable Utilities
echo "Activating tlp..."
sudo systemctl enable tlp
echo "Activating bluetooth..."
sudo systemctl enable bluetooth   # to activate command 'sudo systemctl start bluetooth'
