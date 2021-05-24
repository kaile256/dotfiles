# `paccache -ruk3`
# All themes set in `lxappearance`

# Font:
noto-fonts-cjk # fonts for Chinese, Japanese and Korean
# ttf-migu # font for Japanese, used in Nerd font, too.
ttf-junicode # font of runic alphabet, esp. for bluetooth's detection on polybar.
# ttf-octicons # the alternative choice, ttf-all-the-icons, is for emacs.
nerd-fonts-jetbrains-mono
# otf-nerd-fonts-fira-code
# nerd-fonts-ricty
#otf-hasklig # low-heigh fonts
#otf-operator-mono-nerd # too bold to read on Neovim-qt
#nerd-fonts-victor-mono # too thin to read on Neovim-qt
# powerline-fonts
#nerd-fonts-dejavu-complete
#otf-sans-forgetica # a font scientifically designed for study notes. fails to work on qutebrowser
#nerd-fonts-inconsolata-go
# nerd-fonts-complete
ttf-font-icons  # Mix Icon with Awesome & Ionicons without Confliction.
ttf-twemoji-color # SVG-in-OpenType emoji fonts by Twitter

# System
strace

# Shell
fish
tmux
# zsh

easystroke-git # Use mouse gestures

deadd-notification-center-bin # GTK-notifier instead of dunst
# dunst # a notification-tool, notify-send
qutebrowser-git
# fcitx-mozc-ut-unified # Input Method in Japanese.
xsel
xclip

# Eslint: Install its plugins local in projects.
eslint
# eslint-plugin-snakecasejs
# eslint-plugin-node
# eslint-plugin-import
# eslint-plugin-vue
# eslint-plugin-promise

xorg-xinput # removed with `bmenu`
lshw # removed with `bmenu`

# Fcitx
fcitx5-im # A group of fcitx5 packages. Engines should be installed independently.
fcitx5-mozc
fcitx5-skk # fcitx5 is written in CPP while fcitx is in C and under maintenance.
fcitx5-skin-arc # A theme for fcitx5.
fcitx5-lua

# IBus
ibus-skk

# Compatible Layer: run applications which're not for Linux:
darling-git # Run MacOS Apps on Linux; `darling shell` to `installer -pkg foo.pkg` to install .pkg file
q4wine # gui for `wine`
wine # a layer to run programs for Windows
wine-mono-bin # Replacement for Microsoft's .NET Framework in Wine.
wine-gecko # Replacement for Microsoft's Internet Explorer in Wine.
winetricks # REdistributable runtime libraries in Wine.

# Window Manager
i3-wm
conky-i3
i3-battery-popup-git # alert when battery is running out
# i3-volume
#i3pystatus
#i3-style
# dmenu-manjaro
#i3-wm-iconpatch # crashes too often

# Bluetooth
bluez   # for Bluetooth
bluez-utils
bluez-hid2hci
bluez-alsa-git # alsa backend with bluetooth

nitrogen # a browser of wallpaper
picom-ibhagwan-git # an X compositor, an enhanced fork of compton
multilockscreen # configurable wrapper i3-color, more flexible than i3lock-multimonitor
polybar # a substitute of i3-bar

# Sway: working on Wayland
qt5-wayland
# sway # A substitute of i3wm
# waybar # Replacement to polybar

# Xmonad
xmonad
xmonad-contrib # Addons
xmonad-utils # Addons
xmobar # Status bar written in haskell

# Screenshot: mouse to select range
# shutter # has broken dependency on perl version.
# ksnip # --rectarea to select by mouse.
# i3-scrot # screenshot on i3wm
# fbgrab # only select range by decimal arguments.
# simplescreenrecorder # GUI to select range by mouse; also recordable
flameshot # option-gui to select by mouse
gyazo # Upload screenshot to gyazo.com, easy to share captures for a while

# Login Manager:
#lightdm-webkit2-greeter # Set theme on lightdm with Greeter; cannot <C-u>
#lightdm-webkit-theme-litarvan # a theme on lightdm-webkit2-greeter. Cool.
lightdm-slick-greeter # <C-u> to reset password input
# light-locker # use instead of i3lock, which doesn't work well with multiple monitors

# LSP
gopls # for go
codeql # CLI tool for GitHub's CodeQL.

# Qutebrowser:

# For Vim:
neovim-nightly-bin
neovim-qt
gvim-gtk2
fvim # Neovim front-end UI built with F# & Avalonia
# neovide-git # Neovim GUI written in Rust; cursor moves too slow.
goneovim-bin
sc-im # Spread sheet.  Used by vim-scimark.
# neovim-remote # nvr
ctags # esp. for Vista on Vim
global # GTAGS
hunspell-en_us # spell dictionaries

# Git
git-crypt
git-brws
git-delta-bin # Syntax highlight for git-diff
git-secrets # type git secrets --install on a repo
git-revise
github-cli
gibo # Generate boilerplate of '.gitignore'.

# diff-so-fancy # Better highlight for diff.
sshrc # Bring .bashrc, .vimrc, etc., under ~/.sshrc.d on SSH; keep light config.
rofi # A launcher
virustotal # CLI client for virustotal.com

# Web
heroku-cli

# Diagram
graphviz # Visualize graph. Used by weirongxu/plantuml-previewer.vim.

python-gphotos-sync # Sync google photo to local directory.
notes-cli-git
gparted # Format SSD/HDD.
polar-bookshelf-bin
xkeysnail # remapping tool for X written in Python
lua-lcf # formatter for lua
lua51-formatter # Formatter for lua5.1 which's used in Neovim.
luacheck # linter for lua, integrating with lua-lsp
# lua-lsp-git # rarely updated; no longer supported by coc-lua
lua-language-server
lua51-busted # Unit test for lua

# Python
pyenv # cannot install by pip.
pipenv # depends on pyenv.
python-poetry # Faster, and more informative than pipenv

code # vscode
stylelint # a linter for CSS
ueberzug # previewer for some tools
python-pyperclip # Copy texts with <NL> for LaurenceWarne/qute-code-hint
xbindkeys # to disable middle to paste, but enable scroll.
# docker-rootless # No longer supported.
docker-compose-bin # includes `docker`
lazydocker
nodejs-google-clasp # develop Apps Script in cmdline; type `gclasp`
# lazygit
lib32-libpulse # for 32 bit programs like Wine
lib32-apulse # for 32 bit programs like Wine
pulseaudio-alsa # alsa config for pulseaudio
pulseaudio-ctl # pulseaudio from shell
pulseaudio-modules-bt-git # pulseaudio with bluetooth support
chrony # an alternative to ntp client/server
# j4-dmenu-desktop # search desktop applications
google-chrome
# openshot-git # video editor; cross-platform for Linux, Mac and Windows
#gifcurry # GIF editor; depends on gtk
supercollider # Programming Language to create sounds
boost # Cpp source libraries - development headers
cling # cpp's interpretor; required for REPL. Install the default.
st # a terminal emulater lighter than urxvt/xterm
compiledb # a generator for clang's JSON
deno # a better runtime than node.js which include TypeScript compiler
sshfs # mount another filesystem via ssh
php-fpm # required by nginx to run php
# nginx-unit-php
nginx
android-emulator
android-bash-completion
# composer # php dependency manager on PHPStorm?
rxvt-unicode-patched-with-truecolor
# xcape # Config modifier keys to act as other keys with/without another key
# skypeforlinux-stable-bin

# Virtual Box
virtualbox # check kernel version by `uname -r`
linux510-virtualbox-host-modules
linux510-virtualbox-guest-modules

# llvm
podman # a substitute for docker

# Haskell
haskell-language-server-bin
ghc # a compiler for haskell
stack # package manager for haskell.
hlint # Linter for haskell

maven # Java's build tool

# Languagetool
languagetool # OSS server for spell check
# languagetool-ngrams-en # n-gram data to find errors.  Too heavy.
languagetool-word2vec-en # neural network rules to find errors.

jdk8-openjdk
jad # Java Decompiler
openjdk11-src # includes both jdk11-openjdk and jre11-openjdk
starship # a prompt set for any shell
apache
wireshark-qt # a packet capture
ifplugd # for netctl to Ethernet
# wpa_actiond # for netctl to Wifi
phpunit # unit test for php
# xampp # a distro of Apache including MySQL, SQLite PHP, Perl etc.
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
xorg-xgamma # optionally used by blugon as the backend.
#thinkfinger # fprint may be an better alternative. A driver for fingerprint reader on ThinkPad; seems no use on the model
#fprintd # no device found on thinkpad.
#fingerprint-gui # No device found on thinkpad
aide # Advanced Intrusion Detection Environment; checks file-integrity and detects intrusion
apvlv # a pdf view of vi-binding
#inkscape # an image editor, like gimp and pinta
nethogs # show network processes like `top` for cpu usage
mosh # Mobile Shell, an alternative of ssh; survive disconnects

# Theme: Edit $XDG_CONFIG_HOME/gtk-3.0/settings.ini
bibata-cursor-theme
# adapta-maia-theme
papirus-icon-theme
papirus-maia-icon-theme
paper-gtk-theme

udiskie # a wrapper of udisk2 to mount automatically
#uzbl # a browser w/ vim-like keybinds. The development ends.
#jdk-openjdk # toggl-cli needs javac; or use java-environment-common. The symlink from /usr/bin/javac and so on may be broken; update it yourself.
#toggl-cli # use python's one instead from github
#jot # a cli tool to take a note
#notes-cli-bin # a cli tool to take a note on markdown
# dialog # used in `wifi-menu` at least
ripgrep-all-bin # ripgrep in PDFs, E-Books, Office documents, zip, tar.gz, etc.
# tor-browser
transset-df # for transparency on xterm
preload # preload apps on RAM; maybe requires to `systemctl disable preload` before remove the package
trello-cli
fwupd # a daemon for firmware update
dmidecode # installed w/ fwupd? anyway, necessary
#cadaver	# WebDAV client, of which netrw makes use.
#conky-lua-archers
#android-studio # the official IDE for Android
#gendesk # what?
#jinja2 # for neovim-qt
#jre # Java Runtime Environment, required by vim-gramarous; choose default
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
gufw	# a simple firewall
ccls # Language-Server for C, C++, Object-C
clamav  # a security service of anti-virus, works on systemctl. update the virus-definetions by `freshclam`, which can also run on systemctl
# clipgrab # a video downloader
#cquery-git # LSP for C/C++/Obj-C, available on coc.nvim
# dasht  # help?
debtap # .deb even in arch!
fzf
go
# googlecl  # google api for cli; dependency is broken.
hub  # an official wrapper of git
luarocks
multibootusb # to create live usb
ninja # a build system for clang
npm # necessary for coc's command at all even w/ yarn
nvme-cli # a NVMe manager, can be a secure eraser
# pavucontrol # Sound: GUI?
#pdfarranger # a pdf editor
pdfjs  # PDF viewer in browser
peek # a screen recorder
# pyenv
qemu # for multibootusb
qtqr # generate/decode QR codes
rclone  # sync lib for cloud-service like dropbox, Gdrive.
ripgrep
#rxvt-unicode-truecolor # broken; instead, use https://github.com/illef/rxvt-unicode-truecolor-illef: installed in THE OTHERS
screenkey # display typed-key; useful w/ peek
shellcheck  # a linter for shell
#task # taskwarrior
#vit # taskwarrior on TUI w/ vi-key bindings
the_silver_searcher # ag
tlp	# Save Battery of PC
vimiv-qt # an image-viewer. Use qt ver.; gtk won't update
vmail
xorg-xbacklight  # backlight
xorg-xev # Get button/key name
yarn
zotero # organize research sources, essays.

# SKK
yaskkserv # Yet Another SKK Server
skk-jisyo
libskk
skk-emoji-jisyo
skktools

fd # an alternative for find


