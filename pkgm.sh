#!/usr/bin/env bash

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
  alacritty
  anyenv
  screenkey-git # display typed-key; useful w/ peek
  cmake
  clang
  arandr  # Gui config for xrandr
  bash-completion
  blacklist_pcspkr  # disable beep
  cargo  # select rustup
  clamav  # anti-virus for unix
  #qt5-base-git  # a cross-platform app & UI framework for neovim-qt
  npm # necessary for coc's command at all even w/ yarn
  #fcitx-qt5
  #fcitx5-qt5-git  # Libraries for fcitx-qt5, too long to install
  #peek # a screen recorder
  fzf
  #gendesk # what?
  global # GTAGS
  go
  googlecl  # google api for cli
  hub  # an official wrapper of git
  #cadaver  # WebDAV client, of which netrw makes use.
  #purple-line-git # WARNINIG: Line corp. bans people who uses 3rd party clients
  i3-volume
  #jre # Java Runtime Environment, required by vim-gramarous; choose default.
  #jinja2 # for neovim-qt
  luarocks
  #nerd-fonts-inconsolata-go
  #ttf-migu
  neovim-nightly
  neovim-qt-git # non-git ver. has a bug, missing its depending lib.
  nerd-fonts-ricty
  pdfjs  # PDF viewer in browser
  ninja # a build system for clang
  pyenv
  ccls # Language-Server for C, C++, Object-C
  rclone  # sync lib for cloud-service like dropbox, Gdrive.
  #conky-lua-archers
  ripgrep
  ruby
  #rxvt-unicode-truecolor
  shellcheck  # a linter for shell
  task # taskwarrior
  the_silver_searcher # ag
  tlp   # Save Battery of PC
  ttf-font-icons  # Mix Icon with Awesome & Ionicons without Confliction.
  vimiv
  vmail
  #xf86-input-synaptics  # use xinput to enable config for Touchpad
  xorg-xbacklight  # backlight
  yarn
  zsh
  zotero # organize research sources, essays.
)

Manjaro=(
  dmenu-manjaro
  i3pystatus
  i3-style
  bluez   # for Bluetooth
  bluez-utils
  skk-jisyo
  libskk
  fcitx-skk
  skk-emoji-jisyo
  skktools
)

Depend=(
  #dropbox-cli
)


ToRemove=(
manjaro-hello
)

for package in ${Package[@]}; do
  if [ -z "$INSTALLER" == 'apt' && `apt list "$package"` ]; then
    echo "You have installed $package already!"
  elif [ -z "$INSTALLER" == 'pacman' && pacman -Q "$package" ]; then
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

# Yarn
YarnPack=(
  yaml-language-server
  diagnostic-languageserver
  vim-language-server
  go-language-server
  bash-language-server
  #tslib
  neovim
)

cd ~
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
for y in ${yarnPack[@]}; do
  yarn global add $y
done

# doom-emacs: one of emacsen's config files for vimmer.
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom quickstart

#(keyboard-translate ?\C-h ?\C-?)
#(global-set-key (kbd "C-?") 'help-for-help)
#
#(create-fontset-from-ascii-font "SF Mono-12:weight=normal:slant=normal" nill "Cica-12")

PipRepos=(
  falcon  # Solve fcitx problem on qute?
  #msgpack # for neovim-qt
  #oauth2client
  pfp # hex editor tool
  pipenv
  tasklib # py-lib for taskwarrior
)
GemRepos=(
  neovim
)

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

# Rustup -- cargo
# Ref: https://www.rust-lang.org/tools/install
curl https://sh.rustup.rs -sSf | sh
rustup install nightly
rustup default nightly
# rust-analyzer -- LSP
#git clone --depth=1 https://github.com/rust-analyzer/rust-analyzer && cd rust-analyzer
rustup component add rust-src
rustup component add rustfmt
#cargo install-ra --server # fail; open any *.rs to make coc install it instead.

#source /home/kaile256/.local/share/cargo/env

# for executable lsp
#sudo npm i -g bash-language-server
# for go-lsp, gopls
GO111MODULE=on go get golang.org/x/tools/gopls@latest

# Qutebrowser
pip3 install pocket-api --user
