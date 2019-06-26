#!/bin/bash
#
# Dotfiles installer for Ubuntu1804

set -u

# get dir
BASE_DIR = $(cd $(dirname $0); pwd

cd $BASE_DIR
git submodule init
git submodule update

echo "start setup..."
for f in .??*; do
	[ "$f" = ".git" ] && continue
	[ "$f" = ".gitconfig.local.template" ] && continue
	[ "$f" = ".gitmodules" ] && continue

	ln -snfv ~/dotfiles/"$f" ~/
done

[ -e ~/.gitconfig.local ] || cp ~/dotfiles/.gitconfig.local.template ~/.gitconfig.local

# neovim set up
if
	echo 'setup init.vim...'
	cd ${BASE_DIR}/
	brew update

fi

cat << END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
DOTFILES SETUP FINISHED
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

END
