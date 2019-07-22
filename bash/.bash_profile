# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
if [ -d /data/data/com.termux ]; then
  cd ~
<<<<<<< HEAD
  ./start-kali.sh
=======
  ./start-parrot.sh
>>>>>>> bf10095234744af9c87e60e3d06a7f7289f368e4
fi
