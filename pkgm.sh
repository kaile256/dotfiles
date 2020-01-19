#!/usr/bin/env bash

set -Cue

PACKAGEs=(
  udiskie # a wrapper of udisk2 to mount automatically
  #uzbl # a browser w/ vim-like keybinds. The development ends.
  #doas # an alternative to sudo(1); a port of OpenBSD or try opendoas from 'community'
  light-locker # use instead of i3lock, which doesn't work well with multiple monitors
  #lightdm-webkit2-greeter # set a theme for lightdm at login-window
  #lightdm-webkit-theme-litarvan # a theme for lightdm-webkit2-greeter. Cool.
  #jdk-openjdk # toggl-cli needs javac; or use java-environment-common. The symlink from /usr/bin/javac and so on may be broken; update it yourself.
  #toggl-cli # use python's one instead from github
  #jot # a cli tool to take a note
  #notes-cli-bin # a cli tool to take a note on markdown
  parcel-bundler # a web-app bundler w/o config
  dialog # used in `wifi-menu` at least
  ripgrep-all # ripgrep in PDFs, E-Books, Office documents, zip, tar.gz, etc.
  tor-browser
  mmv # mv multiple files in your editor, for debian user
  #otf-sans-forgetica # a font scientifically designed for study notes. fails to work on qutebrowser
  wine # a layer to run programs for Windows
  transset-df # for transparency on xterm
  q4wine # gui for `wine`
  preload # preload apps on RAM; maybe requires to `systemctl disable preload` before remove the package
  trello-cli
  git-crypt
  fwupd # a daemon for firmware update
  dmidecode # installed w/ fwupd? anyway, necessary
  #cadaver  # WebDAV client, of which netrw makes use.
  #conky-lua-archers
  #android-studio # the official IDE for Android
  #crazydiskinfo # no use for NVMe. detects HDD/SSD through S.M.A.R.T; you know TBW(Tera Byte Written)?
  #fcitx-qt5
  #fcitx5-qt5-git  # Libraries for fcitx-qt5, too long to install
  #gendesk # what?
  #jinja2 # for neovim-qt
  #jre # Java Runtime Environment, required by vim-gramarous; choose default
  #nerd-fonts-inconsolata-go
  #pacmixer # a frontend of ALSA for pulseaudio on TUI; adjust sound volume
  #purple-line-git # WARNINIG: Line corp. bans people who uses 3rd party clients
  #qrab # grab QR codes from screen to copy as text into clipboard
  #qt5-base-git  # a cross-platform app & UI framework for neovim-qt
  #room-arranger # make a blueprint for room
  #rxvt-unicode-256xresources # Terminal Emulater according to gruvbox.vim
  #ttf-migu
  #xf86-input-synaptics  # use xinput to enable config for Touchpad
  acpi_call # recomended by tlp; select 419, or get the kernel version from manjaro-settings-manager
  alacritty
  anyenv
  arandr  # Gui config for xrandr
  aspell # for vim-codespell
  aspell-en # for vim-codespell
  atool # compress/extract files detecting automaticcaly
  bash-completion
  blacklist_pcspkr # make sure to disable beep
  cargo  # select rustup
  gufw  # a simple firewall
  ccls # Language-Server for C, C++, Object-C
  clamav  # anti-virus for unix, must be a root-user
  clang
  clipgrab # a video downloader
  cmake
  #cquery-git # LSP for C/C++/Obj-C, available on coc.nvim
  dasht  # help?
  debtap # .deb even in arch!
  fzf
  ghc # a compiler for haskell
  global # GTAGS
  go
  googlecl  # google api for cli
  hub  # an official wrapper of git
  i3-battery-popup-git # alert when battery is running out
  i3-volume
  luarocks
  multibootusb # to create live usb
  neovim-nightly
  neovim-qt-git # non-git ver. has a bug, missing its depending lib.
  nerd-fonts-complete
  #nerd-fonts-ricty # unavailable
  brew-git # a pkgm for macOS (or Linux)
  ninja # a build system for clang
  npm # necessary for coc's command at all even w/ yarn
  nvme-cli # a NVMe manager, can be a secure eraser
  pavucontrol # Sound: GUI?
  #pdfarranger # a pdf editor
  pdfjs  # PDF viewer in browser
  peek # a screen recorder
  polybar # a substitute of i3-bar
  pulseaudio # Sound:
  pyenv
  qemu # for multibootusb
  qtqr # generate/decode QR codes
  ranger # a vim-binding file explorer
  rclone  # sync lib for cloud-service like dropbox, Gdrive.
  ripgrep
  ruby
  rxvt-unicode-truecolor
  screenkey-git # display typed-key; useful w/ peek
  shellcheck  # a linter for shell
  task # taskwarrior
  the_silver_searcher # ag
  tlp   # Save Battery of PC
  ttf-font-icons  # Mix Icon with Awesome & Ionicons without Confliction.
  vimiv-qt # an image-viewer. Use qt ver.; gtk won't update
  vmail
  xorg-xbacklight  # backlight
  yarn
  zotero # organize research sources, essays.
  zsh
  dmenu-manjaro
  #i3pystatus
  #i3-style
  #bluez   # for Bluetooth
  #bluez-utils
  skk-jisyo
  libskk
  fcitx-skk
  skk-emoji-jisyo
  skktools
)

Remove=(
  manjaro-hello
)

PIP3s=(
  requests # for Uehara25/WeblioSearcher
  beautifulsoup4
  readability # for readability on Qutebrowser
  document # for readability on Qutebrowser
  togglCli # AuHau/toggl-cli
  #falcon  # Solve fcitx problem on Qt
  jupyter # for neural network especially for python
  jupytext # for goerz/jupytext.vim #jupyter
  tldextract # for an userscript on qutebrowser, qute-bitwarden
  #matplotlib # for hyiltiz/vim-plugins-profile though optional
  pocket-api  # for an userscript on qutebrowser, qute-pocket
  #notedown # for szymonmaszke/vimpyter #jupyter
  #msgpack # for neovim-qt
  #oauth2client
  pfp # hex editor tool, which is used by vim-pfp
  pipenv
  tasklib # py-lib for taskwarrior
  lizard # detect cyclomatic complexity
)

GEMs=(
  neovim
  md2man # to build man page
  binman # to build man page
)

# Yarn
YARNs=(
  yaml-language-server
  diagnostic-languageserver
  graphql-language-server
  vim-language-server
  go-language-server
  bash-language-server
  #tslib
  readability # for userscript on qutebrowser, readability
  neovim
)

RUSTUPs=(
  rust-src
  rustfmt
)

LUAROCKs=(
  '--server=http://luarocks.org/dev lua-lsp'
  luacheck
  lcf # a formatter for Lua 5.3
  #Formatter # a formatter for lua 5.1
)

DASHTs=(
  bash
  go
  python
  rust
)

GHQs=(
  sachaos/toggl
)

# INSTALL PACKAGES {{{1
INSTALLERs=(
  apt
  pacman
)

for i in "${INSTALLERs[@]}"; do
  type "$i" > /dev/null 2>&1 && export INSTALLER="$i"
done

[[ -n $INSTALLER ]] && echo "Installer is identified, $INSTALLER!"

declare -A Install
Install=(
  ['pacman']='pacman -S'
  ['apt']='apt install'
)

export install="${Install[$INSTALLER]}"
echo "$INSTALLER will install package via '$install'!!"

for package in "${PACKAGEs[@]}"; do
  if [ "$INSTALLER" -ne 'apt' ] && [ $(apt list "${package}") ]; then
    echo "You have installed $package already!"
  elif [ "$INSTALLER" -ne 'pacman' ] && [ $(pacman -Q "${package}") ]; then
    echo "Installing $package..."
    sudo "$install" "$package" || {

      if "$INSTALLER" == 'apt';then
        echo "Try to curl to install $package..."
        if "$package" == 'pyenv'; then
          curl https://pyenv.run | bash
        fi
        if "$package" == 'cargo'; then
          curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
          source ~/.local/share/cargo/env
        fi
        if "$package" == 'rxvt-unicode'; then
          sudo apt install rxvt-unicode-256-color
        fi

      elif "$INSTALLER" == 'pacman'; then
        echo "Try to yay to install $package..." && yay -S "$package"
      fi
    }
  fi
done

cd ~ || exit

# INSTALL OTHER PACKAGES {{{1
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash

# Ref: https://www.rust-lang.org/tools/install
curl https://sh.rustup.rs -sSf | sh
rustup install nightly
rustup default nightly

for p in "${YARNs[@]}"; do
  type yarn || echo 'You have no executable yarn'
  yarn global add "$p"
done

for p in "${PIP3s[@]}"; do
  type pip3 && pip="pip3" || type pip && pip="pip" \
    || echo 'You have no executable yarn'
      $pip install --user "$p"
    done

    for p in "${GEMs[@]}"; do
      gem install "$p"
    done

    for p in "${RUSTUPs[@]}"; do
      rustup component add "$p"
    done

    for p in "${LUAROCKs[@]}"; do
      luarocks install --local "$p"
    done

    for doc in "${DASHTs[@]}"; do
      dasht-docsets-install "$doc"
    done

    for p in "${GHQs[@]}"; do
      ghq get "$p"
    done

# doom-emacs: one of emacsen's config files for vimmer.
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom quickstart

#(keyboard-translate ?\C-h ?\C-?)
#(global-set-key (kbd "C-?") 'help-for-help)
#
#(create-fontset-from-ascii-font "SF Mono-12:weight=normal:slant=normal" nill "Cica-12")

#source /home/kaile256/.local/share/cargo/env

# for executable lsp
#sudo npm i -g bash-language-server
# for go-lsp, gopls
GO111MODULE=on go get golang.org/x/tools/gopls@latest

# Font: SFMonoSquare
# Ref: https://github.com/delphinus/homebrew-sfmono-square
sudo chown -R "$(whoami)" /opt/brew
brew tap delphinus/sfmono-square
brew install sfmono-square

open "$(brew --prefix sfmono-square)/share/fonts"
# open fonts with Finder
