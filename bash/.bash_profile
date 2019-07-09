# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022
umask 002

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

## PATH
LINUXBREW="/home/linuxbrew/.linuxbrew"
export PATH="${LINUXBREW}/bin:$PATH"
export PATH="${LINUXBREW}bin:$PATH"
#export PATH="$HOME/.cargo/bin:$PATH"
#export PATH="${LINUXBREW}/bin/nvim:$PATH"
#export PATH="${LINUXBREW}/bin/w3m:$PATH"
#export PATH="${LINUXBREW}/bin/fish:$PATH"

## ENV
export DISPLAY="localhost:0.0"

## ORIGINAL ENV
export DOTFILES="$HOME/.ghq/github.com/kaile256/dotfiles"
