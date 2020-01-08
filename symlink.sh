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

LOCALs=(
  qutebrowser/userscripts
  qutebrowser/greasemonkey
  #nvim/swap
)

HOMEs=(
  .myscripts
  .vimrc
  .Xmodmap
  .Xresources
  .bashrc
  .taskrc
  .profile
  .ctags
  .doom.d
  .gitconfig
  .tigrc
  .gonvim
  .zshenv
)

CONFIGs=(
  alacritty
  awesome
  bash
  dunst # for `notify-send`
  fcitx
  fish
  glrnvim.yml
  i3
  ranger/rc.conf
  lynx
  mimeapps.list # for qutebrowser should be the default browser
  nvim
  nyaovim
  polybar # a status bar
  qutebrowser
  tmux
  vimiv # an image viewer
  w3m
  zsh
)

CURRENT_DIR=$PWD #{{{1

XDG_CACHE_HOME="${HOME}/.cache"
XDG_CONFIG_HOME="${HOME}/.config"
XDG_DATA_HOME="${HOME}/.local/share"

if ! [ -d "$XDG_CONFIG_HOME" ]; then
  mkdir "${HOME}/.config"
fi

## Make sure 'dotfiles' are located at supported directory.
if [ -d "${HOME}/dotfiles" ]; then
  DOTFILES="${HOME}/dotfiles"

elif [ -d "${HOME}/.cache/dotfiles" ]; then
  DOTFILES="${HOME}/.cache/dotfiles"

else
  echo "Please clone dotfiles either at ${HOME} or ${XDG_CACHE_HOME}"
  exit 1
fi

echo "Making Symbolic Links..." #{{{1
echo

for i in "${LOCALs[@]}"; do
  ln -nsf "${DOTFILES}/$i" "${XDG_DATA_HOME}/$i"
  echo "Done! at ${XDG_DATA_HOME}/$i"
done

echo

for i in "${HOMEs[@]}"; do
  ln -nsf "${DOTFILES}/$i" "${HOME}/$i"
  echo "Done! at ${HOME}/$i"
done

echo

for i in "${CONFIGs[@]}"; do
  ln -nsf "${DOTFILES}/.config/$i" "${XDG_CONFIG_HOME}/$i"
  echo "Done! at ${XDG_CONFIG_HOME}/$i"
done

cd "$CURRENT_DIR"

if type notify-send >/dev/null; then
  notify-send --expire-time 1800 'Symbol links are created correctly'
  cat << END

================================================================================
END

else
  cat << END
================================================================================

SYMBOLIC LINKS COMPLETED

================================================================================
END
fi
