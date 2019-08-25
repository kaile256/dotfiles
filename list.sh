# List of Packages I want.
Package=(
anyenv
arandr  # Gui config for xrandr
bash-completion
cargo  # select rustup
fzf
gendesk
ghq-bin
global
go
googlecl  # google api for cli
hub  # an official wrapper of git
luarocks
msgpack-c  # for nvim-qt's error while loading shared libraries: libmsgpackc.so.2: cannot open shared object file: No such file or directory
neovim-nightly
neovim-qt
nerd-fonts-ricty
otf-sfmono  # Font; SF Mono
pyenv
python-oauth2client
python-pipenv
rclone  # sync lib for cloud-service like dropbox, Gdrive.
ripgrep
ruby
rxvt-unicode-truecolor  # Terminal Emulater
the_silver_searcher
tlp   # Save Battery of PC
ttf-cica
ttf-font-icons  # Mix Icon with Awesome & Ionicons without Confliction.
ttf-myricam
tty-dejavu
vimiv
vmail
xf86-input-synaptics  # enable config for Touchpad
yarn
zsh
)

# Yarn
YarnPack=(
bash-language-server  # LSP
neovim
)

GemRepos=(
neovim
)
PipRepos=(
pynvim
)

#git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
# doom-emacs: an emacsen for alt-vimmer.
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom quickstart

echo "Installing Lua-LSP..."
sudo luarocks install --server=http://luarocks.org/dev lua-lsp
echo "Installing luacheck..."
sudo luarocks install luacheck
# Formatter for Lua 5.1
#sudo luarocks install Formatter
# Formatter for Lua 5.3

if ! [ -e '~/.local/share/rustup/update-hashes/stable-*' ]; then
  rustup install stable
  rustup default stable
fi

## Rustup Completions
if ! [ -e '~/.local/share/bash-completion/rustup' ]; then
  mkdir -p ~/.local/share/bash-completion
  rustup completions bash > ~/.local/share/bash-completion/rustup
fi

if ! [ -e '~/.config/fish/completions/rustup.fish' ]; then
  mkdir -p ~/.config/fish/completions
  rustup completions fish > ~/.config/fish/completions/rustup.fish
fi
