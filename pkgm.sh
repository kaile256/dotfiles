#!/usr/bin/env bash

set -Cue #{{{
# C: prohibit to overwrite file on redirect;
#   use '>|' instead of '>' to overwite a file with '-C'
# u: stop if an undefined variable is set, or undefined var shall be regarded
#   as null; otherwise, `var=foo && rm -fr ~/"$bar"` shall remove all under '~'.
#   Be careful that $1 also stops the script with '-u'.
# e: stop if error (non 0); add '&& true' to continue even when error with '-e'.
#   DON'T set '-e' on files sourced from .profile/.bashrc;
#   an error prevents to boot your system.
#}}}

# All themes set in `lxappearance`
PACKAGEs=(
  #clojure-lsp-bin # returns 404
  tk # necessary to push the first commit of cloned repo to remote fork?
  net-tools # includes `route`
  traceroute
  #gdrive # A Google Drive CLI Client; failed to get access token
  blugon # a blue light filter for X
  #thinkfinger # fprint may be an better alternative. A driver for fingerprint reader on ThinkPad; seems no use on the model
  #fprintd # no device found on thinkpad.
  #fingerprint-gui # No device found on thinkpad
  aide # Advanced Intrusion Detection Environment; checks file-integrity and detects intrusion
  nerd-fonts-meslo # slightly thicker than dejavu. LG in the font-family name means Line-Gaps. DZ means Dotted-Zero(a dot in 0); without it, Slashed-Zero(a slash in 0)
  #nerd-fonts-dejavu-complete
  apvlv # a pdf view of vi-binding
  #inkscape # an image editor, like gimp and pinta
  nethogs # show network processes like `top` for cpu usage
  mosh # Mobile Shell, an alternative of ssh; survive disconnects
  lxappearance-gtk3 # GTK+ theme switcher of LXDE (GTK+ 3 version)
  bibata-cursor-theme
  adapta-maia-theme
  papirus-icon-theme
  papirus-maia-icon-theme
  nitrogen # a browser of wallpaper
  picom # an X compositor, an enhanced fork of compton
  dunst # a notification-tool, notify-send
  #i3-wm-iconpatch # crashes too often
  #i3-scrot # screenshot on i3wm
  i3lock
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
  clamav  # a security service of anti-virus, works on systemctl. update the virus-definetions by `freshclam`, which can also run on systemctl
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
  #nerd-fonts-complete
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
  #rxvt-unicode-truecolor # broken; instead, use https://github.com/illef/rxvt-unicode-truecolor-illef: installed in THE OTHERS
  screenkey-git # display typed-key; useful w/ peek
  shellcheck  # a linter for shell
  #task # taskwarrior
  #vit # taskwarrior on TUI w/ vi-key bindings
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

PIP3s=(
  #falcon  # Solve fcitx problem on Qt
  #matplotlib # for hyiltiz/vim-plugins-profile though optional
  #msgpack # for neovim-qt
  #notedown # for szymonmaszke/vimpyter #jupyter
  #oauth2client
  beautifulsoup4
  document # for readability on Qutebrowser
  jupyter # for neural network especially for python
  jupytext # for goerz/jupytext.vim #jupyter
  lizard # detect cyclomatic complexity
  neovim
  neovim-remote
  pfp # hex editor tool, which is used by vim-pfp
  pipenv
  pocket-api  # for an userscript on qutebrowser, qute-pocket
  pynvim
  readability # for readability on Qutebrowser
  requests # for Uehara25/WeblioSearcher
  tasklib # py-lib for taskwarrior
  tldextract # for an userscript on qutebrowser, qute-bitwarden
  togglCli # AuHau/toggl-cli
)

GEMs=(
  licensee # detects what I can to the repository as the license included
  bundler # required by licensee
  neovim
  md2man # to build man page
  binman # to build man page
)

YARNs=(
  #graphql-language-server # no longer supported
  #tslib
  bash-language-server
  diagnostic-languageserver
  dockerfile-language-server-nodejs
  go-language-server
  mermaid # generetes diagram, flowchart and ganttchart in markdown
  neovim
  parcel-bundler # a web-app bundler w/o config
  readability # for userscript on qutebrowser, readability
  vim-language-server
  yaml-language-server
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

REMOVEs=(
  manjaro-hello
  i3blocks
  i3blocks-contrib
)

INITPATH=$(pwd)
cd "$HOME"
# REMOVE UNNECESSARY {{{1

for p in "${REMOVEs[@]}"; do
  yay -Q "$p" >/dev/null 2>&1 || break
  echo "Remove an unnecessary package, \"$p\""
  yay -Rs "$p"
done

# INSTALL PACKAGES {{{1
INSTALLERs=(
  yay
  apt
)

for i in "${INSTALLERs[@]}"; do
  type "$i" > /dev/null 2>&1 && export INSTALLER="$i" && break
done

[[ -n $INSTALLER ]] && echo "Installer is identified, $INSTALLER!"

declare -A Install
Install=(
  ['yay']='yay -S'
  ['apt']='sudo apt install'
)

export install="${Install[$INSTALLER]}"
echo "$INSTALLER will install package via '$install'"

for p in "${PACKAGEs[@]}"; do
  yay -Q "p" >/dev/null 2>&1 || break
  echo "Installing $p..."
  $install "$p"
done

cd ~ || exit

# INSTALL OTHER PACKAGES {{{1
#echo "Updating npm..."
#sudo npm install -g npm

if type yarn; then
  yarn global add yarn
else
  echo 'Installing yarn...'
  curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
fi
for p in "${YARNs[@]}"; do
  yarn global add "$p"
done

if type pip3 && pip="pip3" || type pip && pip="pip" ; then
  $pip install $pip
  for p in "${PIP3s[@]}"; do
    $pip install --user "$p"
  done
fi

gem update
for p in "${GEMs[@]}"; do
  gem install "$p"
done

if type rustup ; then
  # Ref: https://www.rust-lang.org/tools/install
  curl https://sh.rustup.rs -sSf | sh
  rustup install nightly
  rustup default nightly
fi
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

# THE OTHERS in GITHUB {{{1
# Font: SFMonoSquare
# Ref: https://github.com/delphinus/homebrew-sfmono-square
#sudo chown -R "$(whoami)" /opt/brew
#brew tap delphinus/sfmono-square
#brew install sfmono-square
#open "$(brew --prefix sfmono-square)/share/fonts"

URXVT_PATCHED=rxvt-unicode-truecolor-illef
URXVT_PATCHED_DIR=/tmp/$URXVT_PATCHED
git clone -b master --depth 1 https://github.com/illef/$URXVT_PATCHED $URXVT_PATCHED_DIR
cd $URXVT_PATCHED_DIR
makepkg -si

# END {{{1

cd "$INITPATH"
