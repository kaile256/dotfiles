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
  #nvim/swap
  qutebrowser/greasemonkey
  qutebrowser/userscripts
)

HOMEs=(
  .Xmodmap
  .Xresources
  .Xresources.d
  .bashrc
  .ctags
  .doom.d
  .editorconfig
  .gitconfig
  .gitignore
  .gonvim
  .gvimrc
  .markdownlint.yaml
  .myscripts
  .profile
  .taskrc
  .tigrc
  .vimrc
  .vimspector.json
  .zshenv
  bin
)

CONFIGs=(
  X11
  bash
  fish
  lynx
  nvim
  starship.toml
  tmux
  w3m
  zsh
)

NON_ANDROIDs=(
  alacritty
  awesome
  blugon # blue light modifier
  dunst # for `notify-send`
  fcitx
  glrnvim.yml
  i3
  mimeapps.list # for qutebrowser should be the default browser
  nyaovim
  polybar # a status bar
  qutebrowser
  ranger/rc.conf
  vimiv # an image viewer
)

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

echo "Making Symbolic Links..."
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

echo

if [ "$(uname -o)" != "Android" ]; then
  for i in "${LOCALs[@]}"; do
    ln -nsf "${DOTFILES}/.config/$i" "${XDG_DATA_HOME}/$i"
    echo "Done! at ${XDG_DATA_HOME}/$i"
  done

  echo

  for i in "${NON_ANDROIDs[@]}"; do
    ln -nsf "${DOTFILES}/.config/$i" "${XDG_CONFIG_HOME}/$i"
    echo "Done! at ${XDG_CONFIG_HOME}/$i"
  done
fi

if type notify-send >/dev/null 2>&1 ; then
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
