# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.

# Before .bashrc.
if [ -d /data/data/com.termux ]; then
  cd ~
  ./start-kali.sh
fi

source ~/.config/bash/xdg.sh
source ~/.config/bash/bashrc

if ! [ -z `echo "$SHELL" | grep zsh` ]; then
  source ${ZDOTDIR}/zshrc
fi

