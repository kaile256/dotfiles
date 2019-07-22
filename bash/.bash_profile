# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
if [ -d /data/data/com.termux ]; then
  cd ~
  ./start-parrot.sh
fi
