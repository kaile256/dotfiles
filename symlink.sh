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

if ! [ -d $XDG_CACHE_HOME ]; then
  mkdir ${HOME}/.cache
fi
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
cache_list=(
  nvim/backup
  )

config_list=(
  share
  nvim
  bash
  fish
  tmux
  ctags
  git
  w3m
  zsh
)

for cache_pair in ${cache_list[@]}; do
  echo cache_pair | awk -F'[/]' |
  #dest_cache=${XDG_CACHE_HOME}/${cache_dir}
  #export cache_dest=$1 &&
  #export cache_dir=$2

  cd ${XDG_CACHE_HOME}/nvim
  #cd ${cache_dest}
  ln -nsf ${DOTFILES}/cache/${cache_pair}
  
  echo "Done! The cache files of ${cache_pair} are linked at ${XDG_CACHE_HOME}"
done

for config_dir in ${config_list[@]}; do
  config_dest=${XDG_CONFIG_HOME}/${config_dir}

  #TODO: destinations should be decided like from directory.
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
ln -nsf ${XDG_CONFIG_HOME}/bash/.bash_profile .bash_profile
ln -nsf ${XDG_CONFIG_HOME}/bash/.bashrc .bashrc
echo "Done! Placed .bash_profile & .bashrc on ${HOME}"
# Tmux
ln -nsf ${XDG_CONFIG_HOME}/tmux/tmux.conf .tmux.conf
echo "Done! Placed .tmux.conf on ${HOME}"
# Ctags
ln -nsf ${XDG_CONFIG_HOME}/ctags/.ctags
echo "Done! Made a symbolic link for ctags!"
# Tig
ln -nsf ${XDG_CONFIG_HOME}/git/.tigrc
ln -nsf ${XDG_CONFIG_HOME}/git/.gitconfig
echo "Done! Made a symbolic link for git!"

## Directories
# W3m
ln -nsf ${XDG_CONFIG_HOME}/w3m .w3m
echo "Done! Made a symbolic link for w3m!"
# Vim
#if [ -d ${HOME}/.vim ]; then
# rm -rf  ${HOME}/.vim
# echo "Deleted old .vim-dir!"
#fi
if [ -f ${HOME}/.vim/.netrwhist ]; then
  rm ${HOME}/.vim/.netrwhist
  rm -rf  ${HOME}/.vim
fi
ln -nsfT ${XDG_CONFIG_HOME}/nvim .vim
ln -nsfT ${XDG_CONFIG_HOME}/zsh/zplugin/zshenv_zplugin .zshenv
echo "Done! Made a symbolic link for vim!"

cd $CURRENT_DIR

cat << END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
SYMBOLIC LINKS ARE COMPLETED
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

END
