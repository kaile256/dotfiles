#! /usr/bin/env bash

# C-option: do not overwrite on redirect; replace '>' with '>|' to surely overwite a file.
# e-option: stop if error (non 0); add '&& true' to continue even when error.
# u-option: stop if an undefined variable is set, or undefined var shall be regarded as null.
#           (e.g., var=foo && rm -fr ~/"$bar" shall remove all of '~')
set -Ceu

CURRENT_DIR=$PWD
XDG_CACHE_HOME="${HOME}/.cache"
XDG_CONFIG_HOME="${HOME}/.config"
POSIX_SHARE="${XDG_CONFIG_HOME}/share/posix"

if ! [ -d $XDG_CONFIG_HOME ]; then
  mkdir ${HOME}/.config
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
## activate them, making symbolic links at $XDG_CONFIG_HOME from $DOTFILES.
echo 'making symbolic links...'

config_list=(
  bash
  ctags
  fish
  git
  npm
  nvim
  tmux
  zsh
)

for config_dir in ${config_list[@]}; do
  config_dest=${XDG_CONFIG_HOME}/${config_dir}

  cd ${XDG_CONFIG_HOME}
  ln -nsf ${DOTFILES}/${config_dir}
  
  echo "Done! The config files of ${config_dir} are linked at ${XDG_CONFIG_HOME}"
done

echo ""
echo "Done! All the dotfiles are linked to ${XDG_CONFIG_HOME}"

### non-XDG programs;
### activate them, making symbolic links at $HOME via $XDG_CONFIG_HOME.
cd $HOME

## Files
# Bash
ln -nsf ${XDG_CONFIG_HOME}/bash/.profile
ln -nsf ${XDG_CONFIG_HOME}/bash/bashrc
echo "Done! Placed .profile on ${HOME}"
# Ctags
ln -nsf ${XDG_CONFIG_HOME}/ctags/.ctags
echo "Done! Made a symbolic link for ctags!"
# Tig
ln -nsf ${XDG_CONFIG_HOME}/git/.tigrc
ln -nsf ${XDG_CONFIG_HOME}/git/.gitconfig
echo "Done! Made a symbolic link for git!"

cd $CURRENT_DIR

cat << END

================================================================================

SYMBOLIC LINKS ARE COMPLETED

================================================================================

END

### Dein
echo "Installing dein.vim..."

PLUGIN_DIR=$HOME/.cache//nvim/dein
INSTALL_DIR="${PLUGIN_DIR}/repos/github.com/Shougo/dein.vim"
echo "Install to \"$INSTALL_DIR\"..."
if [ -e "$INSTALL_DIR" ]; then
  echo "\"$INSTALL_DIR\" already exists!"
fi

echo ""

# check git command
type git || {
  echo 'Please install git or update your path to include the git executable!'
  exit 1
}
echo ""

# make plugin dir and fetch dein
if ! [ -e "$INSTALL_DIR" ]; then
  echo "Begin fetching dein..."
  mkdir -p "$PLUGIN_DIR"
  git clone https://github.com/Shougo/dein.vim "$INSTALL_DIR"
  echo "Done."
  echo ""
fi

cat << EOD
===============================================================================

NOW, DEIN IS READY!!!

===============================================================================

EOD
