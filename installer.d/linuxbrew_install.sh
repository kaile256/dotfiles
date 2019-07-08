#!/bin/bash
# install linuxbrew & brew formulae.

echo "installing environment of kaile256..."
echo "modify permissions..."
sudo chown kaile256:kaile256 -R /home/linuxbrew
ln -s /home/linuxbrew/.linuxbrew $HOME/.linuxbrew
sudo chmod -R u+x $HOME/.linuxbrew/bin
echo "Done!"

#echo 'export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' >> $HOME/.bash_profile
#echo 'export PATH="/home/linuxbrew/.linuxbrew/sbin:$PATH"' >> $HOME/.bash_profile
#exec bash
#eval $(~/.linuxbrew/bin/brew shellenv)

echo 'run brew doctor...'
which brew > /dev/null 2>&1 && brew doctor

echo 'run brew update...'
which brew > /dev/null 2>&1 && brew update

echo 'run brew upgrade...'
brew upgrade --all

formulae=(
	git
	wget
	curl
	tree
	openssl
	node
	python3
	lua
	mysql
	sqlite
	ricty
)

echo 'start brew install apps...'
for formula in '${formulae[@]'; do
	brew install $formulae || brew upgrade $forulae
done

echo 'run brew cleanup...'
brew cleanup

### brew-fish
brew install fish ghq fzf ripgrep
echo "/home/linuxbrew/.linuxbrew/bin/fish" > /etc/shells

### brew-neovim
brew install neovim ruby python yarn pyenv
echo "/home/linuxbrew/.linuxbrew/bin/nvim" > /etc/shells

### brew-coc;
# DONT brew install rust;
# rustup-init would install rust, rustc, etc., and setup path recommended.
brew install rustup

### brew-tmux;
# apm-server may help tmux-plugins show OS-battery-status.
#brew install tmux
brew install xclip screen apm-server
#chmod -R 700 $HOME/.linuxbrew/bin/tmux
#echo /home/linuxbrew/.linuxbrew/bin/tmux > /etc/shells

### brew-others
brew install kotlin tig
## browser
brew install chrome-cli

cat << END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
HOMEBREW INSTALLED
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

END

