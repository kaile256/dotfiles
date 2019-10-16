#!/usr/bin/env bash

# C-option: do not overwrite on redirect; replace '>' with '>|' to surely overwite a file.
# u-option: stop if an undefined variable is set, or undefined var shall be regarded as null.
#           (e.g., var=foo && rm -fr ~/"$bar" shall remove all of '~')
# e-option: stop if error (non 0); add '&& true' to continue even when error;

#  CAUTION: DON'T set e-option on files sourced from .profile/.bashrc; an error prohibits boot-system.

set -Cue

CURRENT_DIR=$PWD
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

## $XDG programs;
echo 'making symbolic links...'
#vimData=(
#  #backup
#  #swap
#  #undo
#)

configs=(
  alacritty
  awesome
  bash
  fish
  fcitx
  glrnvim.yml
  i3
  lynx
  nvim
  nyaovim
  qutebrowser
  tmux
  vim
  w3m
  zsh
)

#configFiles=(
#  qtile/config.py
#)

# non-XDG based programs;
# Create symbolic links at $HOME via $XDG_CONFIG_HOME.
home_list=(
  .vimrc
  .Xmodmap
  .Xresources
  .bashrc
  .profile
  .ctags
  .doom.d
  .gitconfig
  .tigrc
  .gonvim
  .zshenv
)

for config_dir in "${configs[@]}"; do
  cd "${XDG_CONFIG_HOME}"
  ln -nsf "${DOTFILES}/${config_dir}" .
  echo "Done! The config files of ${config_dir} are linked at ${XDG_CONFIG_HOME}!!"
done

echo ""
echo "Done! All the dotfiles are linked to ${XDG_CONFIG_HOME}"

#for config_dest in "${configFiles[@]}"; do
#  cd config_dest
#  for config_files in "${configFiles[@]}"; do
#    ln -nsf "${DOTFILES}/config_files" .
#    echo "Done! create a symlink for ${config_files} on ${config_dest}!"
#  done
#done

cd "$HOME"
for home_link in "${home_list[@]}"; do
  ln -nsf "${DOTFILES}/${home_link}" .
  echo "Done! create a symlink for ${home_link} on ${HOME}!"
done

## Bash
#ln -nsf ${XDG_CONFIG_HOME}/bash/.profile
#echo "Done! Placed .profile on ${HOME}"
## Ctags
#ln -nsf ${XDG_CONFIG_HOME}/ctags/.ctags
#echo "Done! create a symlink for ctags on ${HOME}!"
## Tig
#ln -nsf ${XDG_CONFIG_HOME}/git/.tigrc
#ln -nsf ${XDG_CONFIG_HOME}/git/.gitconfig
#echo "Done! create symlinks for git on ${HOME}!"
#ln -nsf ${XDG_CONFIG_HOME}/w3m .w3m
#echo "Done! create a symlink for w3m on ${HOME}"

cd "$CURRENT_DIR"

cat << END

================================================================================

SYMBOLIC LINKS COMPLETED

================================================================================

END
