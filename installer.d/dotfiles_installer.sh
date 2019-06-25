#!/bin/bash

set -u

# get dir
EXEC_DIR = $(cd $(dirname $0); pwd

cd $EXEC_DIR
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
	cd ${EXEC_DIR}/
	brew update

fi

cat << END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
DOTFILES SETUP FINISHED
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

END
