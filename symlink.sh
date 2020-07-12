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
  .goneovim
  .vimrc
  .vim
  .vimspector.json
  .zshenv
  bin
)

CONFIGs=(
  X11
  bash
  fish
  kitty
  lynx
  nnn
  nvim
  picom.conf
  starship.toml
  tig
  tmux
  vifm
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

notify_msg() {
  msg=$1
  [ -z "$msg" ] && return
  if type notify-send >/dev/null 2>&1; then
    notify-send --expire-time 3500 --urgency=critical "$msg"
  fi
  echo "$msg"
}

create_symlink() {
  target=$1
  resource="${DOTFILES}/$2/$target"
  dest=$3/$target

  if [ -e "$dest" ]; then
    if ! readlink "$dest" >/dev/null 2>&1 && ! rmdir "$dest"; then
      notify_msg "Abort -- \"$dest\" existed; the path is in clipboard"
      echo -n "$dest" | xclip -selection clipboard
      exit 1
    fi
  fi

  ln -nsf "$resource" "$dest"
  echo "Done! at $dest"
  return
}

for i in "${HOMEs[@]}"; do
  create_symlink "$i" "" "$HOME"
done

echo

for i in "${CONFIGs[@]}"; do
  create_symlink "$i" .config "$XDG_CONFIG_HOME"
done

echo

if [ "$(uname -o)" != "Android" ]; then
  for i in "${LOCALs[@]}"; do
    create_symlink "$i" .config "$XDG_DATA_HOME"
  done

  echo

  for i in "${NON_ANDROIDs[@]}"; do
    create_symlink "$i" .config "$XDG_CONFIG_HOME"
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
