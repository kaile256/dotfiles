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

# `paccache -ruk3`
# All themes set in `lxappearance`
PACKAGEs=(
  dunst # a notification-tool, notify-send
  qutebrowser-git
  ttf-migu # font for Japanese, used in Nerd font, too.
  ttf-junicode # font of runic alphabet, esp. for bluetooth's detection on polybar.
  fcitx-mozc-ut-unified # Input Method in Japanese.
  nerd-fonts-jetbrains-mono
  ttf-octicons # the alternative choice, ttf-all-the-icons, is for emacs.
  i3-wm
  conky-i3
  xsel
  eslint

  otf-nerd-fonts-fira-code
  docker-rootless
  docker-compose-bin # includes `docker`
  lazydocker
  eslint-plugin-snakecasejs
  eslint-plugin-node
  eslint-plugin-import
  eslint-plugin-vue
  eslint-plugin-promise
  nodejs-google-clasp # develop Apps Script in cmdline; type `gclasp`
  lazygit
  lib32-libpulse # for 32 bit programs like Wine
  lib32-apulse # for 32 bit programs like Wine
  pulseaudio-alsa # alsa config for pulseaudio
  # pacmixer # alsamixer alternative with pulseaudio (GUI)
  pulseaudio-ctl # pulseaudio from shell
  bluez-alsa-git # alsa backend with bluetooth
  pulseaudio-modules-bt-git # pulseaudio with bluetooth support
  nerd-fonts-ricty
  chrony # an alternative to ntp client/server
  j4-dmenu-desktop # search desktop applications
  google-chrome
  # openshot-git # video editor; cross-platform for Linux, Mac and Windows
  #gifcurry # GIF editor; depends on gtk
  supercollider # Programming Language to create sounds
  boost # Cpp source libraries - development headers
  # neovide-git # Neovim GUI written in Rust; cursor moves too slow.
  #otf-hasklig # low-heigh fonts
  #otf-operator-mono-nerd # too bold to read on Neovim-qt
  #nerd-fonts-victor-mono # too thin to read on Neovim-qt
  cling # cpp's interpretor; required for REPL. Install the default.
  st # a terminal emulater lighter than urxvt/xterm
  compiledb # a generator for clang's JSON
  git-secrets # type git secrets --install on a repo
  deno-bin # a better runtime than node.js which include TypeScript compiler
  sshfs # mount another filesystem via ssh
  php-fpm # required by nginx to run php
  # nginx-unit-php
  nginx
  android-emulator
  android-bash-completion
  # bluez-hid2hci
  # composer # php dependency manager on PHPStorm?
  rxvt-unicode-patched-with-truecolor
  # xcape # Config modifier keys to act as other keys with/without another key
  # skypeforlinux-stable-bin
  virtualbox # check kernel version by `uname -r`
  # llvm
  podman # a substitute for docker
  #haskell-language-server-git # returns 404
  #haskell-ide-engine # install as the language server; returns 404
  maven # Java's build tool
  languagetool # OSS server for spell check
  jdk8-openjdk
  jad # Java Decompiler
  openjdk11-src # includes both jdk11-openjdk and jre11-openjdk
  # powerline-fonts
  starship # a prompt set for any shell
  apache
  wireshark-qt # a packet capture
  ifplugd # for netctl to Ethernet
  # wpa_actiond # for netctl to Wifi
  phpunit # unit test for php
  # xampp # a distro of Apache including MySQL, SQLite PHP, Perl etc.
  shutter # make a screenshot!
  #ksnip # make a screenshot!; use shutter instead
  #wpa_supplicant_gui # wpa_supplicant on GUI, Qt; useless?
  #adb-screen-tools
  android-tools # includes `adb`
  #android-sdk-platform-tools # Platform-toools for Google Android SDK; conflict to android-tools
  # adbcontrol # Remote control Android through `adb`
  #intellij-idea-ultimate-edition-jre
  # eclipse-vrapper # provides vim-bind for eclipse
  # eclipse-java # an IDE for java
  php-pear # PHP Extension and Application Repository; it includes `pecl`
  #libreoffice-fresh-ja # returns 404
  #libreoffice-still-ja # returns 404
  gdb # a debugger
  lldb # a debugger for llvm
  bashdb # a bash's debugger
  #upx # returns 404; the Ultimate Packer for eXcutables
  #clojure-lsp-bin # returns 404
  # tk # necessary to push the first commit of cloned repo to remote fork?
  net-tools # includes `route`
  traceroute
  #gdrive # A Google Drive CLI Client; failed to get access token
  blugon # a blue light filter for X
  #thinkfinger # fprint may be an better alternative. A driver for fingerprint reader on ThinkPad; seems no use on the model
  #fprintd # no device found on thinkpad.
  #fingerprint-gui # No device found on thinkpad
  aide # Advanced Intrusion Detection Environment; checks file-integrity and detects intrusion
  # nerd-fonts-meslo # slightly thicker than dejavu. LG in the font-family name means Line-Gaps. DZ means Dotted-Zero(a dot in 0); without it, Slashed-Zero(a slash in 0)
  #nerd-fonts-dejavu-complete
  apvlv # a pdf view of vi-binding
  #inkscape # an image editor, like gimp and pinta
  nethogs # show network processes like `top` for cpu usage
  mosh # Mobile Shell, an alternative of ssh; survive disconnects
  # lxappearance-gtk3 # GTK+ theme switcher of LXDE (GTK+ 3 version)
  bibata-cursor-theme
  adapta-maia-theme
  papirus-icon-theme
  papirus-maia-icon-theme
  nitrogen # a browser of wallpaper
  picom-ibhagwan-git # an X compositor, an enhanced fork of compton
  #i3-wm-iconpatch # crashes too often
  #i3-scrot # screenshot on i3wm
  i3lock-fancy-git
  udiskie # a wrapper of udisk2 to mount automatically
  #uzbl # a browser w/ vim-like keybinds. The development ends.
  #doas # an alternative to sudo(1); a port of OpenBSD or try opendoas from 'community'
  # light-locker # use instead of i3lock, which doesn't work well with multiple monitors
  #lightdm-webkit2-greeter # set a theme for lightdm at login-window
  #lightdm-webkit-theme-litarvan # a theme for lightdm-webkit2-greeter. Cool.
  #jdk-openjdk # toggl-cli needs javac; or use java-environment-common. The symlink from /usr/bin/javac and so on may be broken; update it yourself.
  #toggl-cli # use python's one instead from github
  #jot # a cli tool to take a note
  #notes-cli-bin # a cli tool to take a note on markdown
  # dialog # used in `wifi-menu` at least
  ripgrep-all-bin # ripgrep in PDFs, E-Books, Office documents, zip, tar.gz, etc.
  tor-browser
  mmv # mv multiple files in your editor, for debian user
  #otf-sans-forgetica # a font scientifically designed for study notes. fails to work on qutebrowser
  transset-df # for transparency on xterm
  q4wine # gui for `wine`
  wine # a layer to run programs for Windows
  preload # preload apps on RAM; maybe requires to `systemctl disable preload` before remove the package
  trello-cli
  git-crypt
  fwupd # a daemon for firmware update
  dmidecode # installed w/ fwupd? anyway, necessary
  #cadaver  # WebDAV client, of which netrw makes use.
  #conky-lua-archers
  #android-studio # the official IDE for Android
  #crazydiskinfo # no use for NVMe. detects HDD/SSD through S.M.A.R.T; you know TBW(Tera Byte Written)?
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
  # aspell # for vim-codespell
  # aspell-en # for vim-codespell
  atool # compress/extract files detecting automaticcaly
  bash-completion
  blacklist_pcspkr # make sure to disable beep
  rustup
  gufw  # a simple firewall
  ccls # Language-Server for C, C++, Object-C
  clamav  # a security service of anti-virus, works on systemctl. update the virus-definetions by `freshclam`, which can also run on systemctl
  # clipgrab # a video downloader
  #cquery-git # LSP for C/C++/Obj-C, available on coc.nvim
  # dasht  # help?
  debtap # .deb even in arch!
  fzf
  ghc # a compiler for haskell
  global # GTAGS
  go
  # googlecl  # google api for cli; dependency is broken.
  hub  # an official wrapper of git
  i3-battery-popup-git # alert when battery is running out
  i3-volume
  luarocks
  multibootusb # to create live usb
  neovim-nightly
  neovim-qt
  gvim-gtk2
  # nerd-fonts-complete
  #nerd-fonts-ricty # unavailable
  #brew-git # a pkgm for macOS (or Linux)
  ninja # a build system for clang
  npm # necessary for coc's command at all even w/ yarn
  nvme-cli # a NVMe manager, can be a secure eraser
  # pavucontrol # Sound: GUI?
  #pdfarranger # a pdf editor
  pdfjs  # PDF viewer in browser
  peek # a screen recorder
  polybar # a substitute of i3-bar
  # pyenv
  qemu # for multibootusb
  qtqr-py3 # generate/decode QR codes
  rclone  # sync lib for cloud-service like dropbox, Gdrive.
  ripgrep
  ruby # rvm (Ruby version manager) is out of $PATH.
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
  online-judge-tools # Tools for Codeforces, AtCoder, HackerRanck, etc.
  pygments # for GTAGS
  xkeysnail # remapper for each devices/apps
  sqlparse # parse for SQL; used in vim-sqlfmt
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
  prettier # formatter for Javascript, Markdown, etc.
  typescript
  ts-node
  intelephense # a LSP server for php
  nvm # a version manager of Node.js
  #graphql-language-server # no longer supported
  #tslib
  bash-language-server
  diagnostic-languageserver
  dockerfile-language-server-nodejs
  #go-language-server # no longer maintained; use gopls instead
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

# config: /etc/php/php.ini
PECLs=(
  xdebug # required by vdebug, a vim's debugger
)

GHQs=(
  LaurenceWarne/qute-code-hint
  kepi/qutepocket # currently fails on authentication.
  sachaos/toggl
)

REMOVEs=(
  i3blocks
  i3blocks-contrib
  manjaro-hello
  manjaro-i3-settings
  manjaro-ranger-settings
  morc_menu # dmenu on bash
  mousepad # default editor for Xfce
)

export grep=$(type rg >/dev/null 2>&1 && echo rg || echo grep)
export green="\e[0;32m"
export purple="\e[0;35m"
export white="\e[0;37m"

CWD=$(pwd)
cd "$HOME"

notify() {
  msg=$1
  [ -z "$msg" ] && return
  if type notify-send >/dev/null 2>&1; then
    notify-send --expire-time 3500 --urgency=critical "$msg"
  fi
  echo "$msg"
}

# DETECT PACKAGE MANAGER {{{1
INSTALLERs=(
  yay
  apt
)

for i in "${INSTALLERs[@]}"; do
  type "$i" >/dev/null 2>&1 && export INSTALLER="$i" && break
done

[[ -n $INSTALLER ]] && echo "Installer is identified, $INSTALLER!"

# REMOVE UNNECESSARY {{{1

for p in "${REMOVEs[@]}"; do
  yay -Q "$p" >/dev/null 2>&1 || continue
  echo "Remove an unnecessary package, \"$p\""
  yay -Rs "$p"
done

# INSTALL PACKAGES {{{1
declare -A Install
Install=(
  ['yay']='yay -S'
  ['apt']='sudo apt install'
)

export install="${Install[$INSTALLER]}"
echo
echo -e "[${purple}pkgm${white}] Authentication of \"root\" is required to proceed..."

for p in "${PACKAGEs[@]}"; do
  yay -Q "$p" >/dev/null 2>&1 && continue

  echo
  echo -ne "Install ${green}$p${white} [y/n]? "
  read -r answer

  if echo "$answer" -eq | $grep -i --quiet "^y"; then
    if $install "$p"; then
      notify "$p was installed!"
    else
      notify "Abort installing $p"
    fi
  fi
done

# INSTALL OTHER PACKAGES {{{1
#echo "Updating npm..."
#sudo npm install -g npm

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

# Ref: https://www.rust-lang.org/tools/install
type rustup >/dev/null 2>&1 || curl https://sh.rustup.rs -sSf | sh
rustup install nightly
rustup default nightly

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

sudo pecl channel-update pecl.php.net
for p in "${PECLs[@]}"; do
  sudo pecl install "$p"
done

if type yarn; then
  yarn global add yarn
else
  echo 'Installing yarn...'
  curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
fi

echo 'Checking packages if installed already.  Please wait a second...'
for p in "${YARNs[@]}"; do
  # TODO: filter YARNs `yarn global list` is too slow to execute often
  yarn global list | $grep "$p" >/dev/null 2>&1 || yarn global add "$p"
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

#URXVT_PATCHED=rxvt-unicode-truecolor-illef
#URXVT_PATCHED_DIR=/tmp/$URXVT_PATCHED
#git clone -b master --depth 1 https://github.com/illef/$URXVT_PATCHED $URXVT_PATCHED_DIR
#cd $URXVT_PATCHED_DIR
#makepkg -si

# ACTIVATION {{{1
echo "Enable systemd-networkd:"
systemctl enable systemd-networkd.service
echo "Enable systemd-networkd@:"
systemctl enable systemd-networkd@.service

echo "Recache fonts"
fc-cache --verbose

echo "Activate MySQL:"
# Ref: https://dominicm.com/install-mysql-mariadb-on-arch-linux/
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
mysql_secure_installation

# Git {{{1
git secrets --install .git-templates/git-secrets

# END {{{1

cd "$CWD"
