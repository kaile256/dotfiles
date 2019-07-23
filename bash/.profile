# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.

# Before .bashrc.
if [ -d /data/data/com.termux ]; then
  cd ~
  ./start-kali.sh
fi

if [ "$ZSH" ]; then
  . ~/.config/zsh/zshrc
fi

# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.config/bash/.bashrc ]; then
    . ~/.config/bash/.bashrc
  fi
fi

mesg n || true

bash
