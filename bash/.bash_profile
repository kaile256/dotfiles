# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
umask 002

## Write Config on $POSIX_SHARE!
POSIX_SHARE=$HOME/.config/bash/posix
source ${POSIX_SHARE}/*.sh

#### SOURCE
# .bashrc
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
    fi
fi
